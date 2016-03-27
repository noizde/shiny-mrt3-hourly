library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Metro Rail Transit Usage (Hourly)"),
  sidebarPanel(
    div("Choose to visualize station origins (entry), destinations (exit), and the hour to show on the map."),
    hr(),
    selectInput('entry', 'Entry/Exit', levels(perHour$Entry.Exit)),
    selectInput('time', 'Time', choices = timeSlices)
  ),
  mainPanel(
    plotOutput('mrtPlot'),
    div("Please allow some time for loading the map.")
  )
))