# to load load SPSS data
library(foreign)

load_one_semeter <- function(semeter, filename = 'data/BARCS_Data_used_for_paper.sav'){
  BARCS <- read.spss(filename, to.data.frame=TRUE)

  BARCS <- BARCS[BARCS$Semester == semeter,]
  mj_var <- paste0('LOG_Avg_MJ_SEM', semeter)
  drink_var <- paste0('LOG_Avg_Drinks_SEM', semeter)

  BARCS$avg_mj <- 10^BARCS[, mj_var]
  BARCS$avg_drinks <- 10^BARCS[, drink_var]

  # delete logarithm variable
  BARCS[,mj_var] <- c()
  BARCS[,drink_var] <- c()

  # and this variable, which I do not understand
  BARCS$AllSEM_Pattern <- c()

  return(BARCS)
}
