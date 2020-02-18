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

