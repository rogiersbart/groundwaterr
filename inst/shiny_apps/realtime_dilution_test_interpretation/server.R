library(shiny)
library(ggplot2)
vs <- c(0.01E-3,0.1E-3,1E-3,1E-2,1E-1,1)/60
vs_labs <- c('0.01 mm/h','0.1 mm/h','1 mm/h','1 cm/h','1 dm/h','1 m/h')

shinyServer(function(input, output) {
  output$dilution_plot <- renderPlot({
    if(!is.null(input$dat$datapath)) {
      dat <- read.csv(input$dat$datapath,skip=15) # TODO: update with readr::read_csv!
      date_format <- ifelse(is.na(as.numeric(substr(dat$Date[1],1,4))),"%d-%m-%Y %H:%M:%S","%Y-%m-%d %H:%M:%S")
      dat$time <- as.POSIXct(paste(dat$Date,dat$Time), format = date_format)
      dat <- data.frame(x=as.numeric(difftime(dat$time,dat$time[1],units='mins')),y=as.numeric(dat$CONDUCTIVITY))
    }
    
    ct <- function(x,diam,head,v,flength,hoseDiam,hoseLength) {
      x <- x - input$start_time
      exp(-diam*v*flength/(pi*head*(diam/2)^2 + (pi*(hoseDiam/2)^2*hoseLength))*x) *  (input$starting_ec - input$initial_ec) + input$initial_ec
    }
    v <- input$qapp/100/60 # m / min
    diam <- input$diam/100*ifelse(input$diam_unit=='inch',2.54,1) # m
    head <- input$water_column # m
    flength <- input$filter_length # m
    hoseDiam <- input$hose_diam/100*ifelse(input$hose_diam_unit=='inch',2.54,1) # m
    hoseLength <- input$hose_length # m
    p <- ggplot(NULL,aes(x=c(input$x_min, input$x_max)))+ stat_function(fun = ct, geom = "line",args=list(diam=diam,v=v,head=head,flength=flength,hoseDiam=hoseDiam,hoseLength=hoseLength))+
      xlab('Time (min)')+
      ylab('Electrical conductivity (uS/cm)') +
      scale_x_continuous(minor_breaks=seq(0,7200,ifelse(diff(range(c(input$x_min, input$x_max))) <= 60*24,15,60)),breaks=seq(0,7200,ifelse(diff(range(c(input$x_min, input$x_max))) <= 60*24,60,60*24)))+
      coord_cartesian(xlim=c(input$x_min, input$x_max),ylim=c(input$y_min, input$y_max))+
      guides(size = FALSE)

    for(i in 1:length(vs)) p <- p + stat_function(fun=ct,args=list(diam=diam,v=vs[i],head=head,flength=flength,hoseDiam=hoseDiam,hoseLength=hoseLength),colour='gray')
    for(i in 1:(length(vs)-1)) p <- p + stat_function(fun=ct,args=list(diam=diam,v=vs[i]*2,head=head,flength=flength,hoseDiam=hoseDiam,hoseLength=hoseLength),linetype='dashed',colour='gray')
    for(i in 1:(length(vs)-1)) p <- p + stat_function(fun=ct,args=list(diam=diam,v=vs[i]*3,head=head,flength=flength,hoseDiam=hoseDiam,hoseLength=hoseLength),linetype='dashed',colour='gray')
    for(i in 1:(length(vs)-1)) p <- p + stat_function(fun=ct,args=list(diam=diam,v=vs[i]*4,head=head,flength=flength,hoseDiam=hoseDiam,hoseLength=hoseLength),linetype='dashed',colour='gray')
    for(i in 1:(length(vs)-1)) p <- p + stat_function(fun=ct,args=list(diam=diam,v=vs[i]*5,head=head,flength=flength,hoseDiam=hoseDiam,hoseLength=hoseLength),linetype='dashed',colour='gray')
    for(i in 1:(length(vs)-1)) p <- p + stat_function(fun=ct,args=list(diam=diam,v=vs[i]*6,head=head,flength=flength,hoseDiam=hoseDiam,hoseLength=hoseLength),linetype='dashed',colour='gray')
    for(i in 1:(length(vs)-1)) p <- p + stat_function(fun=ct,args=list(diam=diam,v=vs[i]*7,head=head,flength=flength,hoseDiam=hoseDiam,hoseLength=hoseLength),linetype='dashed',colour='gray')
    for(i in 1:(length(vs)-1)) p <- p + stat_function(fun=ct,args=list(diam=diam,v=vs[i]*8,head=head,flength=flength,hoseDiam=hoseDiam,hoseLength=hoseLength),linetype='dashed',colour='gray')
    for(i in 1:(length(vs)-1)) p <- p + stat_function(fun=ct,args=list(diam=diam,v=vs[i]*9,head=head,flength=flength,hoseDiam=hoseDiam,hoseLength=hoseLength),linetype='dashed',colour='gray')
    p <- p + geom_text(aes(x=rep(mean(c(input$x_min, input$x_max)),length(vs)),y=ct(x=mean(c(input$x_min, input$x_max)),diam=diam,v=vs,head=head,flength=flength,hoseDiam=hoseDiam,hoseLength=hoseLength),label=vs_labs),data=NULL,vjust=1,hjust=.5,colour='darkgray',size=4)
    if(!is.null(input$dat$datapath)) p <- p+geom_point(aes(x=x,y=y),data=dat)
    print(p)
  })
})