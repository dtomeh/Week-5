#R Studio API Code
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


#Data Import
library(tidyverse)
Adata_tbl <- read_delim("../Data/Aparticipants.dat", delim ="-", col_names= c("casenum", "parnum", "stimver", "datadate", "qs"))
Anotes_tbl <- read_csv("../Data/Anotes.csv")
Bdata_tbl <- read_delim("../Data/Bparticipants.dat", delim = "\t", col_names = c("casenum", "parnum", "stimver", "datadate", "q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10"))
Bnotes_tbl <- read_delim("../data/Bnotes.txt", delim = "\t", col_names = T)
