#R Studio API Code
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


#Data Import
library(tidyverse)
Adata_tbl <- read_delim("../Data/Aparticipants.dat", delim ="-", col_names= c("casenum", "parnum", "stimver", "datadate", "qs"))
Anotes_tbl <- read_csv("../Data/Anotes.csv")
Bdata_tbl <- read_delim("../Data/Bparticipants.dat", delim = "\t", col_names = c("casenum", "parnum", "stimver", "datadate", paste0(c("q"), 1:10)))
Bnotes_tbl <- read_delim("../data/Bnotes.txt", delim = "\t", col_names = T)

#Data Cleaning
library(lubridate)
Adata_tbl <- separate(Adata_tbl, qs, paste0(c("q"), 1:5)) %>%  
  mutate_at(vars(5:9), as.numeric) %>%
  mutate_at(vars(datadate), mdy_hms)

Aaggr_tbl <- select(Adata_tbl, parnum, q1:q5) %>% 
  group_by(parnum) %>% 
  summarise_at(vars(q1:q5), mean)
Baggr_tbl <- select(Bdata_tbl, parnum, q1:q10) %>% 
  group_by(parnum) %>%
  summarise_at(vars(q1:q10), mean)
Aaggr_tbl <-Aaggr_tbl %>% inner_join(Anotes_tbl, by="parnum")
Baggr_tbl <-Baggr_tbl %>% inner_join(Bnotes_tbl, by="parnum")
bind_rows(Aaggr_tbl, Baggr_tbl, .id = "datafile") %>% 
  filter(is.na(notes)) %>%
  count(datafile)