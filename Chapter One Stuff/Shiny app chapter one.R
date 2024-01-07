library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(
    title = "Chapter One"
  ),
  dashboardSidebar(sidebarMenu(
    id = "sidebar",
    menuItem("1.1", tabName = "CrashCourse", icon = icon("dashboard")),
    menuItem("1.2", tabName = "ImportanceOfTidyData", icon = icon("dashboard")),
    menuItem("1.3", tabName = "RegualarTabularData", icon = icon("dashboard")),
    menuItem("1.4", tabName = "Reading Web-Based Data", icon = icon("dashboard")),
    menuItem("1.5", tabName = "BasicDataManipulation", icon = icon("dashboard")),
    menuItem("1.6", tabName = "WorkingWithDatesTime", icon = icon("dashboard")),
    menuItem("1.7", tabName = "TextProcessing",icon = icon("dashboard")),
    menuItem("1.8", tabName = "TheRoleOfPhysicalMemory", icon = icon("dashboard")),
    menuItem("1.9", tabName = "WorkingWithLargeDatasets", icon = icon("dashboard")),
    menuItem("1.10", tabName = "DiagnosingProblemsf", icon = icon("dashboard")),
  )),
  dashboardBody()
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
