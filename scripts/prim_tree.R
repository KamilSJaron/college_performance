# PRIM tree
library(prim)

semester = commandArgs(trailingOnly=TRUE)

# load function that loads data
source('scripts/load_data.R')
BARCS <- load_one_semeter(semester)

y <- BARCS[,c('GPA')]
x <- BARCS[,c('avg_mj', 'avg_drinks', 'SATWriting', 'SATTotal', 'SATVerbal', 'SATMath')]

# filter out all rows with NA value - this implementation of PRIM can not handle them
chosen <- !c(is.na(y) | apply(x, 1, function(x){ any(is.na(x)) }))
x <- x[chosen,]
y <- y[chosen]

BARCS_prim <- prim.box(x, y, threshold.type = 1)

print(summary(BARCS_prim, print.box = TRUE))
