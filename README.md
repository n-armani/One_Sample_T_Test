# One_Sample_T_Test
These R scripts are developed to calculate the t-statistic and p-value for a one-sample t-test.
One-Sample T-Test Calculator (R)
This R script provides an interactive tool for performing a one-sample t-test. It prompts the user to input relevant statistical parameters and outputs the t-statistic, p-value, decision, and a summary table including hypotheses.

🧰 **Features**
Accepts user input for:
Population mean
Sample mean
Sample size
Sample standard deviation
Test type (two-tailed, right-tailed, left-tailed)
Significance level (alpha)

**Calculates:**
T-statistic
P-value
Degrees of freedom
Automatically generates:
Null and alternative hypotheses based on test direction
Conclusion based on significance level
Summary table of all results

**📌 Requirements**
R version ≥ 3.5
Suggested package (for table formatting):
knitr

To install knitr:
install.packages("knitr")

▶️ **How to Use**
Open the script in RStudio or any R environment.
Run the script.
Enter the requested values when prompted:
Population mean (μ)
Sample mean
Sample standard deviation (s)
Sample size (n)
Significance level (α)
Type of test: two, left, or right

View the summary output, including:
Test statistics
Hypotheses
Decision based on the p-value

📤 **Output Example**
--- T-Test Summary Table ---

| Metric            | Value                             |
|-------------------|------------------------------------|
| H₀                | H0: Sample mean = Population mean  |
| H₁                | H1: Sample mean ≠ Population mean  |
| Sample Mean       | 5.4                                |
| Population Mean   | 5.0                                |
| Sample Size       | 30                                 |
| Degrees of Freedom| 29                                 |
| T-Statistic       | 2.1234                             |
| Alpha Level       | 0.05                               |
| P-Value           | 0.042                              |
| Test Type         | two                                |
| Conclusion        | Reject the null hypothesis         |

📄 License
This script is free to use for educational and research purposes. Please credit the author when used in teaching or publications.

