# 18 - Regularization - Ridge regression

* We have a collection of weight and size of mice, since it look linear we'll use linear regression to model the relationship between weight and size. So we'll fit a line to the data using least squares (we find the line that results in the minimum sum of squared residuals)

$Size\ =\ 0.9\ +\ 0.75\ \times\ Weight$

> The line has two parameters, a y-axis intercept and a slope.

* When we have a lot of measurements, we can be fairly confident that **Least Squares** line accurately reflects the relationship between **size** and **weight**.

* But what if we only have two measurements?

1. We fit a **new line** with **least squares**. Since the **new line** overlaps the two data points, the **minimum sum of squared residuals = 0.**

$Size\ =\ 0.4\ +\ 1.3\ \times\ Weight$

> Let's call the *new line* with two red dots the **training data** and the first line with green dots the **testing data**;

> The sum of the squared residuals for just the **trainingd data** is small (in this case it is 0), but the sum of the squared residuals for the **testing data** is large;

> That means that the **new line** has **high variance** (is **over fit** to the **training data**).

* We just saw that **least squares** results in a **new line** that is **over fit** and has **high variance**. The main idea behind **Ridge regression** is to find a **new line** that doesn't fit the **training data** as well.

> We introduce a small amount of **bias** into how the **new line** is fit to the data, but in return for that small amount of **bias**, we get a significant drop in **variance**;

> In other words, by starting with a slightly worse fit, **Ridge regression** can provide a better long term predictions.

### How it works?

* When **least squares** determines values for the parameters in this equation $Size\ =\ y-axis\ intercept\ +\ slope\ \times\ weight$, it minimizes the **sum of the squared residuals**.

* In contrast, when **Ridge regression** determines values for the parameters in this equation $Size\ =\ y-axis\ intercept\ +\ slope \times\ weight$, it minimizes the $**sum of the squared residuals**\ +\ \lambda\ \times\ slope²$ 

> $**the slope²**$ this part of the equation adds a penalty to the traditional **least squares** method and $\lambda$ (lambda) determines how severe that penalty is.

* Let's start by plugging in the numbers that correspond to the **least squares fit**.

$Size\ =\ 0.4\ +\ 1.3\ \times\ Weight\ the\ sum\ of\ the\ squared\ residuals\ +\ \lambda\ \times\ \the \slope²$

> **The sum of squared residuals** for the **least squares fit** is **0** (because the line overlaps the data points); **The slope** is 1.3; $\lamda\ =\ 1$ (why?)

> When we do the math we get $0\ +\ 1\ \times\ 1.3^2\ =\ 0\ +\ 1.69\ =\ 1.69$

* Now let's see what happens when we plug in numbers for the **Ridge regression** line

$Size\ =\ 0.9\ +\ 0.8\ \times\ Weight\ the\ sum\ of\ the\ squared\ residuals\ +\ \lambda\ \times\ \the \slope²$

> **The sum of the squared residuals** is $0.3²\ +\ 0.1²$; The slope is $0.8²$ and like before the $\lambda\ =\ 1$

> When we do the math $0.3²\ +\ 0.1²\ +\ 1\ \times\ 0.8²\ =\ 0.09\ +\ 0.01\ +\ 0.64\ =\ 0.74$

* For the **least squares line**, the sum of squared residuals plus the **Ridge Regression Penalty** is 1.69. For the **Ridge regression line**, the sum of squared residuals plus the **Ridge Regression Penalty** is 0.74.

* Thus, if we wanted to minimize the sum of the squared residuals plust the **Ridge Regression Penalty**, we would choose the **Ridge Regression Line** over the **Least Squares Line**.

* Without the small amount of **Bias** that the penalty creates, the **Least Squares Fit** has a large amount of **variance**. In contrast, the **Ridge regression line**, which has the small amount of **bias** due to the penalty, has less **variance**.

### About the effect that *Ridge regression penalty* has on how the line is fit to the data

* Imagine we only have one line, this line suggests that for every one unit increase in **weight** there is a one unit increase in predicted **size**.

* If the slope of the line is steeper then for every one unit increase in **weight**, the prediction for **size** increases by over two units. In other words, when the slope of the line is steep, then the prediction for **size** is very sensitive to relatively small changes in **weight**.

