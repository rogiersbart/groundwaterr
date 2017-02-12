library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel('Realtime dilution test interpretation app'),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    
    # sidebar panel
      sidebarPanel(position = 'right',width=5,
        fileInput('dat', ''),
        column(3,numericInput('diam', 'diameter', value = 7.62)),
        column(3,selectInput('diam_unit', 'unit', choices = list('cm','inch'))),
        column(3,numericInput('filter_length', 'filter length', value = 4)),
        column(3,selectInput('filter_length_unit', 'unit', choices = list('m'))),
        column(3,numericInput('hose_diam', 'hose diam', value = 1.27)),
        column(3,selectInput('hose_diam_unit', 'unit', choices = list('cm','inch'))),
        column(3,numericInput('hose_length', 'hose length', value = 5)),
        column(3,selectInput('hose_length_unit', 'unit', choices = list('m'))),
        column(3,numericInput('water_column', 'water col', value = 8)),
        column(3,selectInput('water_column_unit', 'unit', choices = list('m'))),
        column(3,numericInput('start_time', 'start time', value = 0)),
        column(3,selectInput('start_time_unit', 'unit', choices = list('min'))),
        column(3,numericInput('starting_ec', 'start ec', value = 2500)),
        column(3,selectInput('starting_ec_unit', 'unit', choices = list('uS/cm'))),
        column(3,numericInput('initial_ec', 'init ec', value = 200)),
        column(3,selectInput('initial_ec_unit', 'unit', choices = list('uS/cm'))),
        column(6,numericInput('qapp', 'apparent q', value = 2)),
        column(6,selectInput('qapp_unit', 'unit', choices = list('cm/h'))),
        sliderInput('xlim','x axis limits',min=0,max=5*60*24, value = c(0, 6*60)),
        sliderInput('ylim','y axis limits',min=0,max=5000, value = c(0, 2500))
      ),
    
    # main panel
      mainPanel(width=7,
        plotOutput("dilution_plot", width = '100%', height = '600px')
      )
  )
))