library(shiny)
library(dplyr)
library(tidyr)
library(ggplot2)
library(ggpubr)

function(input, output, session) {
  drive_func <- reactive({ 
    drive %>% 
       arrange(desc(AVG.)) %>% 
       group_by(YEAR) %>% slice(1:input$blastoff) %>% merge(., strokesGained, by=c("PLAYER.NAME", "YEAR")) 
  })
    
  topdrivers <- reactive({
    drive_func() %>% group_by(YEAR) %>% summarise(AVG.SG.T2G = mean(TOTAL.SG.T2G))
  })
  
  output$blast <- renderPlot(
    topdrivers() %>%
      ggplot(aes(x = YEAR, y = AVG.SG.T2G)) + geom_point() +
      ggtitle("Average drive") + geom_smooth(method = "lm", se = FALSE) + stat_cor(label.x = 2005, label.y = 45) + stat_regline_equation(label.x = 2005, label.y = 40)
  )
  
  topdrivers_putting <- reactive({
    drive_func() %>% group_by(YEAR) %>% summarise(AVG.SG.P = mean(TOTAL.SG.P))
  })
  
  output$touch <- renderPlot(
    topdrivers_putting() %>%
      ggplot(aes(x = YEAR, y =AVG.SG.P)) + geom_point() +
      ggtitle("Average putting") + geom_smooth(method = "lm", se = FALSE) + stat_cor(label.x = 2005, label.y = 45) + stat_regline_equation(label.x = 2005, label.y = 40)
  )
  
  topdrivers_total <- reactive({
    drive_func() %>% group_by(YEAR) %>% summarise(AVG.SG.T = mean(TOTAL.SG.T))
  })
  
  output$total <- renderPlot(
    topdrivers_total() %>%
      ggplot(aes(x = YEAR, y =AVG.SG.T)) + geom_point() +
      ggtitle("Average total") + geom_smooth(method = "lm", se = FALSE) + stat_cor(label.x = 2005, label.y = 45) + stat_regline_equation(label.x = 2005, label.y = 40)
  )

}


