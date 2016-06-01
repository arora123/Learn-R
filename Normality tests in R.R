# TEST OF NORMALITY

# Graphical Methods -------------------------------------------------------

## Generate two data sets
## First Normal, second from a t-distribution
data1 = rnorm(100); data2 = rt(100, df=3)

## Have a look at the densities
plot(density(data1));plot(density(data2))
# Shows data1 is normal, data2 is not

## To see the histogram
hist(data1, 10, col='blue')
hist(data2, 10, col='red')

## To look at a qqplot
qqnorm(data1);qqline(data1, col = 2)
qqnorm(data2);qqline(data2, col = 2)
# Shows data1 is normal, data2 is not

# Statistical Tests -------------------------------------------------------

## Perform the Shapiro Wilk test
shapiro.test(data1); shapiro.test(data2)
# Confirms data1 is normal, data2 is not

# Skewness and Kurtosis test
# To test whether the kurtosis and skewness are significantly different from zero.

To do this, we need to get:
  
kurtosis.test <- function (x) {
    m4 <- sum((x-mean(x))^4)/length(x)
    s4 <- var(x)^2
    kurt <- (m4/s4) - 3
    sek <- sqrt(24/length(x))
    totest <- kurt/sek
    pvalue <- pt(totest,(length(x)-1))
        pvalue 
  }

skew.test <- function (x) {
  m3 <- sum((x-mean(x))^3)/length(x)
  s3 <- sqrt(var(x))^3
  skew <- m3/s3
  ses <- sqrt(6/length(x))
  totest <- skew/ses
  pt(totest,(length(x)-1))
  pval <- pt(totest,(length(x)-1))
  pval
}

kurtosis.test(data1); kurtosis.test(data2)

skew.test(data1); skew.test(data2)

# Other normality tests can be found in nortest package