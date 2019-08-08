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
