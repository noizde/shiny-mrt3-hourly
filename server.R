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
    p + geom_point(data=selectedData(), aes(x = lon, y = lat, color = amt, size = 5)) + 
      scale_color_gradientn(limits = c(0,7000), colours=c("navyblue", "darkmagenta", "darkorange1"));
  })
})