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
      menuItem("Data Collection", tabName = "Data", icon = icon("database")),
      menuItem("Resources", tabName = "Resources", icon = icon("database")),
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
                    tags$h1("Principles of Golf: Power and Precision")
                  )),
                fluidRow(
                  column(
                    width = 12,
                    tags$h2("Types of Golf Shots"),
                    tags$h3("TEE TO GREEN"),
                    br(),
                    img(src = "https://nycdsa-blog-files.s3.us-east-2.amazonaws.com/2020/12/abhi-singh/teetogreen-387948-ljJhtKVQ-1536x731.png",
                        width = "800", height = "500"),
                    br(),
                    br(),
                    br(),
                    tags$h3("Swing"),
                    br(),
                    img(src = "https://www.bentwater.com/Images/Library/MensGolfClinic.jpg",
                        width = "800", height = "350"),
                    br(),
                    br(),
                    tags$h3("Swing Compromises"),
                    br(),
                    img(src = "https://nycdsa-blog-files.s3.us-east-2.amazonaws.com/2020/12/abhi-singh/assumptions-155904-AsvDnTmc-1536x680.png",
                        width = "800", height = "500"),
                    br(),
                    br(),
                    br(),
                    tags$h3("Putting"),
                    br(),
                    img(src = "https://nycdsa-blog-files.s3.us-east-2.amazonaws.com/2020/12/abhi-singh/puttingsg-267484-F2XJ7lwk-1536x698.png",
                        width = "650", height = "400"),
                    br(),
                    br(),
                    br(),
                    tags$h3("Putting Motion"),
                    br(),
                    img(src = "https://meandmygolf.com/wp-content/uploads/2017/03/putting-2.png",
                        width = "650", height = "400")
                  )
                )
              ),
        
        tabItem(tabName = "SG",
                fluidRow(
                  column(
                    width = 9, 
                    tags$h1("Principles of Strokes Gained")
                  )),
                fluidRow(
                  column(
                    width = 12,
                    tags$h3("Scenario Benefitting the Longer Hitter"),
                    br(),
                    img(src = "https://nycdsa-blog-files.s3.us-east-2.amazonaws.com/2020/12/abhi-singh/drivingdistanceovertime-476192-WWrMKBQA-1536x757.png",
                        width = "800", height = "500"),
                    br(),
                    br(),
                    br(),
                    tags$h3("Scenario Benefitting the Accurate Hitter"),
                    br(),
                    img(src = "https://nycdsa-blog-files.s3.us-east-2.amazonaws.com/2020/12/abhi-singh/strokeslost-055536-tc6Lk97R-1536x750.png",
                        width = "800", height = "500"),
                    br(),
                    br(),
                    tags$h2("Do longer hitters of the ball reach the green quicker than more accurate hitters of the ball on average?"),
                    br(),
                    br(),
                    br(),
                    img(src = "https://lh3.googleusercontent.com/proxy/pfj4Ga4T3pNdNi24BtWGItiCD9EkdOAxqKsctyk2KEaXf5V--VFka09aE5FCkTsUX8PxLpFbcvqnUPKwEw0R-Lo0SIQy501uYHz7XwBZYA",
                        width = "413", height = "127"),
                    br(),
                    tags$h2("Strokes Gained (+/-): T2G (Tee-To-Green)"),
                    tags$h3("The number of Strokes from the tee to the green the player was better or worse than the field average."),
                    br(),
                    br()
                  )
                )
        ),  
        tabItem(tabName = "TTG",
                fluidRow(
                  column(
                    width = 9, 
                    tags$h1("Impact of Driving Distance on Strokes Gained: T2G Over Time (2004-2018)")
                  )),
                fluidRow(
                  plotlyOutput("blastNoReg"),
                  plotlyOutput("blast")
                  )
              
                ),
        
        tabItem(tabName = "putting", 
                fluidRow(
                  column(
                    width = 9, 
                    tags$h1("Impact of Driving Distance on Putting Over Time (2004-2018)")
                  )
                ),
  
                fluidRow(
                  plotlyOutput("touchNoReg"),
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
        ),
        tabItem(tabName = "Data", 
                fluidRow(
                  column(
                    width = 9, 
                    tags$h1("Data Collection using Table Capture Tool")
                  )),
                fluidRow(
                  column(
                    width = 12,
                    tags$h3("For Strokes Gained"),
                    br(),
                    img(src = "https://nycdsa-blog-files.s3.us-east-2.amazonaws.com/2020/12/abhi-singh/strokesgainddata-106072-wrr8fp93.png",
                        width = "800", height = "500"),
                    br(),
                    br(),
                    br(),
                    tags$h3("For Driving Distance"),
                    br(),
                    img(src = "https://nycdsa-blog-files.s3.us-east-2.amazonaws.com/2020/12/abhi-singh/drivingdata-636813-Ny5bpefU.png",
                        width = "800", height = "500"),
                    br(),
                    br()
                  )
                )
        ),
        tabItem(tabName = "Resources", 
              tags$a(href="https://github.com/abhisingh-sendit/Shiny", "Shiny Source Code on Github"),
              br(),
              tags$a(href="https://nycdatascience.com/blog/student-works/drive-to-survive-pga-tour/", "Blog Post for NYC Data Science Academy")
              )
                  
      )
    )
  )
      
    
  



