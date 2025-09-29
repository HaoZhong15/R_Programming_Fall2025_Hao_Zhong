# 1
# Matrix A
A <- matrix(1:100, nrow = 10)

# Matrix B
B <- matrix(1:1000, nrow = 10)


# 2 Inspect dimensions

dim(A)  
dim(B)  


# 3 Compute inverse and determinant
# For A 
invA <- solve(A)     
detA <- det(A)       

# For B 
invB <- tryCatch(solve(B), error = function(e) e)
detB <- tryCatch(det(B),   error = function(e) e)



invA      
detA    


invB      
detB     
