# Lis 4370
# Assignment 4

# Step 1
Frequency     <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
BloodPressure <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
FirstAssess   <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)    # bad=1, good=0
SecondAssess  <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)    # low=0, high=1
FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)    # low=0, high=1

df_hosp <- data.frame(
  Frequency, BloodPressure, FirstAssess,
  SecondAssess, FinalDecision, stringsAsFactors = FALSE
)

summary(df_hosp)
df_hosp <- na.omit(df_hosp)  

# Step 2
# First Assessment
boxplot(BloodPressure ~ FirstAssess,
  data  = df_hosp,
  names = c("Good", "Bad"),   # 0=Good, 1=Bad
  ylab  = "Blood Pressure",
  main  = "BP by First MD Assessment",
  col   = c("blue", "red")
)

# Second Assessment
boxplot(BloodPressure ~ SecondAssess,
  data  = df_hosp,
  names = c("Low", "High"),   # 0=Low, 1=High
  ylab  = "Blood Pressure",
  main  = "BP by Second MD Assessment",
  col   = c("green", "orange")
)

# Final Decision
boxplot(BloodPressure ~ FinalDecision,
data  = df_hosp,
names = c("Low", "High"),   # 0=Low, 1=High
ylab  = "Blood Pressure",
main  = "BP by Final Decision",
col   = c("gray", "pink")
)


# Step 3
# Visut Frequency
hist(
  df_hosp$Frequency,
  breaks = seq(0, 1, by = 0.1),
  xlab   = "Visit Frequency",
  main   = "Histogram of Visit Frequency",
  col    = "lightblue",
  border = "black"
)

# Blood Pressure
hist(
  df_hosp$BloodPressure,
  breaks = 8,                    
  xlab   = "Blood Pressure",
  main   = "Histogram of Blood Pressure",
  col    = "lightyellow",
  border = "black"
)

savehistory("assignment_04.R")





