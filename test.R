#Please make sure the packages are installed
library(MASS)
library(matrixStats)
library(rstan)
library(ggplot2)
library(wesanderson)

#Please make sure to source the code 
#source('analyze_uci_with_rope.R')
#source('rope_vis.R')
#source('hierarchical.test.new.R')

result_tbl <- read.csv(file="result.csv", header=TRUE, sep=",",stringsAsFactors=FALSE)
cmp = analyze_uci_with_rope(result_tbl)