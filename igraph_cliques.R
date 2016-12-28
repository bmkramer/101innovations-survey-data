#Detecting cliques using igraph package
#source for importing graph data: http://www.shizukalab.com/toolkits/sna/sna_data
#source for cliqueing: http://finzi.psych.upenn.edu/library/igraph/html/cliques.html

#get package
install.packages("igraph")
library(igraph) 

#import csv as adjacency matrix
dat=read.csv(file="values_survey_hypergeometric_1s.csv",header=TRUE,row.names=1,check.names=FALSE) 
m=as.matrix(dat)
#create an 'igraph object'
g=graph.adjacency(m,mode="undirected",weighted=NULL)
g 

#size of largest clique
clique_num(g)
#count of maximal cliques (= cliques that can't be extended)
count_max_cliques(g)
#return list of maximal cliques with minimal size, maximal size
max_cliques(g, min = NULL, max = NULL, file = "max_clique_list_all.csv")