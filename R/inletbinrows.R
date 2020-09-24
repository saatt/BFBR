require(stringr)
require(dplyr)
require(ggplot2)

rm(list = ls())
options(scipen = 200)
file_list = NULL

#########define function################
readCSV <- function(dir_dta){
  file_list <- list.files(path=dir_dta,full.names=T,pattern='.csv')
  varSave_func <- function(x){
    table_x <- read.csv(file=x,sep=",",header = T)
  }
  a<-invisible(lapply(file_list,FUN=varSave_func))
  b<-as.data.frame(a[[1]])
  for (i in 2:length(a)){
    c <- bind_rows(b,a[[i]])
    b <- c
  }
  return(b)
}

##########????????????
#dir = 'E:/VTK/'
dir_dta <- "E:/BFBR/BFBR2/BFBR2AtomsNoBiomass_50g_13Umf_restart/CFD/inlet"

result <- readCSV(dir_dta)
write.csv(result,"E:/BFBR/BFBR2/BFBR2AtomsNoBiomass_50g_13Umf_restart/CFD/inlet/result.csv")
# Collate result.csv data in Excel
#write.csv(result,'E:/VTK/result.csv')


