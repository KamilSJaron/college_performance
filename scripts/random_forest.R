# random forest
library(randomForest)

semester = commandArgs(trailingOnly=TRUE)

# load function that loads data
source('scripts/load_data.R')
BARCS <- load_BARCS_data(semester = semester)

# foest
set.seed(91)
BARC_forest <- randomForest(GPA ~ ., data=BARCS, na.action=na.omit,
                            importance=TRUE, proximity=TRUE)

summary(BARC_forest)
#Predict Output
#predicted <- predict(fit,x_test)

# png(paste0('figures/BARCS_tree_s',semester, '.png'))
#   par(mfrow=c(1,2))
#   plot(BARC_tree, uniform=T,margin=0.1);text(BARC_tree, cex=0.64,use.n=T)
#   plot(BARC_tree2, uniform=T,margin=0.1);text(BARC_tree2, cex=0.64,use.n=T)
# dev.off()
