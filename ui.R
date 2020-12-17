library(shiny)

fluidPage(
  titlePanel("Impact of Driving Distance on Strokes Gained Over Time"),
  sidebarLayout(
    sidebarPanel(
      selectizeInput(inputId = "blastoff",
                     label = "top_n drivers of the 200 players on the PGA Tour",
                     choices = c(10,20,30,40,50))
    ),
    mainPanel(
      fluidRow(
        column(6, plotOutput("blast")),
        column(6, plotOutput("touch")),
        column(6, plotOutput("total"))
        
      )
    )
  )
)



