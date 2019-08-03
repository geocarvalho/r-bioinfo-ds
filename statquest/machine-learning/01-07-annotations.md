# 01 - A gentle introduction to machine learning (ML)

* Decision Tree - predict or classify

> In general, ML is all about making predictions and classifications.

* **Training data**: the original data;

> In the example, the gree squiggle fits the training data better thant the black line, but the goal of ML is to make predictions. So we need a way to decide if the green squiggle is better or worse than the black line at making predictions.

* **Testing data**: we use it to compare the predictions made by the black line to the predictions made by the green squiggle

* The green squiggle did a great job fitting the training data, but we're more interested in how well the green squiggle can make predictions with new data.

* We measure each distance between the real data and the predicted result and we sum all that for each model and compare which has the larger sum of the distances. In other words, even though the green squiggle fit the training data way better that the black line, the black line did a better job predicting speeds with the testing data.

* We use testing data to evaluate ML methods, so don't be fooled by how a ML method fits the training data. Fitting the training data well but making poor predictions is called the *bias-variance tradeoff*.

### How we decide which data go into the training set and which data go into the testing set?

---

# 02 - Cross validation

* Allows us to compare different ML methods and get a sense of how well they will work in practice.

1. Estimate the parameters for the ML methods (**Train**)

> To use logistic regression, we have to use some of the data to estimate the shape of this curve. Estimating parameters is called *training the algorithm*.

2. Evaluate how well the ML method work (**Test**)

> We need to find out if this curve will do a good job categorizing new data. Evaluating a method is called *testing the algorithm*.

* Reusing the same data for both training and testing is a bed idea because we need to know how the method will work on data it wasn't trained on.

> A slightly better idea would be to use the first 75% of the data for training and the last 25% of the data for testing.

### But how do we know that using the first 75% of the data for training and the last 25% of the data for testing is the best way to divide up the data?

* Rather than worry too much about which block would be best for testing, cross validation uses them all, one at a time, and summarizes the results at the end.

> In the example, we divided the data into 4 blocks, this is called **four-fold cross validation**. However, the number of blocks is arbitrary. In an extreme case, we could call each individual patient (or sample) a block, this is called **leave one out cross validation**. That said, in practice, it's very common to divide the data into 10 blocks. This is called **ten-fold cross validation**.

* Say like we wanted to use a method that involved a **tuning parameter** (a parameter that isn't estimated, but just sort of guessed). Then we could use 10-fold cross validation to help find the best value for that tuning parameter.

---

# 03 - The confusion matrix

* We want to apply a ML method to predict whether or not someone will develop heart disease. To do this, we could use many ML methods, but how we decide which one works best with our data?

1. We start by dividing the data indo training and testing sets;
2. Then we train all of the methods we're interested in with the training data;
3. And then test each method on the testing set.

* Now we need to summarize how each method performed on the testing data. One way to do this is by creating a **confusion matrix** for each method.

* The rows in a **confusion matrix** correspond to what the machine learning algorithm predicted, and the columns correspond to the known truth.

* Since the example are only two categories to choose from: "Has Heart Disease" or "Does Not Have Heart Disease":
 a) **True Positives (TP)**: then the top left corner contains TP, these are the patients that had heart disease that were correctly identified by the algorithm;
 b) **True Negatives (TN)**: In the bottom right-hand corner, these are the patients that did not have heart disease that were correctly identified by the algorithm;
 c) **False Negatives (FN)**: In the bottom left-hand corner, when a patient has heart disease, but the algorithm said they didn't;
 d) **False Positives (FP)**: In the top right-hand corner contains the FP, these are patients that do not have heart disease, but the algorithm says they do.

* The size of the confusion matrix is determined by the number of things we want to predict. If we had N things to choose from, we get a confusion matrix NxN.

---

# 04 - Sensitivity and Specificity

* **Sensitivity** tells us what percentage of patients with heart disease were correctly identified;

