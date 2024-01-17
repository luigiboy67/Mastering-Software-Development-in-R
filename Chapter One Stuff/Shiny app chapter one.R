
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(
    title = "Chapter One"
  ),
  dashboardSidebar(
                   sidebarMenu(id = "sidebar",
    menuItem(text = "1.1", tabName = "CrashCourse", icon = icon("th"),
             menuSubItem("Preface", tabName = "Pref1"),
             menuSubItem("1.1.1", tabName = "Evaluation"), 
             menuSubItem("1.1.2", tabName = "RObjects"),
             menuSubItem("1.1.3", tabName = "Numbers"),
             menuSubItem("1.1.4", tabName = "CreatingVectors"),
             menuSubItem("1.1.5", tabName = "MixingObjects"),
             menuSubItem("1.1.6", tabName = "ExplicitCoercion"),
             menuSubItem("1.1.7", tabName = "Matrices"),
             menuSubItem("1.1.8", tabName = "Lists"),
             menuSubItem("1.1.9", tabName = "Factors"),
             menuSubItem("1.1.10", tabName = "MissingValues"),
             menuSubItem("1.1.11", tabName = "DataFrames"),
             menuSubItem("1.1.12", tabName = "Names"),
             menuSubItem("1.1.13", tabName = "Attributes"),
             menuSubItem("1.1.14", tabName = "Summary")
             ),
    menuItem(text = "1.2", tabName = "ImportanceOfTidyData", icon = icon("th"),
             menuSubItem("Preface", tabName = "Pref1"),
             menuSubItem("1.2.1", tabName = "TheTidyverse")
             ),
    menuItem(text = "1.3", tabName = "RegualarTabularData", icon = icon("dashboard")),
    menuItem(text = "1.4", tabName = "Reading Web-Based Data", icon = icon("dashboard"),
             menuSubItem("Preface", tabName = "Pref4"),
             menuSubItem("1.4.1", tabName = "FlatFiles"),
             menuSubItem("1.4.2", tabName = "RequestingData"),
             menuSubItem("1.4.3", tabName = "ScrapingWeb"),
             menuSubItem("1.4.4", tabName = "ParsingJSON")
             ),
    menuItem(text = "1.5", tabName = "BasicDataManipulation", icon = icon("dashboard"),
             menuSubItem("Preface", tabName = "Pref5"),
             menuSubItem("1.5.1", tabName = "Piping"),
             menuSubItem("1.5.2", tabName = "SummarizingData"),
             menuSubItem("1.5.3", tabName = "SelectingData"),
             menuSubItem("1.5.4", tabName = "AddingChanging"),
             menuSubItem("1.5.5", tabName = "SpreadingGathering"),
             menuSubItem("1.5.6", tabName = "MergingDatasets")
             ),
    menuItem(text = "1.6", tabName = "WorkingWithDatesTime", icon = icon("dashboard"),
             menuSubItem("Preface", tabName = "Pref6"),
             menuSubItem("1.6.1", tabName = "ConvertingDate"),
             menuSubItem("1.6.2", tabName = "PullingDate"),
             menuSubItem("1.6.3", tabName = "WorkingZones")
             ),
    menuItem(text = "1.7", tabName = "TextProcessing",icon = icon("dashboard"),
             menuSubItem("Preface", tabName = "Pref7"),
             menuSubItem("1.7.1", tabName = "TextManipulation"),
             menuSubItem("1.7.2", tabName = "RegularExpression"),
             menuSubItem("1.7.3", tabName = "RegexFunctions"),
             menuSubItem("1.7.4", tabName = "StringrPackage"),
             menuSubItem("1.7.5", tabName = "Summary")
             ),
    menuItem(text = "1.8", tabName = "TheRoleOfPhysicalMemory", icon = icon("dashboard"),
             menuSubItem("Preface", tabName = "Pref8"),
             menuSubItem("1.8.1", tabName = "BackEnvelope"),
             menuSubItem("1.8.2", tabName = "InternalMemory")
             ),
    menuItem(text = "1.9", tabName = "WorkingWithLargeDatasets", icon = icon("dashboard"),
             menuSubItem("Preface", tabName = "Pref9"),
             menuSubItem("1.9.1", tabName = "InMemory"),
             menuSubItem("1.9.2", tabName = "OutOfMemory")),
    menuItem(text = "1.10", tabName = "DiagnosingProblemsf", icon = icon("dashboard"),
             menuSubItem("Preface", tabName = "Pref10"),
             menuSubItem("1.10.1", tabName = "HowToGoogle"),
             menuSubItem("1.10.2", tabName = "AskingForHelp"))
  )),
  dashboardBody(
    tabItems(
      tabItem(tabName = "Pref1",
              h3("Learning objectives for this section are to:"),
              p("Develop fluency in using R at the console"),
              p("Execute basic arithmetic operations"),
              p("Subset and index R objects"),
              p("Remove missing values from an R object"),
              p("Modify object attributes and metadata"),
              p("Describe differences in different R classes and data types")
              ),
      tabItem(tabName = "Evaluation",
              p("At the R prompt we type expressions. The <- symbol (gets arrow) is the assignment operator"),
              textInput("txtone", NULL, "x <- 1"),
              textInput("txttwo", NULL, "print(x)"),
              textInput("txtthree", NULL, "x"),
              textInput("txtfour", NULL, "msg <- 'hello '"),
              verbatimTextOutput("msgforx"),
              verbatimTextOutput("msgfory"),
              verbatimTextOutput("msgforz"),
              verbatimTextOutput("msgfora")
              )
    )
  )
)

server <- function(input, output, session) {
  output$msgforx <- renderPrint(input$txtone)
  output$msgfory <- renderPrint(input$txttwo)
  output$msgforz <- renderPrint(input$txtthree)
  output$msgfora <- renderPrint(input$txtfour)
}

shinyApp(ui, server)

