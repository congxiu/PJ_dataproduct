shinyUI(fluidPage(
  titlePanel('Assets Comparison'),
  
  sidebarLayout(
    sidebarPanel(
      helpText('Select asset(s), source, and date range. 
               If the price range of the 2 assets are close enough, 
               they will be plot together for comparison, otherwise 
               they will be plot separatly. Try "SPY", "GOOG", 
               "IBM".'),
      
      textInput('symb1', 'Asset1', 'SPY'),
      
      textInput('symb2', 'Asset2'),
      
      selectInput('src', label = 'data source', 
                  choices = list('yahoo' = 'yahoo', 
                                 'google' = 'google',
                                 'FRED' = 'FRED'), 
                  selected = 'yahoo'),
      
      dateRangeInput('dates', label = 'Date Range', 
                     start = "2013-01-01", 
                     end = as.character(Sys.Date())),
      
      p(em("Documentation:",a("Assets Comparison",href="readme.html")))
      
      
      ),
    mainPanel(
      textOutput('allsymb'),
      
      textOutput('dates'),
      
      plotOutput('plot'), 
      
      plotOutput('plot2')
              
      
      )
    )
  ))