# CART tree
library(rpart)

semester = commandArgs(trailingOnly=TRUE)

# load function that loads data
source('scripts/load_data.R')
BARCS <- load_BARCS_data(semester = semester)

# I have done more visualisation
#hist(BARCS$avg_mj_sem1, main = paste("marijuana usage per month"), xlab = "usage", cex.lab=1.2)
#hist(BARCS$avg_drinks_sem1, main = paste("alcohol usage per month"), xlab = "usage", cex.lab=1.2)

# tree
BARC_tree <- rpart(GPA ~ . , data=BARCS, minsplit=10, minbucket=5, cp=0.01)

#par(mfrow=c(1,2))
#plot(BARC_tree,margin=0.05)
#text(BARC_tree, cex=1,use.n=T)
#plotcp(BARC_tree, minlin=T, cex.axis=1.2, cex=1.5, cex.lab=1.2, upper =  'splits')

# r squared of cross-validated vs naive
# rsq.rpart(BARC_tree)

# prunning
BARC_tree2 <- prune(BARC_tree,cp=0.02)

png(paste0('figures/BARCS_tree_s',semester, '.png'))
  par(mfrow=c(1,2))
  plot(BARC_tree, uniform=T,margin=0.1);text(BARC_tree, cex=0.64,use.n=T)
  plot(BARC_tree2, uniform=T,margin=0.1);text(BARC_tree2, cex=0.64,use.n=T)
dev.off()
