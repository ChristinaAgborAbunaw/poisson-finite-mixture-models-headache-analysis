# ============================================================
# POISSON FINITE MIXTURE MODEL ANALYSIS
# Headache Frequency Data
# ============================================================

# Load data

d <- read.csv("01_Data/headache_clean.csv")

# ------------------------------------------------------------
# 2.5 BOX PLOT
# ------------------------------------------------------------

par(mar = c(4, 4, 2, 1))

hist(d$frequency, breaks = 25, freq = FALSE, col = "lightblue", border = "white", xlab = "Number of headache days at baseline", ylab = "Density", main = "Distribution of Headache Frequency")

lines(density(d$frequency, na.rm = TRUE), col = "red", lwd = 2)

boxplot(d$frequency, horizontal = TRUE, col = "lightblue", xlab = "Number of headache days at baseline", main = "Boxplot of Headache Frequency")

# ------------------------------------------------------------
# 2.6 AGE DISTRIBUTION
# ------------------------------------------------------------

hist(d$age, freq = FALSE, col = "lightblue", border = "white", xlab = "Age", ylab = "Density", main = "Distribution of Age")

lines(density(d$age, na.rm = TRUE), col = "red", lwd = 2)

# ============================================================
# PART 3. INFERENTIAL STATISTICS
# ============================================================

if (!requireNamespace("flexmix", quietly = TRUE)) {
  install.packages("flexmix")
}

library(flexmix)
library(CAMAN)

# ------------------------------------------------------------
# 3.3 POISSON REFERENCE MODEL
# ------------------------------------------------------------

frequency_mean <- mean(d$frequency, na.rm = TRUE)
poisson_lambda <- frequency_mean
poisson_lambda

# ------------------------------------------------------------
# 3.4 NPMLE / VEM GRADIENT ANALYSIS
# ------------------------------------------------------------

npmle_vem <- mixalg.VEM(obs = "frequency", family = "poisson", data = d, numiter = 50000, acc = 1e-7, startk = 25)

summary(npmle_vem)
npmle_vem@t
npmle_vem@p
npmle_vem@num.k

# ------------------------------------------------------------
# 3.5 NPMLE GRADIENT FUNCTION
# ------------------------------------------------------------

plot(npmle_vem@totalgrid[, 2], npmle_vem@totalgrid[, 3], type = "l", lwd = 3, col = "steelblue4", xlab = expression(lambda), ylab = "Gradient", main = "Gradient Function for the Headache Data")
abline(h = 1, lty = 2, lwd = 2, col = "gray40")

png("03_Output/gradient_function_npmle.png", width = 1200, height = 800, res = 150)
plot(npmle_vem@totalgrid[, 2], npmle_vem@totalgrid[, 3], type = "l", lwd = 3, col = "steelblue4", xlab = expression(lambda), ylab = "Gradient", main = "Gradient Function for the Headache Data")
abline(h = 1, lty = 2, lwd = 2, col = "gray40")
dev.off()

# ------------------------------------------------------------
# 3.6-3.9 POISSON MIXTURE MODELS
# ------------------------------------------------------------

set.seed(123)
poisson_mix_2 <- flexmix(frequency ~ 1, data = d, k = 2, model = FLXMRglm(family = "poisson"))
poisson_mix_3 <- flexmix(frequency ~ 1, data = d, k = 3, model = FLXMRglm(family = "poisson"))
poisson_mix_4 <- flexmix(frequency ~ 1, data = d, k = 4, model = FLXMRglm(family = "poisson"))
poisson_mix_5 <- flexmix(frequency ~ 1, data = d, k = 5, model = FLXMRglm(family = "poisson"))

summary(poisson_mix_2)
summary(poisson_mix_3)
summary(poisson_mix_4)
summary(poisson_mix_5)

model_comparison <- data.frame(Components = 2:5, AIC = c(AIC(poisson_mix_2), AIC(poisson_mix_3), AIC(poisson_mix_4), AIC(poisson_mix_5)), BIC = c(BIC(poisson_mix_2), BIC(poisson_mix_3), BIC(poisson_mix_4), BIC(poisson_mix_5)))
model_comparison
write.csv(model_comparison, "03_Output/model_comparison.csv", row.names = FALSE)

# ------------------------------------------------------------
# 3.11 FINAL THREE-COMPONENT MODEL WITH AGE
# ------------------------------------------------------------

set.seed(123)
poisson_mix_age <- flexmix(frequency ~ age, data = d, k = 3, model = FLXMRglm(family = "poisson"))
summary(poisson_mix_age)

final_parameters <- parameters(poisson_mix_age)
final_parameters

# ------------------------------------------------------------
# 3.13 POSTERIOR CLASSIFICATION
# ------------------------------------------------------------

classification_original <- clusters(poisson_mix_3)
lambda_original <- exp(parameters(poisson_mix_3))
lambda_original

component_order <- c(2, 3, 1)
lambda_3 <- lambda_original[component_order]
lambda_3

classification_3 <- match(classification_original, component_order)
table(classification_3)

# ------------------------------------------------------------
# 3.14 POSTERIOR CLASSIFICATION PLOT
# ------------------------------------------------------------

par(mar = c(5, 5, 7, 2))
plot(1:nrow(d), d$frequency, type = "n", xlab = "Observation", ylab = "Number of headache days at baseline", main = "Posterior Classification of Patients", ylim = range(d$frequency, na.rm = TRUE))
points(1:nrow(d), d$frequency, col = classification_3, pch = 19)
mtext(paste0("● Component 1 (λ = ", round(lambda_3[1], 2), ")    ", "● Component 2 (λ = ", round(lambda_3[2], 2), ")    ", "● Component 3 (λ = ", round(lambda_3[3], 2), ")"), side = 3, line = 1, cex = 0.9)

png("03_Output/posterior_classification_patients.png", width = 1400, height = 1100, res = 150)
par(mar = c(5, 5, 7, 2))
plot(1:nrow(d), d$frequency, type = "n", xlab = "Observation", ylab = "Number of headache days at baseline", main = "Posterior Classification of Patients", ylim = range(d$frequency, na.rm = TRUE))
points(1:nrow(d), d$frequency, col = classification_3, pch = 19)
mtext(paste0("● Component 1 (λ = ", round(lambda_3[1], 2), ")    ", "● Component 2 (λ = ", round(lambda_3[2], 2), ")    ", "● Component 3 (λ = ", round(lambda_3[3], 2), ")"), side = 3, line = 1, cex = 0.9)
dev.off()

# ------------------------------------------------------------
# 3.15 SAVE FINAL RESULTS
# ------------------------------------------------------------

write.csv(final_parameters, "03_Output/final_model_parameters.csv", row.names = TRUE)
write.csv(data.frame(Observation = 1:nrow(d), Frequency = d$frequency, Component = classification_3), "03_Output/posterior_classification.csv", row.names = FALSE)

# ============================================================
# END OF R ANALYSIS
# ============================================================
