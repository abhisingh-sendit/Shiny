library(tidyverse)
library(plotly)
library(DT)
library(shinydashboard)
library(shiny)
library(shinythemes)


######Driving over time
driveOverTime <- read.csv("DrivingAverageOverTime.csv") 

##################################################################################################
#############################################################
#################################
################
#####
##
#Read Driving Distance, clean the rank column

drive <- read.csv("DrivingSummary/DrivingDistance.csv") %>% mutate(., YEAR = 2020)
drive <- read.csv("DrivingSummary/DrivingDistance (1).csv") %>% mutate(., YEAR = 2019) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (2).csv") %>% mutate(., YEAR = 2018) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (3).csv") %>% mutate(., YEAR = 2017) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (4).csv") %>% mutate(., YEAR = 2016) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (5).csv") %>% mutate(., YEAR = 2015) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (6).csv") %>% mutate(., YEAR = 2014) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (7).csv") %>% mutate(., YEAR = 2013) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (8).csv") %>% mutate(., YEAR = 2012) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (9).csv") %>% mutate(., YEAR = 2011) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (10).csv") %>% mutate(., YEAR = 2010) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (11).csv") %>% mutate(., YEAR = 2009) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (12).csv") %>% mutate(., YEAR = 2008) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (13).csv") %>% mutate(., YEAR = 2007) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (14).csv") %>% mutate(., YEAR = 2006) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (15).csv") %>% mutate(., YEAR = 2005) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (16).csv") %>% mutate(., YEAR = 2004) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (17).csv") %>% mutate(., YEAR = 2003) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (18).csv") %>% mutate(., YEAR = 2002) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (19).csv") %>% mutate(., YEAR = 2001) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (20).csv") %>% mutate(., YEAR = 2000) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (21).csv") %>% mutate(., YEAR = 1999) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (22).csv") %>% mutate(., YEAR = 1998) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (23).csv") %>% mutate(., YEAR = 1997) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (24).csv") %>% mutate(., YEAR = 1996) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (25).csv") %>% mutate(., YEAR = 1995) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (26).csv") %>% mutate(., YEAR = 1994) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (27).csv") %>% mutate(., YEAR = 1993) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (28).csv") %>% mutate(., YEAR = 1992) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (29).csv") %>% mutate(., YEAR = 1991) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (30).csv") %>% mutate(., YEAR = 1990) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (31).csv") %>% mutate(., YEAR = 1989) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (32).csv") %>% mutate(., YEAR = 1988) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (33).csv") %>% mutate(., YEAR = 1987) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (34).csv") %>% mutate(., YEAR = 1986) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (35).csv") %>% mutate(., YEAR = 1985) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (36).csv") %>% mutate(., YEAR = 1984) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (37).csv") %>% mutate(., YEAR = 1983) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (38).csv") %>% mutate(., YEAR = 1982) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (39).csv") %>% mutate(., YEAR = 1981) %>% bind_rows(., drive)
drive <- read.csv("DrivingSummary/DrivingDistance (40).csv") %>% mutate(., YEAR = 1980) %>% bind_rows(., drive)

colnames(drive)[1] <- "RANK"

######################################################################################################################################
###########################################
######
###
#
#Read Strokes Gained Total, which contains data for SG: TTG and SG: Putting, clean the Rank column
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (2).csv") %>% mutate(., YEAR = 2018) 
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (3).csv") %>% mutate(., YEAR = 2017) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal_2016.csv") %>% mutate(., YEAR = 2016) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (4).csv") %>% mutate(., YEAR = 2015) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (5).csv") %>% mutate(., YEAR = 2014) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (6).csv") %>% mutate(., YEAR = 2013) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (7).csv") %>% mutate(., YEAR = 2012) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (8).csv") %>% mutate(., YEAR = 2011) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (9).csv") %>% mutate(., YEAR = 2010) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (10).csv") %>% mutate(., YEAR = 2009) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (11).csv") %>% mutate(., YEAR = 2008) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (12).csv") %>% mutate(., YEAR = 2007) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (13).csv") %>% mutate(., YEAR = 2006) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (14).csv") %>% mutate(., YEAR = 2005) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (15).csv") %>% mutate(., YEAR = 2004) %>% bind_rows(., strokesGained)

colnames(strokesGained)[1] <- "RANK"

clean_rank_str <- function( rank_str ){
  cleaned_str <- gsub( pattern = '[^0-9]', replacement = '', x = rank_str)
  as.numeric(cleaned_str)
}


strokesGained <- strokesGained %>% mutate_at( c('RANK'), clean_rank_str )
######################################################################################################################################
#####strokesGained T2G for everyone in 2018, and 2004
strokesGainedStrong <- strokesGained %>% filter(YEAR==2018) %>% summarise(name = "ALL", value = sum(TOTAL.SG.T2G)) %>% select(name, value)
strokesGainedWeak <- strokesGained %>% filter(YEAR==2004) %>% summarise(name = "ALL", value = sum(TOTAL.SG.T2G)) %>% select(name, value)




