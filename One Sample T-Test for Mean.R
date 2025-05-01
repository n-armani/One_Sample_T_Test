#-----------------------------------------------------------------------#
# File name        : One Sample T-Test
# Project          :
# Developer        : Nathan Armani
#-----------------------------------------------------------------------#
# Purpose          : Calculate one sample T-test  
#                   using R
#-----------------------------------------------------------------------#
# Created by       : Nathan Armani
# Created date     : May. 01, 2025
#-----------------------------------------------------------------------#
# Revised by       :
# Revised date     :
# Revision details : 
# Notes:
#-----------------------------------------------------------------------#
# Load knitr for table formatting if available
if (!requireNamespace("knitr", quietly = TRUE)) {
  install.packages("knitr")
}
library(knitr)

# Turn off warnings and set options
options(warn = -1, 
        scipen = 999, 
        error = traceback)

rm(list = ls())
cat("\014") 

# 1. Ask the population mean and standard deviation, sample mean and sample size
pop_mean <- as.numeric(readline(prompt = "Enter the population mean (µ): "))
pop_sd <- as.numeric(readline(prompt = "Enter the population (σ) or sample standard deviation : "))
sample_mean <- as.numeric(readline(prompt = "Enter the sample mean (x Bar): "))
n <- as.integer(readline(prompt = "Enter the sample size (n): "))

# 2. Ask tail type and alpha level
tail_type <- readline(prompt = "Enter the type of test (Two Tail, Right Tail, or Left Tail): ")
alpha <- as.numeric(readline(prompt = "Enter the significance level (alpha, e.g., 0.05): "))

# 3. Calculate t-statistic
t_stat <- (sample_mean - pop_mean) / (pop_sd / sqrt(n))
df <- n - 1

# 4. Calculate p-value based on tail type
p_value <- switch(tail_type,
                  "Two Tail" = 2 * pt(-abs(t_stat), df),
                  "Right Tail" = 1 - pt(t_stat, df),
                  "Left Tail" = pt(t_stat, df),
                  stop("Invalid tail type"))

# 5. Generate hypotheses based on test type
if (tail_type == "Two Tail") {
  H0 <- "H0: Sample mean = Population mean"
  H1 <- "H1: Sample mean ≠ Population mean"
} else if (tail_type == "Right Tail") {
  H0 <- "H0: Sample mean ≤ Population mean"
  H1 <- "H1: Sample mean > Population mean"
} else if (tail_type == "Right Tail") {
  H0 <- "H0: Sample mean ≥ Population mean"
  H1 <- "H1: Sample mean < Population mean"
} else {
  stop("Invalid test type. Use 'two', 'left', or 'right'.")
}

# 6. Generate the conclusion as a string
conclusion <- ifelse(p_value < alpha,
                     paste("Reject the null hypothesis at alpha =", alpha),
                     paste("Fail to reject the null hypothesis at alpha =", alpha))

# 7. Create a summary table
summary_table <- data.frame(Metric = c("H₀",
                                       "H₁",
                                       "Sample Mean",
                                       "Population Mean",
                                       "Population/Sample SD",
                                       "Sample Size",
                                       "Degrees of Freedom",
                                       "T-Statistic",
                                       "Alpha Level",
                                       "P-Value",
                                       "Test Type",
                                       "Conclusion"),
                            Value = c(H0,
                                      H1,
                                      sample_mean,
                                      pop_mean,
                                      pop_sd,
                                      n, 
                                      df,
                                      round(t_stat, 
                                            4),
                                      alpha,
                                      round(p_value, 
                                            4),
                                      tail_type,
                                      conclusion))

# 8. Print the summary table
Sum_table <- kable(summary_table, 
                   format = "simple")
cat('\014')
print(Sum_table)


