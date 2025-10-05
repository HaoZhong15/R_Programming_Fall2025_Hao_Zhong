# 1. Matrix Addition & Subtraction
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# Compute A + B
A_plus_B <- A + B
A_plus_B

# Compute A - B
A_minus_B <- A - B
A_minus_B


# 2. Create a Diagonal Matrix
D <- diag(c(4, 1, 2, 3))
D

# 3. Construct a Custom 5×5 Matrix
D <- diag(3, 4)

S <- rbind(c(1, 1, 1, 1), D)
Z <- cbind(c(3, 2, 2, 2, 2), S)

Z
