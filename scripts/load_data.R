# to load load SPSS data
library(foreign)

load_BARCS_data <- function(filename = 'data/BARCS_Data_used_for_paper.sav', semester){
  BARCS <- read.spss(filename, to.data.frame=TRUE)

  BARCS <- BARCS[BARCS$Semester == semester,]

  for (semester in 1:4){
    mj_var <- paste0('LOG_Avg_MJ_SEM', semester)
    drink_var <- paste0('LOG_Avg_Drinks_SEM', semester)

    BARCS[,paste0('avg_mj_s',semester)] <- (10^BARCS[, mj_var]) - 1
    BARCS[,paste0('avg_drinks_s',semester)] <- (10^BARCS[, drink_var]) - 1

    # delete logarithm variable
    BARCS[,mj_var] <- c()
    BARCS[,drink_var] <- c()
  }


  # and this variable, which I do not understand
  BARCS$AllSEM_Pattern <- c()

  return(BARCS)
}
