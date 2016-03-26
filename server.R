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
    
    dataset$amt <- amtSet[,input$time];
  });
  
  output$mrtPlot <- renderPlot({
    p <- ggmap(mnl);
    p <- p + geom_point(data=stationLocs, aes(x = lon, y = lat, color = "red", size = 5));
    p
  })
})