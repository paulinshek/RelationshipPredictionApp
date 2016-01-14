
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shinydashboard)
library(shiny)

dashboardPage(
  dashboardHeader(title = "Explore our analysis here"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("See some prepopulated surveys", tabName = "prepopulated"),
      menuItem("Answer the survey yourself!", tabName = "survey")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "prepopulated","Hi, prepopulated goes here"),
      tabItem(tabName = "survey", 
              uiOutput(textOutput(outputId = "hearts"))
              )
    )
    
  )
)