
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  # really good guide to svgs: http://tympanus.net/codrops/2013/11/27/svg-icons-ftw/
  
  makeRowOfHearts <- function(rowLength){
    res <- "<svg height=\"50\" width=\"50\" viewBox=\"0 0 50 50\">
              <path id=\"heart-icon\" d=\"M16,28.261c0,0-14-7.926-14-17.046c0-9.356,13.159-10.399,14-0.454c1.011-9.938,14-8.903,14,0.454C30,20.335,16,28.261,16,28.261z\" style=\"height:1;width:1;fill:#ccc;\" />
          </svg>"
    res <- paste0(paste0(rep(res, rowLength), collapse = ""), "<div></div>")
    return(res)
  }
  
  makeRowsOfHearts <- function(numberRows){
    res <- paste0(rep(makeRowOfHearts(10), numberRows), collapse = "")
    return(res)
  }
  
  makeHeartsPlot <- function(heartCount){
    rowsOfHearts <- heartCount %/% 10
    leftOver <- heartCount %% 10
    
    res <- paste0(makeRowsOfHearts(rowsOfHearts),
                  ifelse(leftOver>0, paste0("<div></div>", makeRowOfHearts(leftOver)), ""))
    return(res)
  }
  
  # model to predict probabilities
  predictProbs <- function(something){
    return(1)
  }
  
  ### actual script starts here
  heartCount <- round(predictProbs(input$something) * 100)
  output$hearts <- renderUI(makeHeartsPlot(heartCount), quoted = TRUE) # FIX ME

  
  
})