* When the slope is small, then for every one unit increase in **weight** the prediction for **size** barely increases. In other words, when the slope of the line is small, then predictions for **size** are much less sensitive to changes in **weight**.

* Now let's go back to the **least squares** and **ridge regression** lines fit to the two data points. The **ridge regression penalty** resulted in a line that has a smaller slope, sso the predictions are less sensitive to **weight** than the **least squares** line.

### Let's go back to the equation that **ridge regression** tries to minimize and talk about $\lambda$

$the\ sum\ of\ the\ squared\ residuals\ +\ \lambda\ \times\ \the \slope²$

* Lambda can be any value from 0 to +inf

* When the $\lamda\ =\ 0$, then the **Ridge regression penalty is also 0 and that means that the **Ridge regression line** will only minimize the sum of squared residuals and the **Ridge regression line** will be the same as the **Least squares line** because they are both minimizing the exact same thing.

* Now let's see what happens as we increase the value for $\lambda$. In the example, we set $\lambda\ =\ 1$ and the **Ridge regression line** ended up with a smaller slope than the **Least squares line**.

> When we set $\lambda\ =\ 2$, the slope gets even smaller and the larger we make $\lambda$, the slope gets asymptotically close to 0. SO the larger $lambda$ gets, our predictions for **Size** become less and less sensitive to **Weight**

* So how do we decide what value to give $\lambda$?

> We just try a bunch of values for $\lambda$ and use **Cross validation**, typically **10-fold Cross Validation**, to determine which one results in the lowest **Variance**

* In the example, we showed how **Ridge regression** would work when we want to predict **Size**, which is a continuous variable using **Weight**, which is also a continuous variable. However, **Ridge regression** also works when we use a discrete variable, like **Normal diet vs High Fat Diet**, to predict **Size**.

$Size\ =\ 1.5\ +\ 0.7\ \times\ High\ Fat\ Diet$

> Where 1.5, the equivalent of y-intercept, corresponds to the average **Size** of the mice on the **Normal Diet** and 0.7, the equivalent of a slope, corresponds to the difference between the average **Size** for the mice on the **Normal diet** compared to mice on the **High Fat Diet** (the distance between 1.5 and 0.7 is the **Diet difference**);

> **High Fat Diet** is either 0, for mice on the **Normal Diet** or 1, for mice on the **High Fat Diet**. In other words, this term alone predicts the **Size** of mice on the **Normal Diet** and the sum of these two terms is the prediction for the **Size** of the mice on the **High Fat Diet**;

> For the mice on the **Normal Diet**, the residuals are the distances between the mice and the **Normal Diet Mean** and for the mice on the **High Fat Diet**, the residuals are distances between the mice and the **High Fat Diet** mean;

> When **Least Squares** determines values for the parameters in this equation it minimizes **the sum of the squared residuals**. In other words, these distances between the data and the means are minimized;

