library(shiny)
library(ggplot2);
library(ggmap);

shinyServer(function(input, output) {
  selectedData <- reactive({
    dataset <- stationLocs;
    
    amtSet <- if (input$entry == "Entry") {
      mrtEntry;
    } else {
      mrtExit;
    }
    
    colnames(amtSet) <- 1:20;
    
    dataset$amt <- amtSet[,input$time];
    dataset;
  });
  
  output$mrtPlot <- renderPlot({
    p <- ggmap(mnl);
    p <- p + geom_point(data=selectedData(), aes(x = lon, y = lat, color = amt));
    p
  })
})