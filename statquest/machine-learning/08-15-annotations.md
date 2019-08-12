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

* How the best fitting line for a logistic regression is fit to the data?

* In linear regression we fit the data using least-squares. In other words, we measure the **residuals** (distances between the data and the line) then square them, so that negative values don't cancel out positive values, and then add them all up.

> Then we rotate the line a little bit and do the same thing: measure residuals, square them and add them up and the line with the smallest sum of squared residuals (the **least-squares**) is the line chosen to fit best.

* Using logistic regression to determine the effect of weight on obesity, our goal is to draw the **best fitting** squiggle for this data.

* As we know, in logistic regression, we transform the y-axis from the probability of obesity to log(odds of obesity). We can draw a candidate **best fitting** line on the graph, the only problem is that the transformation pushes the raw data to positive and negative infinity and this means that the residuals (the distance from the data points to the line) are also equal to positive and negative infinity. So, we can't use least-squares to find the best fitting line, instead we use maximum likelihood.

1. Project the original data points onto the candidate line, this gives each sample a candidate log(odds) value;

2. Then we transform the candidate log(odds) to candidate probabilities using: p = [e^log(odds)]/[1+e^log(odds)]

> which is just a reordering of the transformation from probability to log(odds) log(p/1-p) = log(odds).

> The math done to keep the first formula is available in the video.

* Now we use the observed status (obese or not obese) to calculate their likelihood given the shape of the squiggly line.

1. Start by the likelihood of the obese mice. The likelihood that a obese mouse, given the shape of the squiggle, is the value on the y-axis where point intersects the squiggle (0.49). In other words, the likelihood that this mouse is obese, given the shape of the squiggle, is the same as the predicted probability. In this case, the probability is not calculated as the area under a curve, but instead is the y-axis value, and that's why it's the same as the likelihood.

> The likelihood for all of the obese mice is just the product of the individual likelihoods 

2. The likelihoods for the mice that are not obese.

> The lower the probability of being obese, the higher the probability of not being obese.

> For these mice, the likelihood = (1 - probability the mouse is obese)

> The probability that one mouse is obese is 0.9, so the probability and likelihood that it's not obese is (1-0.9).

* Now we can include the individual likelihoods for the mice that are not obese to the equation for the overal likelihood.

> likelihodd of data given the squiggle = (0.49x0.9x0.91x0.91x0.92)x(1-0.9)x(1-0.3)x(1-0.01)x(1-0.01)

> Although it's possible to calculate the likelihood as the product of the individual likelihoods, statisticians prefer to calculate the **log of the likelihood** instead. Either way works because the squiggle that maximizes the likelihood is the same one that maximizes the log of the likelihood.

> With the log of the likelihood or "log-likelihood" to those in the know, we **add the logs of the individual likelihoods** instead of multiplying the individual likelihoods

