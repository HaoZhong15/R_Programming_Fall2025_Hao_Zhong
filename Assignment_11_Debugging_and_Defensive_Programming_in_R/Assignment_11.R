# Correct code:

# 3. Fix the Code
tukey.outlier <- function(x, k = 1.5) {
  if (!is.numeric(x)) stop("tukey.outlier() expects a numeric vector.")
  q <- quantile(x, c(0.25, 0.75), na.rm = TRUE)
  H <- k * IQR(x, na.rm = TRUE)
  (x < (q[1] - H)) | (x > (q[2] + H))
}  # AI assist. I first run without this code and receive error: "Error in tukey.outlier (x [, j]): There is no function for 'tukey.outlier'"



tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

# 4. run again
corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

corrected_tukey(test_mat)
