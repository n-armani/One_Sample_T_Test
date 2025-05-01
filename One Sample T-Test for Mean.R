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
SE <- pop_sd / sqrt(n)
t_stat <- (sample_mean - pop_mean) / SEM
df <- n - 1


# 4. Calculate Confidence Interval
if (alpha == 0.05) {
  
  SEM <- 1.96*SE
  
}else {
  
  SEM <- 2.58*SE
  
}

CI <- paste0("[", 
             (sample_mean - round(SEM, 2)),
             " : ", 
             (sample_mean + round(SEM, 2)),
             "]")

# 5. Calculate p-value based on tail type
p_value <- switch(tail_type,
                  "Two Tail" = 2 * pt(-abs(t_stat), df),
                  "Right Tail" = 1 - pt(t_stat, df),
                  "Left Tail" = pt(t_stat, df),
                  stop("Invalid tail type"))

# 6. Generate hypotheses based on test type
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

# 7. Generate the conclusion as a string
conclusion <- ifelse(p_value < alpha,
                     paste("Reject the null hypothesis at alpha =", alpha),
                     paste("Fail to reject the null hypothesis at alpha =", alpha))

# 8. Create a summary table
summary_table <- data.frame(Metric = c("H₀",
                                       "H₁",
                                       "Population Mean",
                                       "Sample Mean",
                                       "Population/Sample SD",
                                       "Confidence Interval",
                                       "Sample Size",
                                       "Degrees of Freedom",
                                       "T-Statistic",
                                       "Alpha Level",
                                       "P-Value",
                                       "Test Type",
                                       "Conclusion"),
                            Value = c(H0,
                                      H1,
                                      pop_mean,
                                      sample_mean,
                                      pop_sd,
                                      CI,
                                      n, 
                                      df,
                                      round(t_stat, 
                                            4),
                                      alpha,
                                      round(p_value, 
                                            4),
                                      tail_type,
                                      conclusion))

# 9. Print the summary table
Sum_table <- kable(summary_table, 
                   format = "simple")
cat('\014')
print(Sum_table)
