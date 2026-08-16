# Modeling Heterogeneous Headache Frequency Using Poisson Finite Mixture Models in R and SAS

### Graduate-Level Biostatistics Research Project

**Author:** Christina Agbor Abunaw  
**Institution:** Transnational University Limburg (UHasselt), Belgium  
**Software:** R and SAS

## Overview

This project investigates heterogeneity in baseline headache frequency using Poisson finite mixture models. The analysis examines whether the observed count distribution can be adequately described by a single Poisson distribution or whether latent patient groups provide a better representation.

The analysis combines descriptive statistics, assessment of over-dispersion, nonparametric maximum likelihood estimation (NPMLE), Poisson finite mixture modelling, posterior classification, and an age-adjusted mixture model. R and SAS were used as complementary implementations.

## Research Questions

1. Does a single Poisson model adequately describe the observed headache-frequency data?
2. Is there evidence of latent heterogeneity that supports a finite mixture model?
3. How many mixture components provide an appropriate balance between fit and parsimony?
4. Does patient age explain part of the heterogeneity in headache frequency?

## Main Findings

- The data showed substantial over-dispersion relative to a standard Poisson model.
- NPMLE gradient analysis supported the presence of multiple underlying frequency groups.
- Poisson finite mixture models with two through five components were compared using AIC and BIC.
- The three-component model was retained for substantive interpretation because it provided the lowest AIC and clearly distinguishable latent groups, while BIC favored the two-component model.
- The estimated three-component means represented low-, moderate-, and high-frequency headache groups.
- CAMAN and FlexMix produced closely comparable component estimates.
- Age was statistically significant in one component of the age-adjusted model but did not fully explain the observed heterogeneity.
- Model diagnostics indicated some underestimation at the upper boundary of the observed headache-frequency range.

## Repository Structure

```text
.
├── README.md
├── 01_Data/
│   ├── data.csv
│   └── headache_clean.csv
├── 02_Code/
│   ├── R/
│   └── SAS/
├── 03_Output/
├── latex/
│   ├── main.tex
│   ├── References.bib
│   └── sections/
└── report/
```

## Final Report

The completed report is available in the repository as:

[headache_poisson_finite_mixture_model.pdf](headache_poisson_finite_mixture_model.pdf)

## Reproducibility

The LaTeX source, bibliography, analysis code, outputs, and supporting material are organized so that the statistical workflow can be reviewed and reproduced from the project files. Patient-level data should only be redistributed where permitted by the applicable data-use conditions.
