strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal.csv") %>% mutate(., YEAR = 2020)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (1).csv") %>% mutate(., YEAR = 2019) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (2).csv") %>% mutate(., YEAR = 2018) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal (3).csv") %>% mutate(., YEAR = 2017) %>% bind_rows(., strokesGained)
strokesGained <- read.csv("StrokesGainedTotal/StrokesGainedTotal 2016.csv") %>% mutate(., YEAR = 2016) %>% bind_rows(., strokesGained)
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

strokesGained$RANK = as.numeric(as.character(strokesGained$RANK))
strokesGained$RANK.THIS.WEEK = as.numeric(as.character(strokesGained$RANK.THIS.WEEK))

topclass <- filter(strokesGained, RANK <= 5)
topclass <- filter(strokesGained, RANK.THIS.WEEK <= 5) %>% bind_rows(., topclass)


inner_join(x, y, by = "name")