> Sensitivity = (TP) / (TP + FN)

* **Specificity** tells us what percentage of patients without heart disease were correctly identified.

> Specificity = (TN) / (TN + FP)

* For the example:

> **Sensitivity** tells us that 81% of the people with heart disease were correctly identified by the *logistic regression* model;

> **Specificity** tells us that 85% of the people without heart disease were correctly identified by the *logistic regression* model;

> **Sensitivity** tells us that 83% of the people with heart disease were correctly identified by the *random forest* model;

> **Specificity** tells us that 83% of the people without heart disease were correctly identified by the *random forest* model.

* We would choose the **logistic regression** model if correctly identifying patients **without** heart disease was more important thant correctly identifying patients **with** heart disease. Alternatively, we would choose the **random forest** model if correctly identifying patients **with** heart disease was more important than correctly identifying patients **without** heart disease.

### And about how to calculate **Sensitivity** and **Specificity** when we have a confusion matrix 3x3?

* The big difference when calculating them for larger confusion matrices is that there are no single values that work for the entire matrix. Instead we calculate a different **Sensitivity** and **Specificity** for each category.

> For the given example, we'll need to calculate **Sensitivity** and **Specificity** for each movie.

---

# 05 - Bias and Variance

* Imagine we measured the weight and height of a bunch of mice and plotted the data on a graph. Light mice tend to be short and heavier mice tend to be taller, but after a certain weight, mice don't get any taller, just more obese. Given this data, we would like to predict mouse height given its weight.

* Ideally, we would know the exact mathematical formula that describes the relationship between weight and height, but we don't know the formula, so we're going to use two ML methods to approximate this relationship.

1. Split the data into two sets, one for training the ML algorithms and one for testing them (blue and green dots).

