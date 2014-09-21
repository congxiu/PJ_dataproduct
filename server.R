library(quantmod)
source("helpers.R")

shinyServer(function(input, output){
   output$allsymb <- renderText({paste('Data:', 
                                       input$symb1, ',', 
                                       input$symb2)})
   
   output$dates <- renderText({
     paste('From', input$dates[1], 'to', input$dates[2])
   })
  
   
     data <- reactive({
       if (input$symb2 == ''){
       p1 <- getSymbols(input$symb1, src = input$src, 
                  from = input$dates[1], to = input$dates[2],
                  auto.assign = FALSE)
       list('a' = p1, 'b' = NULL)
       }
       else{
         p1 <- getSymbols(input$symb1, src = input$src, 
                          from = input$dates[1], to = input$dates[2],
                          auto.assign = FALSE)
         p2 <- getSymbols(input$symb2, src = input$src, 
                          from = input$dates[1], to = input$dates[2],
                          auto.assign = FALSE)
         p3 <- as.xts(merge(p1, p2))
        temp  <- abs(range(p2[, dim(p2)[[2]]], na.rm = TRUE) - 
           range(p1[, dim(p1)[[2]]], na.rm = TRUE)) > 100
        logi <- temp[[1]] && temp[[2]]
         if (logi)
           list('a' = p1, 'b' = p2)
         else
           list('a' = p3, 'b' = NULL)
       }
       })
   
   output$plot <- renderPlot({
     if(!is.null(data()[[1]]))
     chartSeries(data()[[1]])
   })
   
   output$plot2 <- renderPlot({
     if(!is.null(data()[[2]]))
     chartSeries(data()[[2]])
   })
})