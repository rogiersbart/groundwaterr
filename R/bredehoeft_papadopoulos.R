tempToFlow <- function(depth, temperature, boundaries, lambda=3.5, c0=4186, rho0=1000, gamma=1/3000, include.horizontal=F)
{
    originalTemperature <- temperature
    temperature <- smooth.spline(depth,temperature,df=15)$y
    n <- length(boundaries) -1
    lambdaTz <- rep(NA,n)
    if(length(lambda)==1) lambda <- rep(lambda,n)
    if(length(gamma)==1) gamma <- rep(gamma,n)
    if(!include.horizontal)
    {
        flowProfile <- data.frame(from=rep(NA,n), to=rep(NA,n), vz=rep(NA,n), beta=rep(NA,n))
        for(i in 1:n)
        {
            flowProfile$from[i] <- boundaries[i]
            flowProfile$to[i] <- boundaries[i+1]
            if(max(depth) >= flowProfile$from[i])
            {
                nInterval <- which(depth >= flowProfile$from[i] & depth <= flowProfile$to[i])
                intervalDepth <- depth[nInterval]
                intervalTemperature <- temperature[nInterval]
                flowProfile$beta[i] <- optimize(f=betaFitRMSE, interval=c(-1000,1000), depth=intervalDepth, temperature=intervalTemperature)$minimum
                flowProfile$vz[i] <- lambda[i]*flowProfile$beta[i]/(c0*rho0*(max(intervalDepth)-min(intervalDepth)))
            }  
        }    
    } else {
        flowProfile <- data.frame(from=rep(NA,n), to=rep(NA,n), vz=rep(NA,n), beta=rep(NA,n), alpha=rep(NA,n), vx=rep(NA,n))
        for(i in 1:n)
        {
            flowProfile$from[i] <- boundaries[i]
            flowProfile$to[i] <- boundaries[i+1]
            if(max(depth) >= flowProfile$from[i])
            {
                nInterval <- which(depth >= flowProfile$from[i] & depth <= flowProfile$to[i])
                intervalDepth <- depth[nInterval]
                intervalTemperature <- temperature[nInterval]
                #print(lambdaTz)
                #print((intervalTemperature))
                lambdaTz[i] <- (intervalTemperature[length(intervalTemperature)] - intervalTemperature[1])/(intervalDepth[length(intervalDepth)]-intervalDepth[1])
                #print(lambdaTz)
                optimization<- optim(par=c(0.01,0.01),fn=deltaBetaFitRMSE, gr=NULL,
                                     depth=intervalDepth, temperature=intervalTemperature,
                                     gamma=gamma[i], lambdaTz=lambdaTz[i], method='L-BFGS-B',
                                     lower=-100,upper=100) 
                optimResult <- optimization$par
                #print(optimization$convergence)
                flowProfile$alpha[i] <- optimResult[1]*optimResult[2]*lambdaTz[i]/gamma[i]
                flowProfile$beta[i] <- optimResult[2]
                flowProfile$vz[i] <- lambda[i]*flowProfile$beta[i]/(c0*rho0*(max(intervalDepth)-min(intervalDepth)))
                flowProfile$vx[i] <- lambda[i]*flowProfile$alpha[i]/(c0*rho0*(max(intervalDepth)-min(intervalDepth)))
            }  
        }    
    }
    return(flowProfile)
}
deltaBetaFitRMSE <- function(deltaBeta, depth, temperature, gamma, lambdaTz)
{
  #print(deltaBeta)
  delta <- deltaBeta[1]; beta <- deltaBeta[2]
  zL <- (depth - min(depth))/max(depth - min(depth))
  f <- (exp(beta*zL)-1)/(exp(beta)-1)
  if(beta==0){delta <- 0; f <- zL}
  fittedTemp <- ((1+delta)*(f-zL)+zL)*(temperature[which.max(depth)]-temperature[which.min(depth)]) + temperature[which.min(depth)]
  rmse <- sqrt(mean((fittedTemp - temperature)^2))
  #print(rmse)
  return(rmse)
}
betaFitRMSE <- function(beta, depth, temperature)
{
    z <- depth - min(depth)
    fittedTemp <- (temperature[which.min(depth)] + (temperature[which.max(depth)]-temperature[which.min(depth)])*(exp(beta*z/max(z))-1)/(exp(beta)-1) )
    rmse <- sqrt(mean((fittedTemp - temperature)^2))
    return(rmse)
}