library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Metro Rail Transit Usage (Hourly)"),
  sidebarPanel(
    selectInput('entry', 'Entry/Exit', levels(perHour$Entry.Exit)),
    selectInput('time', 'Time', timeSlices)
  ),
  mainPanel(
    plotOutput('mrtPlot')
  )
))