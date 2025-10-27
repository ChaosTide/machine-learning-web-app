# ============================================
# Neural Network: Predicting college admission
# ============================================

# Step 0: Install and load the necessary package
# Uncomment the next line if 'neuralnet' is not already installed
# install.packages("neuralnet")
library(neuralnet)

# Step 1: Create training dataset
gre <- c(380, 660, 800, 640, 520, 760)
gpa <- c(3.61, 3.67, 4.00, 3.19, 2.93, 3.00)
rank <- c(3, 2, 4, 1, 1, 2)
admit <- c(0, 1, 1, 1, 0, 1)

# Combine into a dataframe
df <- data.frame(gre, gpa, rank, admit)

# Step 2: Train the neural network
nn <- neuralnet(admit ~ gre + gpa + rank,
                data = df,
                hidden = 3,
                act.fct = "logistic",
                linear.output = FALSE)

# Step 3: Visualize the neural network
plot(nn)

# Step 4: Create test dataset
gre <- c(780, 360, 800)
gpa <- c(3.87, 2.56, 3.75)
rank <- c(4, 3, 2)
test <- data.frame(gre, gpa, rank)

# Step 5: Make predictions on test data
Predict <- compute(nn, test)
prob <- Predict$net.result

# Step 6: Convert probabilities into binary predictions

# Threshold: 0.25
pred_25 <- ifelse(prob > 0.25, 1, 0)

# Threshold: 0.50
pred_50 <- ifelse(prob > 0.50, 1, 0)

# Threshold: 0.75
pred_75 <- ifelse(prob > 0.75, 1, 0)

# Step 7: Display results
cat("Predicted probabilities:\n")
print(prob)

cat("\nPredictions with threshold 0.25:\n")
print(pred_25)

cat("\nPredictions with threshold 0.50:\n")
print(pred_50)

cat("\nPredictions with threshold 0.75:\n")
print(pred_75)

