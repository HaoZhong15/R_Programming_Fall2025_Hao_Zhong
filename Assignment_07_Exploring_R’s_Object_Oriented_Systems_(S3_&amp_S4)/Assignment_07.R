# 1. Choose or Download Data


data("mtcars")

head(mtcars)

str(mtcars)



# 2. Test Generic Functions
summary(mtcars)

print(mtcars)



# 3. Explore S3 vs. S4
# s3

car <- mtcars[3, , drop = FALSE]

car_s3 <- list(
  model = rownames(car),
  cyl   = as.numeric(car$cyl),
  hp   = as.numeric(car$hp),
  mpg    = as.numeric(car$mpg)
)
class(car_s3) <- "car_s3"


print.car_s3 <- function(x, ...) {
  cat("S3 Car\n")
  cat(" model:", x$model, "\n")
  cat(" cyl  :", x$cyl,   "\n")
  cat(" hp  :", x$hp,   "\n")
  cat(" mpg   :", x$mpg,    "\n")
}

print(car_s3)


# s4

setClass("car_s4", slots = c(model = "character", cyl   = "numeric", mpg   = "numeric", hp    = "numeric"))

car_s4 <- new("car_s4", 
              model = rownames(car),
              cyl   = as.numeric(car$cyl),
              hp   = as.numeric(car$hp),
              mpg    = as.numeric(car$mpg))


setMethod("show", "car_s4", function(object) {
  cat("S4 Car\n")
  cat(" model:", object@model, "\n")
  cat(" cyl  :", object@cyl,   "\n")
  cat(" hp  :", object@hp,   "\n")
  cat(" mpg   :", object@mpg,    "\n")
})

car_s4
