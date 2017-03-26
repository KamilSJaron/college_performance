.PHONY : all
all : trees prims

.PHONY : clean
clean :
	rm data/*
	rm figures/*

.PHONY : trees
trees : figures/BARCS_tree_s1.png figures/BARCS_tree_s2.png figures/BARCS_tree_s3.png figures/BARCS_tree_s4.png

.PHONY : prims
trees : figures/BARCS_prim_s1.txt figures/BARCS_prim_s2.txt figures/BARCS_prim_s3.txt figures/BARCS_prim_s4.txt

figures/BARCS_tree_s%.png : scripts/regression_tree.R data/BARCS_Data_used_for_paper.sav
	mkdir -p figures
	Rscript $< $*

figures/BARCS_prim_s%.txt : scripts/prim_tree.R data/BARCS_Data_used_for_paper.sav
	mkdir -p figures
	Rscript $< $* > $@

data/BARCS_Data_used_for_paper.sav :
	mkdir -p data
	wget -O - https://ndownloader.figshare.com/files/7512949 > $@
