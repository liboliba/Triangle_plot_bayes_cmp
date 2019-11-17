# Triangle_plot_bayes_cmp
My R implementation of triangle plot for Bayesian comparison of classifiers. This project is based on:

Time for a Change: a Tutorial for Comparing Multiple Classifiers Through Bayesian Analysis, Alessio Benavoli, Giorgio Corani, Janez Demšar, Marco Zaffalon. Journal of Machine Learning Research, 18 (2017) 1-36.

Their Github page is on https://github.com/BayesianTestsML 

The goal for this implementation is to capitalize on their existing R code and support those who want to use R code to make triangle plot. Because in the previous version, the same plot feature is only available in Python. 

#Please make sure the packages are installed
library(MASS)
library(matrixStats)
library(rstan)
library(ggplot2)
library(wesanderson)

Please also make sure to source the code and when your code exports plots, the directory is writable. 
