# # Modeling Heterogeneous Headache Frequency Using Poisson Finite Mixture Models in R and SAS

### Graduate-Level Biostatistics Research Project

**Author:** Christina Agbor Abunaw

**Institution:** Transnational University Limburg (UHasselt), Belgium (Course Project)

**Tools:** R • SAS • Poisson Finite Mixture Models • NPMLE • EM Algorithm • Count Data Analysis • Biostatistics

---

## Overview

This project investigates latent heterogeneity in headache frequency among patients enrolled in a randomized clinical trial comparing acupuncture and placebo treatments.

Rather than assuming all patients belong to a single population, a **Poisson Finite Mixture Model (PFMM)** was used to identify hidden patient subgroups while accounting for over-dispersion in count data.

The statistical analysis was conducted using **R** and **SAS**, with parameter estimation performed using **Nonparametric Maximum Likelihood Estimation (NPMLE)** and the **Expectation-Maximization (EM) algorithm**.


## Research Question

Can headache frequency among patients be adequately modeled using a single Poisson distribution, or does the data exhibit latent population heterogeneity requiring a Poisson finite mixture model?

Additionally, does patient age explain the observed clustering within the headache frequency distribution?


## Statistical Methods

The analysis followed a structured statistical workflow:

- Exploratory Data Analysis (EDA)
- Descriptive Statistics
- Assessment of Over-dispersion
- Poisson Distribution
- Poisson Finite Mixture Modeling (PFMM)
- Nonparametric Maximum Likelihood Estimation (NPMLE)
- Expectation-Maximization (EM) Algorithm
- Posterior Probability Classification
- Poisson Regression with Age as a Covariate


## Dataset

The dataset consists of **401 patients** enrolled in a randomized clinical trial comparing acupuncture and placebo treatments for severe headache.

### Variables

| Variable | Description |
|----------|-------------|
| Frequency | Number of headache days during the four-week baseline period |
| Age | Patient age at baseline |

The data were analyzed to investigate latent heterogeneity in headache frequency and evaluate whether age explained the observed clustering among patients.


## Key Findings

The analysis produced several important findings:

- A **three-component Poisson finite mixture model** provided the best representation of the headache frequency data.

- The finite mixture model successfully accounted for the observed over-dispersion in the count data.

- Patients were classified into three latent subgroups using posterior probabilities.

- Patient age showed a statistically significant effect in one mixture component but did not fully explain the clustering observed in the data.

- The findings suggest that additional unmeasured factors may contribute to the heterogeneity in headache frequency among patients.


## Repository Structure

```text
.
├── README.md                 # Project overview
├── report/                   # Final research report (PDF)
├── latex/                    # LaTeX source files
├── R/                        # R scripts
├── SAS/                      # SAS programs
├── data/                     # Dataset (if publicly shareable)
├── figures/                  # Plots and visualizations
└── LICENSE
