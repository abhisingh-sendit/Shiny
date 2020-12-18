library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "Drive to Survive"),
  dashboardSidebar(
     sidebarMenu(
      menuItem("Principles of Golf", tabName = "Golf", icon = icon("info")),
      menuItem("Principles of Strokes Gained", tabName = "SG", icon = icon("info")),
      menuItem("Tee to Green", tabName = "TTG", icon = icon("flag")),
      menuItem("Putting", tabName = "putting", icon = icon("flag")),
      menuItem("Driving Distance Over Time", tabName = "DDT", icon = icon("globe")),
      menuItem("Impact of Driving over Time", tabName = "IDT", icon = icon("globe")),
      br(),
      br(),
      br(),
      selectizeInput(inputId = "blastoff",
                     label = "top_n drivers of the 200 players on the PGA Tour",
                     choices = c(10,20,30,40,50)
                     )
    )
  ),
    dashboardBody(
      tabItems(
        tabItem(tabName = "Golf",
                fluidRow(
                  column(
                    width = 9, 
                    tags$h1("Principles of Golf")
                  )),
                fluidRow(
                  column(
                    width = 6,
                    tags$h3("Introduction to the Sport"),
                    tags$p("Let's get a baseline for golf"),
                    br()))
        ),
        
        tabItem(tabName = "SG",
                fluidRow(
                  column(
                    width = 9, 
                    tags$h1("Principles of Strokes Gained")
                  )),
                fluidRow(
                  column(
                    width = 6,
                    tags$h3("Introduction to Strokes Gained"),
                    tags$p("Let's get a baseline for Strokes Gained"),
                    br()
                  )),
        ),  
        tabItem(tabName = "TTG",
                fluidRow(
                  column(
                    width = 9, 
                    tags$h1("Impact of Driving Distance on Tee To Green strokes Over Time")
                  )),
                fluidRow(
                  plotlyOutput("blast")
                  )
              
                ),
        
        tabItem(tabName = "putting", 
                fluidRow(
                  column(
                    width = 9, 
                    tags$h1("Impact of Driving Distance on Putting Over Time")
                  )
                ),
  
                fluidRow(
                  plotlyOutput("touch")
                )
                
        ),
        

        tabItem(tabName = "DDT", 
                fluidRow(
                  plotlyOutput("timeanal")
                )
        ),
        
        tabItem(tabName = "IDT", 
                fluidRow(
                  plotlyOutput("pastPie"),
                  plotlyOutput("futurePie")
                )
        )
        
      )
    )
  )
      
    
  



