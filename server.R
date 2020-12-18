library(shiny)
library(dplyr)
library(tidyr)
library(ggplot2)
library(ggpubr)
library(googleVis)
library(ECharts2Shiny)

function(input, output) {
  topdrive_func <- reactive({ 
    drive %>% 
       arrange(desc(AVG.)) %>% 
       group_by(YEAR) %>% slice(1:input$blastoff) %>% merge(., strokesGained, by=c("PLAYER.NAME", "YEAR")) 
  })
    
  topdrivers <- reactive({
    topdrive_func() %>% group_by(YEAR) %>% summarise(AVG.SG.T2G = mean(TOTAL.SG.T2G))
  })
  
  totalstrokesgainedDriversStrong <- reactive({
    topdrive_func() %>% filter(YEAR==2018) %>% summarise(name = "TOP.N.DRIVERS", value = sum(TOTAL.SG.T2G)) %>% select(name, value)
  })
  
  totalstrokesgainedDriversWeak <- reactive({
    topdrive_func() %>% filter(YEAR==2004) %>% summarise(name = "TOP.N.DRIVERS", value = sum(TOTAL.SG.T2G)) %>% select(name, value)
  })
  
  combinedStrong <- reactive({
    totalstrokesgainedDriversStrong() %>% rbind(strokesGainedStrong)
  })
  
  combinedWeak <- reactive({
    totalstrokesgainedDriversWeak() %>% rbind(strokesGainedWeak)
  })
  
  # Create Data
  data <- data.frame(
    group=LETTERS[1:5],
    value=c(13,7,9,21,2)
  )
  
  output$pastPie <- renderPlotly(
    combinedWeak() %>% ggplot(aes(x=as.factor(name), y=value, fill = name)) + 
      geom_bar(stat = "identity", width = .5) + labs(title = "Previous ERA (2002-2010)", subtitle = "The proportion of Strokes Gained from T2G Captured by the Top N Drivers") +
      labs(x = "Category", y = "Strokes Gained: T2G", fill = "Category")
  )
  
  output$futurePie <- renderPlotly(
    combinedStrong() %>% ggplot(aes(x=as.factor(name), y=value, fill = name)) + 
      geom_bar(stat = "identity", width = .5) + labs(title = "Modern ERA (2010-2018)", subtitle = "The proportion of Strokes Gained from T2G Captured by the Top N Drivers") +
      labs(x = "Category", y = "Strokes Gained: T2G", fill = "Category")
    
  )

  
  output$blast <- renderPlotly(
    topdrivers() %>%
      ggplot(aes(x = YEAR, y = AVG.SG.T2G)) + geom_point() +
      ggtitle("Average drive") + geom_smooth(method = "lm", se = FALSE) + stat_cor(label.x = 2005, label.y = 45) + stat_regline_equation(label.x = 2005, label.y = 40)
  )
  
  topdrivers_putting <- reactive({
    topdrive_func() %>% group_by(YEAR) %>% summarise(AVG.SG.P = mean(TOTAL.SG.P))
  })
  
  output$touch <- renderPlotly(
    topdrivers_putting() %>%
      ggplot(aes(x = YEAR, y =AVG.SG.P)) + geom_point() +
      ggtitle("Average putting") + geom_smooth(method = "lm", se = FALSE) + stat_cor(label.x = 2005, label.y = 45) + stat_regline_equation(label.x = 2005, label.y = 40)
  )
  
  topdrivers_total <- reactive({
    topdrive_func() %>% group_by(YEAR) %>% summarise(AVG.SG.T = mean(TOTAL.SG.T))
  })
  
  output$total <- renderPlotly(
    topdrivers_total() %>%
      ggplot(aes(x = YEAR, y =AVG.SG.T)) + geom_point() +
      ggtitle("Average total") + geom_smooth(method = "lm", se = FALSE) + stat_cor(label.x = 2005, label.y = 45) + stat_regline_equation(label.x = 2005, label.y = 40)
  )
  
  output$timeanal <- renderPlotly(
    driveOverTime %>% ggplot(aes(x = YEAR, y = AVERAGE)) + geom_line() + ggtitle("Driving Over Time")
  )
    
    
    
}
    