> log(likelihodd of data given the squiggle) = (log(0.49)+log(0.9+log(0.91)+log(0.91)+log(0.92)+ log(1-0.9)+log(1-0.3)+log(1-0.01)+log(1-0.01)

> log(likelihodd of data given the squiggle) = -3.77

* Thus, the log-likelihood of the data given the squiggle is -3.77 and this means that the log-likelihood of the original line lis -3.77.

* Now we rotate the line and calculate its log-likelihood by projecting the data onto it, transforming the log(odds) to probabilities and then calculating the log-likelihood.

> Anothe example, log(likelihood of the data given the squiggle) = -4.15	

> So this one is not as good as the first one.

* And we just keep rotating the log(odds) line and projecting the data onto it and transforming it to probabilities and calculating the log-likelihood.

> The algorith that fids the line with the maximum likelihood is pretty smart - each time it rotates the line, it does so in a way that increases the log-likelihood. Thus, the algorithm can find the optimal fit after a few rotations.

* Ultimately we get a line that maximizes the likelihood and that's the one chosen to have the best fit. But just like with linear regression, there's more to logistic regression than just fitting a line. We want to know if that line represents a useful model, and that means we need an R² value and a p-value.

* However, in logistic regression we have to do that without the usual residuals.

---

# 14 - Logistic regression, R² and p-values

* We ended with hte best fit line, but how do we know if it is useful? In other words, how do we calculate R² and a p-value for the relationship between weight and obesity?

> Although the idea behind Generalized Linear Models, a commom framework for solving all kinds of problems, is nice the result is a bit of a hot mess;

> Even though pretty much everyone agrees on how to calculate R²and the associated p-value for linear models, there is no consensus on how to calculate R² for logistic regression (more than 10 different ways, so look and see what are aldready doing in your field).

### McFadden's Pseudo R²

* This method is very similar to how R² is calculated for regular old linear models.

> In linear regression, R² and the related p-value are calculated using residuals. In brief, we square the residuals and then add them up. I call this **SS(fit)**, for "sum of squares for the Resisuals around the best fitting line" and we compare that to the sum of squared residuals around the worst fitting line, the mean of the y-axis values (this is called **SS(mean)**);

> R² compares a measure of a good fit, **SS(fit)** to a measure of a bad fit, **SS(mean)**, R² = [SS(mean) - SS(fit)] / SS(mean)

> R² is the percentage of variation around the mean that goes away when you fit a line to the data. And it goes from 0 to 1;

> If there wasn't a relationship between weight and size, the data might look distributed, and the best fitting line migh be a horizontal line, in this case, SS(fit) = SS(mean) and when we plug the values we will get 0 in the numarator and then R² = 0;

> On the other hand, when the line fits the data perfectly, SS(fit) = 0 and that means when we plug in the values we get SS(mean) - 0 in the numarator and then R² = 1

* Like linear regression, we need to find a measure of a good fit to compare to a measure of a bad fit. Unfortunately the residuals for logistic regression are all infinity, so we can't use them. But, we can project the data onto the best fitting line and then we translate the log(odds) back to probabilities and lastly, calculatte the log-likelihood of the data given the best fitting squiggle.

> In our example log(likelihood of data given the squiggle) = -3.77;

> We can call this **LL(fit)** for the log-likelihood of the fitted line, and use it as a substitute for **SS(fit)**.

* Now we need a measure of a poorly fitted line that is analogous to SS(mean). We do this by calculating the log(odds of obesity) without taking weight into account.

> The overall log(odds of obesity) is just the total number of obese mice divided by the total number of mice that are not obese. Then we just take the log of it. log(5/4)=0.22; In this case we get a horizontal line at 0.22, then project the data onto this line and then we translate the log(odds) back to probabilities (that gives a horizontal line at p=0.56);

> The overall log(odds), 0.22, translates to the overall probability of being obese, 0.56. p= e^0.22 / (1+e^0.22)= 0.56; In other words, we can arrive at the same solution by calculating the overall probability of obesity. p= number of obese mice / total number of mice = 5/9 = 0.56

* Now calculate the log-likelihood of the data given the overall probability of obesity. log(likelihood of data given overall probability of obesity) = -6.18; We'll call this **LL(overall probability)** and use it as a substitute for **SS(mean)**.

* So we have **LL(overall probability)**, a measure of a bad fit and **LL(fit)**, hopefully a measure of a good fit and makes intuitive sense that we could combine them, just like we combined **SS(mean)** and **SS(fit)**, to calculate R².

> R² = LL(overall probability) - LL(fit) / LL(overall probability = -6.18 - (-3.77) / -6.18= 0.39

* However, let's verify that calculating R² with these log-likelihoods will result in a value between 0, when the fit is bad and 1 when the fit is good. 

> Let's start by looking at the R² we'll get when weight is not a good predictor of obesity. There are light mice that are obese and light mice that are not obese and heavy mice that are obese and not obese. Intuitively, we can see that, with this data, weight makes a poor predictor of obesity;

> The maximum likelihood (best fitting) line for this data has an intercept of -0.22 and a slope of pratically 0 (5x10⁻¹⁷ to be exact) on the log(odds) scale and this translate to a horizontal line at 0.45 on the probability scale;

> LL(fit) is the log-likelihood of the data projected onto this best fitting line, LL(fit)=-6.18;

> Now let's calculate LL(overall probability), the first step is simply to calculate the overall probability of obesity (number of obese mice/ total number of mice = 4/9= 0.44). LL(overall probability) is the log-likelihood 
of the data projected onto the overall probability (-6.18);

> Now let's just plug in the values for LL(overall probability) and LL(fit);

> R² = LL(overall probabiliy) - LL(fit) / LL(overall probabiliy) = -6.18 - (-6.18) / -6.18=  0/-6.18= 0;

> Now lets look at the R² we'll get when weight is an awesome predictor of obesity. The maximum likelihood (best fitting) line for this data has an intercept of -63.72 and a slope of 22.42, and this translates to a squiggly line on the probability scale;

> LL(fit) is the log-likelihood of the data projected onto the best fitting line. log(1) = 0, so LL(fit) is just the sum of a bunch of 0s;

> Now let's calculate the overall probability of obesity (number of obese mice / total number of mice = 4/9 = 0.44). LL(overall probability) is the log-likelihood of the data projected onto the overall probability (-6.18);

> When the model is a poor fit, the log-likelihood for a logistic regression is a relatively large negative value and when the model is a good fit, the log-likelihood for a logistic regression is a value close to zero;

> Log-likelihoods for logistic regression will always be between 0 and -infinity because we are taking logs of values between 0 and 1, and good fits result in log-likelihoods close to zero, and bad fits result in larger, negative log-likelihoods;

> OK, back to calculating R². Let's plug in the values for LL(overall probability) and LL(fit);

> R² = LL(overall probabiliy) - LL(fit) / LL(overall probabiliy) = -6.18 - 0/ -6.18=  -6.18/-6.18= 1;

* So we see that, at least on an intuitive level, the R² calculated with log-likelihoods behaves like the R² calculated from the sums of squares;

* The log-likelihood R² values go from 0 (poor models) to 1 (good models).

* Now we need a p-value.

> 2( LL(fit) - LL(overall probability) ) = a chi-squared value with degrees of freedom equal to the difference in the number of parameters in the two models;

> LL(fit) has 2 parameters since it needs estimates for a y-axis intercept and a slope. LL(overall probability) has 1 parameter since it only needs an estimate for a y-axis intercept;

> Degrees of freedom = 2-1 = 1;

> In the worst case scenario, LL(fit) = LL(overall probability) and the whole thing = 0. In this case, the p-value = 1, since the area under the curve from 0 to infinity= 1;

> However, most of the time LL(fit) will be closer to 0 than LL(overall probability), and since the log-likekihoods are negative. This will be a positive value on the x-axis and the p-value will get smaller.

> In our example: 2( LL(fit) - LL(overall probability) ) = 2(-3.77 - (-6.18)) = 4.82 and the p-value = 0.03;

> Thus, the relationship between weight and obesity is not due to chance, and the R² value (0.39) tells us the effect size of this relationship.

* When you see these formulas for R² and the associated p-value out in the wild ...

> R² = LL(overall probability) - LL(fit) / LL(overall probability)

> 2( LL(fit) - LL(overall probability) = A chi-squared value

* They will look more like this ...

> R² = LL(overall probability) - LL(fit) / LL(overall probability) - LL(saturated model)

> 2( (LL(saturated model) - LL(fit)) - (LL(saturated model) - LL(overall probability)) = A chi-squared value

* This is because these formulas usually include terms for the **saturated model**. Just know that when doing Logistic regression, the log-likelihood of the **saturated model** = 0, so we can omit it. However, the log-likelihood of these saturated model isn't always 0 when it's used for other "Generalized Linear Models", so people include it when talking about the log-likelihood R² and associated p-value so that it will work in other situations.

---

# 15 - Saturated models and deviance statistics

* The saturated model and deviance statistics are part of generalized linear models and are intended to be used in a very wide variety of situations (logistic regression, linear models, other methods).

* We have weight from mice, and a normal curve centered on the estimated mean value (we can estimate probabilities and do statistical tests).

> Since we only had to estimate the mean for this model, we can say that model has 1 parameter (it's call **null model**);

> The likelihood of the data, given the null model = 0.03. And the log-likelihood of the data given the null model LL(null model) = log(0.03)= -3.51;

* We could also create a slightly fancier model by fitting two normal curves to the data. This model would have 2 parameters, one for each mean that we estimated. It's is call the **Proposed Model**.

> The likelihood of the data, given the fancier model = 3.57, and the log-likelihood LL(fancy model) = log(3.57) = 1.27.

* We could also create a super fancy model to our data, it would have one parameter per data point. It's call **Saturated Model** because it maxes out the number of parameters we can estimate.

> The likelihood of the data, given the saturated model is 1291.5, and the log-likelihood of the data LL(Saturated model) = log(1291.5) = 7.16.

* By calculating the likelihood of the **Null model**, we have a sense of the worst case scenatio, and by calculating the likelihood of the **Saturated Model**, we have a sense of the best case scenario. The likelihood of the saturated model is as high as it can be.

* Ideally, we want the likelihood of the data given our **Proposed Model** to be larger then the **Null Model** and close to the **Saturated Model**.

* When using likelihoods, we use the **Null and Saturated models** to determine whether the **Proposed Model** does a good job with the data. In other words, we use the **Null and Saturated Models** to calculate R² and its p-value for the **Proposed Model**.


### Review linear regression calculated with sums of squares of the residuals

* With the "normal" R², the SS(Null Model) determines the boundary for a bad fit and when the model fits the data perfectly, the residuals are all 0 and SS(Proposed Model) = 0. In other words, there is a fixed value (0) that represents a boundary for the best a model can do, and when we plug in 0, we get R² = 1 

$R²=\frac{SS(Null Model)-SS(Proposed Model)}{SS(Null Model)}$

### Back to the log-likelihood based R²

* Just like before, the Null Model provides a boundary for how poor a model can perform.

$R²=\frac{SS(Null Model)-SS(Proposed Model)}{SS(Null Model)-SS(Saturated Model)}$

* However, unlike the traditional R², there is no fixed value for an "ideal fit" that works in every situation and that's where the Saturated Model comes in. It provides an upper bound for what an ideal fit is.

* Thus, if the Proposed Model is just as good as the Saturated Model, then
$LL(Proposed Model)=LL(Saturated Model)$ and that makes the numerator the same as the denominator and $R²=1$.

* What happens when we exclude the Saturated Model from the equation and plug in the log-likelihood values that we've calculated so far?

$R² = \frac{LL(Null Model) - LL(Proposed Model)}{LL(Null Model)} = \frac{-3.51 - 1.27}{-3.51} = 1.36$

> $R²$ is only supposed to go from 0 to 1.

$R²=\frac{SS(Null Model)-SS(Proposed Model)}{SS(Null Model)-SS(Saturated Model)} = \frac{-3.51 - 1.27}{-3.51 - 7.16} = 0.45$

> Now a reasonable value that is between 0 and 1.

* In summary, the log-likelihood of the Saturated Model ensures that the $R²$ value ranges between 0 and 1.

### Deviance

* **Residual deviance** is defined as: $2\times(LL(Saturated Model) - LL(Proposed Model))$

> The "2 times" part makes the difference in these log-likelihoods have a chi-squared distribution with the degrees freedom equal to the difference in the number of parameters;

> In this case, the degrees of freedom is 4, the number of parameters in the Saturated Model (6) minus the number of parameters in the Proposed Model (2).

$2\times(LL(Saturated Model) - LL(Proposed Model)) = 2\times(7.16 - 1.27) = 11.78$

> He show the chi-square graph distribution with 4 degrees of freedom and the location where the Residual Deviance (11.78) is on the x-axis, and the area under the curve from 11.78 to infinity is 0.02, so the p-value is 0.02. This means the Saturated model is significantly different from the Proposed model;

> For this chi-square test to work correctly, the Proposed model and Saturated model have to be "nested". In other words, the proposed model has to be simpler version of the Saturated model (and not just any old model).

* **Null deviance** is defined as: $2\times(LL(Saturated Model) - LL(Null Model))$

> Again, t he "2 times" part makes the difference in these log-likelihoods have a chi-squared distribution with the degrees freedom equal to the difference in the number of parameters;

> In this case, the degrees of freedom is 5, the number of parameters in the Saturated Model (6) minus the number of parameters in the Null Model (1).

$2\times(LL(Saturated Model) - LL(Null Model)) = 2\times(7.16 - (-3.51)) = 21.34$

> He show the chi-square graph distribution with 5 degrees of freedom and the location where the Null Deviance (21.34)  is on the x-axis, and the area under the curve from 21.34 to infinity is close to 0, so the p-value is close to 0. This means the Saturated model is significantly different from the Null model;

* You can calculate the p-value for the log-likelihood $R²$ from the difference in the deviances

$Null Deviance - Residual Deviance$

* This difference is a chi-square value with degrees of freedom equal to the difference in the number of parameters for the Proposed Model and the Null Model.

> In this case, the degrees of freedom is 1, the number of parameters in the Proposed Model (2) minus the number of parameters in the Null Model (1).

$Null Deviance - Residual Deviance = 21.34 - 11.78 = 9.56$

> He show the chi-s quare graph distribution with 1 degree of freedom and the location where 9.56 is on the x-axis, and the area under the curve from 9.56 to infinity is 0.002, so the p-value for the $R²$ calculated before (0.45) is 0.002. This means that not only does our model have a reasonable effect size ($R² value), we know that that value is not by chance.

* There is more than one way to calculate the chi-square valur for the $R²$. Alternatively, we can calculate the significance of the $R²$ directly by comparing the Proposed Model to the Null Model, since the Null Model is nested within the Proposed Model.

$2\times(LL(Proposed Model) - LL(Null Model))$

> Again, t he "2 times" part makes the difference in these log-likelihoods have a chi-squared distribution with the degrees freedom equal to the difference in the number of parameters;

> However, I mentioned the method that uses Deviances because the Null and Residual deviances are very frequently reported. In contrast, the LL(Proposed Model) and the LL(Null Model) are not always reported.

### Why you can ignore the Saturated Model entirely when you do logistic regression

* When you do logistic regression, you're fitting a squiggle to your data and calculating the log-likelihood of the data given that squiggle. However, with the saturated model, the data squiggle fits the data perfectly, and the log-likelihood of the data is 0, because $log(1)=0$, so the log-likelihood is a big sum of zeros.

* Similarly, the equations for Residual Deviance and Null Deviance reduce to just 2 times the negative log-likelihoods of the Proposed Model and the Null Model.

> These deviances will ultimately be positive numbers because the likelihoods will be numbers between 0 and 1, and the log of a number between 0 and 1 is a negative number, and multiplying a negative number by -1 results in a positive number.

### In summary

* We talked about how the Saturated model provides an upper bound on the log-likelihood for a model and that upper bound is useful for calculating a likelihood base $R²$

$R²=\frac{SS(Null Model)-SS(Proposed Model)}{SS(Null Model)-SS(Saturated Model)}$

* However, with logistic regression, that upper bound is always going to be 0 so we can ignore it.

* We also talked about how residual and Null deviance can be used to calculate the p-value for a likelihood base $R²$

$2\times(LL(Saturated Model) - LL(Proposed Model))$

$2\times(LL(Saturated Model) - LL(Null Model))$

* $Null Deviance - Residual Deviance =$ Chi-squared value with degrees of freedom equal to the number of parameters in the Proposed Model minus the number of parameters in the Null model.