> When **Ridge Regression** determines values for the parameters in this equation it minimizes **the sum of the squared residuals + $\lambda\ \times$ Diet Difference²** (**Diet Difference** is the distance between the mice in **Normal Diet** and mice in the **High Fat Diet**;

> When $\lambda\ =\ 0$ the final term ends up being 0, and we get the same equation that we got with **Least Squares**. But when $lambda$ get's large, then the only way to minimize the whole equation is to shrink **Diet Distance** down. In other words, as $\lambda$ gets larger, our prediction for the **Size** of mice on the **High Fat Diet** becomes less sensitive to the difference between the **Normal Diet** and the **High Fat Diet**.

* Remember, the whole point of doing **Ridge Regression** is because small sample sizes like these can lead to poor **Least Squares estimates that result in terrible machine learning predictions

* **Ridge regression** can also be applied to **Logistic Regression**. In the example, we're using **weight** to predict if a mouse is obese or not.

$Is\ Obese\ =\ y-intercept\ +\ slope\ \times\ Weight$

> This is the equation for this **Logistic Regression** and **Ridge Regression and **Ridge Regression** would shrink the estimate for the **slope**, making our prediction about wheter or not a mouse is obese less sensitive to **Weight**.

> When applied to Logistic Regression, **Ridge Regression** optimizes **the sum of the likelihoods** instead of the squared residuals, because logistic regression is solved using **Maximum Likelihood**
$the\ sum\ of\ the\ likelihoods\ +\ \lambda\ \times\ \the \slope²$

* So far we've seen simple examples of how **Ridge Regression** helps **reduce variance** by **shrinking parameters** and **making our predictions less sensitive to them**, but we can apply **Ridge regression** to complicated models as well. A new model, we've combined the **weight** measurement data from the first example with the two **diets** from the second example.

$Size\ =\ y-intercept\ +\ slope\ \times\ weight\ +\ diet\ difference\ \times\ high\ fat\ diet$

> and the **Ridge regression** tries to minimize this.

$the\ sum\ of\ the\ squared\ residuals\ +\ \lambda\ \times\ \(slope²\ +\ diet\ difference²)$

> Now the **Ridge regression penalty** contains the parameters for the **slope** and the **differece between diets**. In general, the **Ridge Regression Penalty** contains all of the parameters except for the **y-intercept**.

* If we had a bit equation with many terms, then the **ridge regression penalty** would have all those parameters squared, except for the y-intercept. Every parameter, except for the **y-intercept**, is scaled by the measurements and that's why the **y-intercept** is not included in the **Ridge Regression Penalty**

### Random stuff

$Size\ =\ y-intercept\ +\ slope\ \times\ weight$

* In order for **least squares** to solve for the parameters, the **y-intercept** and **slope** we need at least two data points.

$Size\ =\ 0.4\ +\ 1.3\ \times\ weight$

* If we only had one data point, then we wouldn't be able to solve for these parameters. Because there would be no way to tell that the fit line is better then another aleatory one that goes threought the one data point (all the lines have zero residual, and thus, all minimize the sum of the squared residuals).

* It's not until we have two data points that it becomes clear that there is the **least squares** solution.

* Let's look an equation that has three parameters to estimate. We need to estimate a **y-intercept** a slope that reflects how **Weight** contributes to the prediction of **Size** and a **slope** that reflects how **age** contributes to the prediction of **size**. When we have three parameters to estime, then just two data points isn't going to cut it.

$Size\ =\ y-intercept\ +\ slope1\ \times\ weight\ +\ slope2\ \times\ Age$

> That's because in three dimensions, which is what we get when we add another axis to our graph for **age**, we have to fit a plane to the data instead of just a line, and with only two data points, there's no reason why this plane fits the data any better than another plane. But with three data points, we can solve for thes parameters:

$size\ =\ 0.9\ +\ 0.1\ \weight\ +\ 0.2\ \times\ age$

* For an equation with four parameters, then **least squares** needs at least four data points to estimate all four parameters. And for an equation with 10,001 parameters, then we need at least 10,001 data points to estimate all of the parameters (more common than we expect).

> For example, we might use gene expression measurements for 10,000 genes to predict **size**, and that would mean we would need gene expression measurements from 10,000 mice (expensive and time consuming). In practice, a "huge" dataset might have measurements from 500 mice. So, what do we do if we have an equation with 10,001 parameters and only 500 data points?

> We use **ridge regression**. It turns out that by adding the **ridge regression penalty**, we can solve for all 10,001 parameters with only 500 (or fewer) samples.

$Size\ =\ y-intercept\ +\ slope1\ \times\ gene1\ +\ slope2\ \times\ gene2\ +\ ...\ +\ slope10000\ \times\ gene10000$

$the\ sum\ of\ the\ squared\ residuals\ +\ \lambda\ \times\ \(slope1²\ + slope2²\ +\ ...\ +\ slope10000²)$

* One way is the first example, there is only one datapoint in the **Training Set**, **least squares can't find a single optimal solution, since any line that goes through the dot will minimize the sum of the squared residuals, but **ridge regression** can find a solution with **cross validation** and the **ridge regression penalty** that favors smaller parameter values.

### In summary

* When the sample sizes are relatively small, then **Ridge regression** can improve predictions made from new data (reduce **variance**) by making the predictions less sensitive to the **training data**. This is done by the **ridge regression penalty** to the thing that must be minimized.

* The **ridge regression penalty** itself is $\lamda\ \times\ Slope²$ (been the slope² all squared parameters, except for the **y-intercept)

> and $\lambda$ is determined using **cross validation**

* Lastly, even when there isn't enought data to find the **least squares** parameter estimates, **ridge regression** can still find a solution with **cross validation** and the **ridge regression penalty**.

---

# 19 - Regularization - Lasso regression

