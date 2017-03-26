## reanalysing data from: Longitudinal influence of alcohol and marijuana use on academic performance in college students


Yesterday, my colleague shared (this paper)[http://dx.doi.org/10.1371/journal.pone.0172213] as evidence against harmlessness of marijuana. In the paper they colleceted drinking smoking habbits of students very carefully, but then for analysis they reduced data to three categories:

- abstinents
- drinkers non-smokers
- drinkers smokers

The mean of GPA of drinkers was non-significantly smaller than mean of GPA of abstinents. However, third category had significantly lower GPA then both other categories. The aim of this repository is to reanalyse the data in quantitative way (not using those categories). All the analysis will be done in R.

To re-run my stupid analysis you will need: GNU make, R with CRAN packages `prims` and `rpart`. If you get all of those:

```
make
```

will recompute everything...
