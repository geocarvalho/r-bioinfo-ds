# ROC and AUC
# https://www.youtube.com/watch?v=qcvAqAH60Yw&list=PLblh5JKOoLUICTaGLRoHQDuF_7q2GfuJF&index=7
# Library that will draw ROC graphs for us and the random forest library
library(pROC)
library(randomForest)
## Random Forest is a way to classify samples and we can change the threshold
## that we use to make those decisions
# Since we're going to generate an example dataset, let's set the seed
# for the random number generator so that we can reproduce our results
set.seed(420)
## Seed to 420 made a nicer looking set of random data
# So let's start by setting num.samples to 100
num.samples <- 100
# New we'll create 100 measurements and store them in a variable
weight <- sort(rnorm(n=num.samples, mean=172, sd=29))
## `rnorm()` function generate 100 random values from a normal distribution
## with the mean set to 172 and the standard deviation set to 29
### The average man weighs 172 pounds with a standard deviation of 29
## then we use the `sort()` function to sort the numbers from low to high
# Classify an individual as obese or not
obese <- ifelse(test=runif(n=num.samples) < (rank(weight)/100), yes=1, no=0)
## `rank()` function rank the weights, from lightest to heaviest
## the lightest sample will have rannk=1 and the heaviest rank=100
## then we scale the ranks by 100, this means the lightest sample will
## = 1/100 = 0.01 and the heaviest sample will = 100/100 = 1
## then we compare the scaled ranks to random numbers between 0 and 1
## if the random number is smaller than the scaled rank, the individual
## is classified as obese, otherwise is classified as not obese
## the "if smaller then obese, otherwise not obese" is performed by
## the `ifelse()` function and the results are stored in a variable
obese
## the 0's stand for not obese and the 1's stand for obese
# Now let's plot the data
plot(x=weight, y=obese)
# Fit a logistic regression curve to the data
glm.fit=glm(obese ~ weight, family=binomial)
# Draw a curve that tells us the predicted probability
# that an individual is obese or not
lines(weight, glm.fit$fitted.values)
## `glm.fit$fitted.values` contains the y-axis
## coordinates along the curve for each sample (contains
## estimated probabilities that each sample is obese)
### We'll use the known classifications and the estimated
### probabilities to draw an ROC curve
# Draw the ROC graph
roc(obese, glm.fit$fitted.values, plot=TRUE)
# To get rid of the ugly padding, we have to use the
# `par()` function and muck around with the graphics
# parameters
par(pty="s")
## we set pty(the plot type) to s (square)
roc(obese, glm.fit$fitted.values, plot=TRUE)
## By default the `roc()` function plots Specificity
## on the x-axis instead of 1 - Specificity
## resulting in x-axis going from 1 on left side to 
## 0 on the right side
# Change the x-axis to 1-Specificity
roc(obese, glm.fit$fitted.values, plot=TRUE,
    legacy.axes=TRUE)
# Change axis values to percent and put legends
roc(obese, glm.fit$fitted.values, plot=TRUE,
    legacy.axes=TRUE, percent=TRUE,
    xlab="False Positive Percentage",
    ylab="True Positive Percentage")
# Change the color of the curve and make it thicker
roc(obese, glm.fit$fitted.values, plot=TRUE,
    legacy.axes=TRUE, percent=TRUE,
    xlab="False Positive Percentage",
    ylab="True Positive Percentage",
    col="#377eb8", lwd=4)
# Now, imagine we're interested in the range of
# threshold that resulted in a specific part 
# of the ROC curve
# We can access those thresholds by saving the 
# calculations that the roc() function does in a
# variable
roc.info <- roc(obese, glm.fit$fitted.values,
                legacy.axes=TRUE)
# and then make a dataframe with all the True
# Positive and False Positives Percentages, 
# by multiplying the Sensitivities and 
# 1 - Specificities by 100 respectivelly and the
# thresholds
roc.df <- data.frame(
  tpp=roc.info$sensitivities*100, 
  fpp=(1 - roc.info$specificities)*100,
  thresholds=roc.info$thresholds)
head(roc.df)
## We see that when the threshold is set to negative
## infinity, so that every single sample is called
## obese then the TPP (true positive percentage) is 
## 100 because all of the obese samples were correctly
## classified and FPP (false positive percentage) is
## also 100 because all of the samples that were not
## obese were incorrectly classified
## So the first row in roc.df correspond to the upper
## right-hand corner of the ROC curve
tail(roc.df)
## We see that when the threshold is set to positive
## infinity, so that every single sample is classified
## not obese then the TPP and FPP are both 0 because
## none of the samples were classified, either correctly
## or incorrectly, obese.
## So the last row in roc.df corresponds to the botto,
## left-hand corner of the ROC curve
# Now we can isolate the TPP, FPP and threshold used when
# the True Positive Rate is between 60 and 80
roc.df[roc.df$tpp>60 & roc.df$tpp<80,]
## If we were interested in choosing a threshold in this
## range, we could pick the one that had the optimal balance
## of TP and FP
# If we want to print AUC directly on the graph
roc(obese, glm.fit$fitted.values, plot=TRUE,
    legacy.axes=TRUE, percent=TRUE,
    xlab="False Positive Percentage",
    ylab="True Positive Percentage",
    col="#377eb8", lwd=4, print.auc=TRUE)
# You can also draw and calculate a partial Area
# under the curve
roc(obese, glm.fit$fitted.values, plot=TRUE,
    legacy.axes=TRUE, percent=TRUE,
    xlab="False Positive Percentage",
    ylab="True Positive Percentage",
    col="#377eb8", lwd=4, print.auc=TRUE,
    print.auc.x=45, partial.auc=c(100,90),
    auc.polygon=TRUE, 
    auc.polygon.col="#377eb822")
## The range of values (100, 90) is in term of 
## Specificity, not 1-Specificity. So 100% 
## Specificity correspond to 0% on our 1-Specificity
## axis and 90% Specificity correspond to 10% on 
## our 1-Specificity axis.
## These are useful when you want to focus on the
## part of the ROC curve that only allows for a
## small number of FP
# How to overlap two ROC curves so that they are
# easy to compare?
# We'll make a random forest classifier with the
# same dataset
rf.model <- randomForest(factor(obese) ~ weight)
# Draw the ROC curve for the logistic regression
roc(obese, glm.fit$fitted.values, plot=TRUE,
    legacy.axes=TRUE, percent=TRUE,
    xlab="False Positive Percentage",
    ylab="True Positive Percentage",
    col="#377eb8", lwd=4, print.auc=TRUE)
# Add the ROC curve for the random forest
plot.roc(obese, rf.model$votes[,1], percent=TRUE,
         col="#4daf4a", lwd=4, print.auc=TRUE,
         add=TRUE, print.auc.y=40)
## Since we are using RF for the second ROC, we
## pass in the number of trees in the forest that
## voted correctly
# Draw a legend in the botoom right-hand corner
legend("bottomright", legend=c(
  "Logistic Regression", "Random Forest"),
  col=c("#377eb8", "#4daf4a"), lwd=4)
# Once we're all done drawing ROC graphs, we need
# to reset the pty graphical parameter back to its
# default value, m, which is short of Maximum
par(pty="m")
## As in, "use the maximum amount of space provided
## to draw graphs".