* The first ML algorithm is linear regression (Leas Squares), it fits a **Straight Line** to the training set (it doesn't have the flexibility to accurately replicate the arc in the "true" relationship). Thus, the **straight line** will never capture the true relationship between weight and height, no matter how well we fit it to the training set.

> The inability for a ML method (like linear regression) to capture the true relationship is called **bias**. Because the **straight line** can't be curved like the "true" relationship, it has a relatively large amount of bias. Because the **squiggly line** can handle the arc in the true relationship between weight and height, it has very little **bias**.

* Another ML method might fit a **squiggly line** to the training set, it's super flexible and hugs the training set along the arc of the true relationship.

* We can compare how well the **straight line** and **squiggly line** fit the training set by calculating thei sums of squares. In other words, we measure the distances from the fit lines to the data, square them (so that negative distances don't cancel out the positive ones) and add them up.

* Notice how the **squiggly line** fits the data so well that the distances between the line and the data are all 0, but it does a terrible job fitting the testing set.

> The difference in fits between data sets is called **Variance**.

* The **squiggly line** has **low bias**, since it's flexible and can adapt to the curve in the relationship between weight and hight, but it has **high variability, because it results in vastly different sums of squares for different datasets.

> In other words, it's hard to predict how well the **squiggly line** will perfiorm with future data sets. It might do well sometimes, and other times it might do terribly.

* In contrast, the **straight line** has relatively **high bias**, since it can not capture the curve in the relationship between weight and height, but it has relatively **low variance**, because the sums of squares are very for different datasets.

> In other words, the **straight line** might only give good predictions, and not great predictions. But they will be consistently good predictions.

> Because the **squiggly line** fits the training set really well, but not the testing set, we say tat the **squiggly line** is **overfit**.

* In ML, the ideal algorithm has **low bias and can accurately model the true relationship and it has **low variability**, by producing consistent predictions across different datasets. This is done, by finding the sweet spot between a simple model and a complex model.

> Three commonly used methods for finding the sweet spot between simple and complicated models are: **regularization**, **boosting** and **bagging**.

---

# 06 - ROC and AUC

* Let's start with some data, the y-axis has two categories obese (blue) and not obese (red). Along the x-axis, we have weight.

* Let's fit a logistic regression curve to the data. When we're doing it, the y-axis is converted to the probability that a mouse is obese.

> So this logistic regression tells us the probability that a mouse is obese based on its weight.

* However, if we want to classify the mice as obese or not obese, then we need a way to turn probabilities into classifications.

> One way to classify mice is to set a threshold at 0.5 and classify all mice with a probability of being obese > 0.5 as "obese", and the opposite (<=0.5) as "not obese".

* To evaluate the effectiveness of this logistic regression, with the classification threshold set to 0.5, we can test it with mice that we know are obese or not obese.

* And a **confusion matrix** can be created to summarize the classifications. After that, we can calculate **sensitivity** and **specificity** to evaluate this logistic regression when 0.5 is the threshold for obesity.

* Using different thresholds for deciding if a sample is obese or not can increase the number of FP or FN. But the threshold could be set to anything between 0 and 1. How do we determine which threshold is the best?

> For startes, we don't need to test every single option, since some of these thresholds result in the exact same confusion matrix. But even if we made one confusion matrix for each threshold that mattered, it would result in a confusingly large number of confusion mastrices.

* So instead of being overwhelmed with confusion matrices, **Receiver Operator Characteristitc (ROC)** graphs provide a simple way to summarize all of the information.

> The y-axis shows the TP rate, which is the same thing as **sensitivity**=TP/(TP+FN). This tells you what proportion of obese samples were correctly classified.

> The x-axis shows the FP rate, which is the same thing as **1 - specificity**. FP rate=FP/(FP+TN). This tells you the proportion of not obese samples that were incorrectly classified and are FP.

* For a TP rate of 1 and a FP rate of 1, plot a point 1,1. This point means that even though we correctly classified all of the obese samples, we incorrectly classified all of the samples that were not obese.

* Fit a green diagonal line shows where the TP rate = FP rate. Any point on this line means that the proportion of correctly classified obese samples is the same as the proportion of incorrectly classified samples that are not obese.

* For a TP rate of 1 and a FP rate of 0.75, plot a point at 0.75, 1. Since the new point (0.75, 1) is to the left of the dotted green line, we know that the proportion of correctly classified samples that were obese (TP) is greater that the proportion of the samples that were incorrectly classified as obese (FP). In other words, the new threshold for deciding if a sample is obese or not is better than the first one.

* For a TP rate of 1 and a FP rate of 0.5, plot a point at 0.5, 1. The new point (0.5, 1) is even further to the left of the dotted green line, showing that the new threshold further decreases the proportion of the samples that were incorrectly classified as obese (FP). In other words, the new threshold is the best one so far.

* Now we increase the threshold again ... create confusion matrix ... calculate the TP rate and FP rate ... plot the point

### In the end, we can connect the dots and that gives us an **ROC** graph. It summarizes all of the confusion matrices that each threshold produced.

> And depending on how many FP I'm to accept, the optimal threshold can be choosen.

* The **Area Under the Curve (AUC)** makes it easy to compare one ROC curve to another. When on **ROC** curve is greater than another (one **ROC** for each ML method), it suggest that the first is better.

> Although **ROC** graphs are drawn using **TP rates** and **FP rates** to summarize confusion matrices, there are other metrics that attempt to do the same thing. For example, replace **FP rate** with **Precision**. Precision=TP/(TP+FP), is the proportion of positive results that were correctly classified. 

> If there were lots of samples that were **not obese** relative to the number of **obese** samples, then **Precision** might be more useful than **FP rate**. This is because **Precision** doesn't include the number of **TN** in its calculation, and is not effected by the imbalance (rare diseases).

---

# 07 - ROC and AUC in R

* All the annotation in R colab file [right here](https://github.com/geocarvalho/r-bioinfo-ds/blob/master/statquest/machine-learning/07_ROC_and_AUC.ipynb)


