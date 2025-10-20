Blog link: https://haozhong35.blogspot.com/2025/10/4370-assignment-8-inputoutput-string.html

For this assignment, if I use the provided original "Assignment 6 Dataset", I will keep receiving error: > gender_mean <- ddply(student6, "Sex", summarise, GradeAverage = mean(Grade, na.rm = TRUE))  Error on FUN (X [i],...): Object 'Tex' not found.
I think the reason is that the original dataset has mistake which is already seperated by comma. So I have to fix the dataset by deleting the comma to continue the assignment.
