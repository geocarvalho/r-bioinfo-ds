# 08 - Fitting a line to data, aka least squares, aka linear regression.

* You got some data plotted on an XY graph, we usually like to add a line to our data so we can see what the trend is. But, what is the best line we should use? How to find the optimal line to fit our data?

> We can measure how well a line fits the data by seeing how close it's to the data points.

> The "sum of squared residuals", because the residuals are the differences between the real data and the line, and we're summing the square of these values.

* The generic line equation is `y = a*x + b`

> `a` is the slope of the line;

> `b` the intercept (y-intercept of the line that's the location on the y axis that the line crosses when x equals 0);

> We wabt to find the optimal values for `a` and `b` so that we minimize the sum of squared residuals.

* In more general math terms, sum of squared residuals = `((a*x1+b)-y1)² + ((a*x2+b)-y2)² + ...

> `(a*x1+b)` is the value of the line at x1;

> `y1` is the observed value at x1;

> Since we want the line that will give us the smallest sum of squares, this method for finding the best values for `a` and `b` is called `least squares`.

* If we plotted the sum of squared residuals vs. each rotation, we see that the sum of squared residuals goes down when we start rotating the line but that it's possible to rotate the line to far that the sum of squared residual starts going back up again. How we find the optimal rotation for the line?

> We take the derivative of the plot function, it tells us the slope of the function at every point;

> Remember, the different rotations are just different values for `a` (the slope) and `b` (the intercept);

* We can use a 3-D graph to show how different values for the slope and intercept result in different sums of squares.

> If we select one value for the intercept, we can plot a curve for different slopes. We do that for bunches of different intercepts and slopes, taking the derivatives of both the slope and the intercepts tells us where the optimal values are for the best fit.

1. We want to minimize the square of the distance between the observed values and the line;
2. We do this by taking the derivative and finding where it's equal to `0`;
3. The final line minimizes the sums of squares (it gives the "least squares") between it and the real data.

> In our example the line is defined by `y = 0.77 * x + 0.66`

---

# 09 - Odds and Log Odds

* You might say that the odds in favor of my team winning the game are 1 to 4 (5 games total, 1 of which my team will win and 4 of which my team will lose) or 1/4. If we do the math, we see that the odds are 0.25 that my team will win the game.

* Another example is that the odds in favor of my team winning the game are 5 to 3 (8 games total, 5 of which my team will win and 3 of which my team will lose) or 5/3. If we do the math, the odds is 1.7 that my team will win the game.

* **Odds are not probabilities**, the odds are the ratio of something happening (team winning) divided by to something not happening (my team not winning).

> While probability is the ratio of something happening (my team winning) divided by everything that could happen (my team winning and losing).

* In the last example the odds in favor my team winning the game are 5/3 (1.7) while the probability of my team winning is 5/8 (0.625).

* So, odds can be calculated from probabilities. Just divide the ration of the probability of winning by the probability of losing (or 1 - the probability of winning)

> p / (p-1), where `p` is the probability of winning;

> (5/8) / (3/8) = 5/3 = 1.7

* If the odds are for my team winning, then they will be between 1 and infinity. While the odds of my team losing go from 0 to 1.

> The asymmetry makes it difficult to compare the odds for or against my team winning.

> For example, if the odds are against 1 to 6, then the odds are 1/6 (0.17, the magnitude of these odds looks way smaller), but if the odds are in favor 6 to 1, then the odds are 6/1 (6).

* Taking the log() of the odds (log(odds)) solves this problem by making everything symmetrical. For example, if the odds are against 1 to 6, then the log(odds) are log(1/6)=log(0.17)=-1.79 and if the odds are in favor 6 to 1, then the log(odds) are log(6/1)=log(6)=1.79; so the distance from the origin (or 0) is the same.

* We can calculate the log of the odds with counts or probabilities. The log of the ration of the probabilities is called the **logit function** and forms the basis for logistic regression.

* If I pick pairs of random numbers that add up to 100 and use them to calculate the log(odds) and draw a histogram the histogram is in the shape of a normal distribution. This makes the log(odds) useful for solving certain statistics problems - specifically ones where we're trying to determine probabilities about win/lose, or yes/no, or true/false types of situations.

* Even though the "odds" is a ration it's different from an "odds ratio"

---

# 10 - Odds Ratios and log(Odds Ratios)

* When people say "Odds Ratio", they're talking about a "ratio of odds";

> (2/4) / (3/1) = 0.17

* Just like when we calculate the odds of something, if the denominator is larger than the numerator, the odds ratio will go from 0 to 1 and if the numerator is larger than the denominator, then the odds ratio will go from 1 to infinity.

* And, just like the odds, taking the log of the odds ratio makes things nice and symmetrical. 

* What can we do with odds ratio?

> We have a bunch of people (356),
1. 29 of these people have cancer;
2. 327 do not have cancer;
3. 140 have the mutated gene;
4. 216 people do not have the mutated gene;

| has mutated gene (above) / has cancer (right) | yes | no  |
|-----------------------------------------------|-----|-----|
| yes                                           | 23  | 117 |
| no                                            | 6   | 210 |

> We can use an "odds ratio" to determinie if there is a relationship between the mutated gene and cancer. If someone has the mutated gene, are the odds higher that they will get cancer?

> Given that a person has the mutated gene, the odds that they have cancer are 23/117. And given that a person does not have the mutated gene, the odds that they have cancer are 6/210. The odds ratio is (23/117) / (6/210) = 0.2/0.03 = 6.88, it tell us that the odds are 6.88 times greater that someone with the mutated gene will also have cancer. And the log(6.88) = 1.93

* What does all mean?

> **The odds ratio and the log(odds ratio) are like R-squared**; they indicate a relationship between two things (in this case, a relationship between the mutated gene and cancer) and just like R-squared, the values correspond to effect size. Larger values mean that the mutated gene is a good predictor of cancer, otherwise smaller values mean that the mutated gene is not good predictor of cancer.

* However, just like R-squared, we need to know if this relationship is statistically significant. There are 3 ways to determine if an Odds ratio or log(Odds Ratio) is statiscally significant.

1. Fisher's Exact test (p-value);
2. Chi-Square test(p-value);
3. The Wald test (p-value and confidence interval).

### Enrichment analysis using Fisher's Exact test and the hypergeometric distibution

* A p-value is the sum of the probabilities of all things equally rare or rarer.

> In R just use `fisher.test(data)`, been `data` a `data.frame` object.

### Chi-square test

* It compares the observed values to expected values that assume there is no relationship between the mutated gene and cancer.

> To do this, we calculate the probability of having cancer as the total number of people with cancer (29) divided by the total number of people (356). So the probability of having cancer is 29/356 = 0.08;

> So if the gene is not associated with the (23 + 117) = 140 people with the mutated gene, then the probability of having cancer times the number of people with the mutated gene equals to 0.08x140 = 11.2. Thus, the expected number of people with the mutated gene and cancer is 11.2;

> and the remaining 128.8 people with the mutated gene are expected not to have cancer. Likewise, if the gene is not associated with the (6+210) = 216 people without the mutated gene, then the probability of having cancer times the number of people without the mutated gene equals (0.08x216=) 17.3, and the remaining 198.7 people with the mutated gene are expected not to have cancer.

|has cancer (expected values)|  yes |   no  |
|----------------------------|------|-------|
| yes                        | 11.2 | 128.8 |
| no                         | 17.3 | 198.7 |

* Now we do a Chi-square test to compare the observed and expected values, and the p-value is 0.00001 with the continuity correction and 0.000004 without.

### The Wald test

* It's commonly used to determine the significance of odds-ratios in logistic regression and to calculate confidence intervals.

* It takes advantage of the fact that log(odds ratio), just like log(odds), are normally distributed.

1. Randomly select a total sample size between 300 and 400 (325 for example);
2. Pick a random number between 0 and 1 for each sample (0.01, 0.73, 0.95, ..);
3. Random numbers less than 0.08 are samples with cancer (17 of 325 samples have cancer);
4. Pick another random number between 0 and 1 for each sample;
5. Random numbers less than 0.39 are samples with the mutated gene;

> This gives you a matrix of random values that didn't depend on a relationship between the mutated gene and cancer.

* Lastly, calculate the log(odds ratio). Do this 10,000 times and draw a histogram..

> A normal curve fits well, notice that the histogram and curve are centered on 0. When there is no difference in the odds, the log(odds ratio) = 0.

> The standard deviation of the 10,000 log(odds ratio) is 0.43. However, it's more common to estimate the standard deviation from the observed values (take the square root of the sum of 1 over each of the observed values = root(1/23 + 1/117 + 1/6 + 1/210) = 0.47). The two standard deviations are very similar.

* All that the Wald test does is look to see **how many standard deviations the observed log(odds ratio) is from 0**. And since it typically use's the estimated standard deviation we'll replace the histogram with a normal curve centered on 0 that has a standard deviation of 0.47.

* The log(odds ratio) is the same one calculated, log((23/117)/(6/210)) = log(6.88) = 1.93. To find out how many standard deviations the log(odds ratio) is away from 0, we simply divide by the standard deviation (1.93/0.47 = 4.11). So the log(odds ratio) is 4.11 standard deviations away from the mean of the distribution.

> A general rule of thumb with normal distributions is that anything further than 2 standard deviations from the mean will have a p-value < 0.05, so we know our log(odds ratio) is statistically significant.

> However, to get a precise 2-sided p-value, we can add up the areas under the curve for points > 1.93 and for points < -1.93. However, this is traditionally done using a standard normal curve (normal curve with mean=0 and standard deviation=1). And that means adding up the areas under the curve for points that are > 4.11 and for points that are < -4.11, where 4.11 is the number of standard deviations that the log(odds ratio) is away from the mean. 

* Ultimately, the p-value that the mutated gene does not have a relationship with cancer is 0.00005.

* So all of the tests did a good job limiting significant p-values, so just find out what method is most commonly used in your field. Personally, I'd be more comfortable with a borderline p-value if I knew if passed all of the tests.

---

# 11 - Logistic Regression

* Linear regression

> We had some data (size x weight), then we fit a line to it and with that line, we could do a lot of things:

1. Calculate **R²** and determine if **weight** and **size** are correlated. Large values imply a large effect;
2. Calculate a p-value to determine if the **R²** value is statistically significant;
3. Use the line to predict **size** given **weight**.

> Using data to predict something falls under the category of "machine learning", so plain old linear regression is a form of machine learning.

* Now we're trying to predict **size** using **weight** and **blood volume**. Alternatively, we could say we are trying to model **size** using **weight** and **blood volume**.

* Multiple regression did the same things that normal regression did ...

1. Calculate **R²**;
2. Calculate the p-value;
3. Predict **size** given **weight** and **blood volume**.

* Comparing the simple model to the complicated one tells us if we need to measure **weight** and **blood volume** to accurately predict **size** or if we get away with just **weight**.

* Logistic regression is similar to linear regression, except that it predicts whether something is **True** or **False**, instead of predicting something continuous like **size**. Instead of fitting a line to the data, logistic regression fits an "S" shaped "logistic function".

> The curve goes from 0 to 1 and that means that the curve tells you the probability that a mouse is **obese** based on its **weight**.

* Although logistic regression tells the probability that a mouse is obese or not, it's usually used for classification. For example, if the probability a mouse is obese is >50%, then we'll classify it as obese, otherwise we'll classify it as "not obese".

* Just like linear regression, we can make simple models (**obesity** is predicted by **weight**) or more complicated models (**obesity** is predicted by **weight+genotype+age**). Like linear regression, logistic regression can work with continuous data (like **weight** and **age**) and discrete data (like **genotype** and **astrological sign**).

> We can also test to see if each variable is useful for predicting **obesity**.

* However, unlike normal regression, we can't easily compare the complicated model to the simple model. Instead, we just test to see if a variable's effect on the prediction is significantly different from 0 (if not, it means the variable is not helping the prediction) - we use "Wald's test".

* Logistic regression's ability to provide probabilities and classify new samples using continuous and discrete measurements makes it a popular ML method.

* In linear regression we fit the line using "least squares" (we find the line that minimizes the sum of the squares of these residuals), we also use the residuals to calculate **R²** and to compare simple models to complicated models.

> Logistic regression doesn't have the same concept of a "residual", so it can't use least squares and it can't calculate **R²**. Instead it uses "maximum likelihood"

---
 
# 12 - Logistic regression - coefficients

* Are the result of any Logistic Regression;

* We'll talk about the coefficients in the context of using a continuous variable like **weight** to predict **obesity** and we'll talk about the coeficients in the context of testing if a discrete variable like **whether** or **not** a mutated gene is related to obesity.

* With the y-axis been the probability of a mouse is obese (it goes from 0, the mouse is not obese, to one, the mouse is obese) and x-axis the weight.

> The dotted line is fit to the data to predict the probability a mouse is obese given its weight.

* Logistic regression is a specific type of **Generalized Linear Model** (GLM). GLM are a generalization of the concepts and abilities of regular Linear Models.

### Logistic Regression when we use a continuous variable (like weight) to predict obesity

* Closely related to *linear regression*;

* With linear regression, the values on the y-axis can, in theory, be any number. Unfortunately, with logistic regression, the y-axis is confined to probability values between 0 and 1.

> To solve this problem, the y-axis in logistic regression is transformed from the "probability of obesity" to the "log(odds of obesity)" (log(p/1-p)) so, just like the y-axis in linear regression, it can go from -infinity to +infinity.

* The important thing to know is that even though the graph with the squiggly line is what we associate with logistic regression the coefficients are presented in terms of the log(odds) graph.

* Just like with linear regression, the best fitting line has a y-axis **intercept** and a **slope**. The coefficients for the line are what you get when you do logistic regression.

> The first coefficient is the y-axis intercept, when weight=0, it means that when weight=0, the log(odds of obesity) are -3.476. In other words, if you don't weigh anything, the odds are against you being obese. 

> There is also a standard error for the estimated intercept (2.364) and the z-value (-1.471, is the estimated intercept divided by the standard error). In other words, the z-value is the number of standard deviations the estimated intercept is away from 0 on a standard normal curve (**the Wald's test**). Since the estimate is less than 2 standard deviations away from 0, we know it's not statistically significant and this is confirmed by the large p-value; the area under a standard normal curve that is further than 1.471 standard deviations away from 0.

> The second coefficient is the slope, it means that for every one unit of weight gained, the log(odds of obesity) increases by 1.825. The z-value (*1.678*) is less than 2 standard deviations from 0, so it's not statistically significant (no surprise for a small sample size), and this is confirmed with the large p-value.

### Logistic Regression when we use a discrete variable like "whether or not a mouse has a mutated gene" is related to obesity

* This type of logistic regression is very similar to how a t-test is done using linear models.

* We've measured the size of mice that have a normal gene and the size of mice with a mutated version of that gene. Then we fit two lines to the data, the first line represents the mean size of the mice with the normal copy of the gene, and the second line represents the mean size of the mice with the mutated copy of the gene. These two lines come together to form the coefficients in the equation

> size = mean_normal x B1 + (mean_mutant - mean_normal) x B2

> Then pair this equation with a design matrix to predict the size of a mouse given that it has the normal or mutated version of the gene. The first column corresponds to values for B1 and it "turns on" the first coefficient, mean_normal. The second column corresponds to values for B2 and turns the second coefficient, (mean_mutant - mean_normal), "off" or "on" depending on whether it's a 0 or a 1.

> For example, the first row (1, 0) in the desing matrix corresponds to a mouse with a normal copy of the gene (B1=1, B2=0).Doing the math, we see that this mouse is associated with the mean of the normal mice. Anothe line (1, 1) corresponds to a mouse with the mutated gene, we see that the mean of the mice with the normal gene plus the difference between the two means associates this mouse with the mean for the mice with the mutated gene (when we do a t-test this way, we are basically testing to see if 
this coefficient, (mean_mutant - mean_normal) is equal 0.

* How it applies to logistic regression?

> The first thing it transform the y-axis from the probability of being obese to the log(odds of obesity);

> Fit two lines to the data. For the first line we take the "normal gene" data and use it to calculate the log(odds of obesity) for mice with the normal gene (log(2/9)=log(0.22)=-1.55). Thus, the first line represents the log(odds of obesity) for the mice with the normal gene (log(odds gene_normal)). We then calculate the log(odds of obesity) for the mice with the mutated gene (log(7/3)=log(2.33)=0.85). Thus, the second line represents the log(odds of obesity) for a mouse with the mutant gene (log(odds gene_mutated)). These two lines come together to form the coefficients in the equation.

> size = log(odds gene_normal) x B1 + (log(odds gene_mutated) - log(odds gene_normal)) x B2

> Since subtracting one log from another can be converted into division, this term is a log(odds ratio). It tells us, on a log scale, how much having the mutated gene increases (or decreases) the odds of a mouse being obese.

> size = log(odds gene_normal) x B1 + (log(odds gene_mutated) / log(odds gene_normal)) x B2

> size = log(2/9) x B1 + log((7/3)/(2/9)) x B2 = -1.5 x B1 + 2.35 x B2

> Those coefficients are the same you get when you do logistic regression. The **intercept** is the log(odds gene_normal) and the **geneMutant** term is the log(odds ratio) that tells you, on a log scale, how much having the mutated gene increases or decreases the odds of being obese. 

> There is the standard errors for those estimated coefficients and the z-values (the Wald's test values, that tell you how many standard deviations the estimated coefficients are away from 0 on a standard normal curve), the z-value for the **intercept** (-1.9) tells us that the estimated value for the intercept (-1.5) is less than 2 standard deviations from 0, and thus, not significantly different from 0 and this is confirmed by a p-value (Pr(>|z|)) greater than 0.05. The z-value for **geneMutant**, the log(odds ratio) that describes how having the mutated gene increases the odds of being obese, is greate than 2 (suggesting it's statistically significant) confirmed by a p-value less than 0.05.

* In short, in terms of the coefficients, logistic regression is the exact same as good old linear models except the coefficients are in terms of the log(odds). This means that multiple regression and Anova can be done using logistic regression. All we have to remember is that the scale for the coefficients is log(odds).

---

# 13 - Fitting a line with Maximum likelihood


