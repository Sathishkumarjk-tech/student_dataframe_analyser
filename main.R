# Student Data Frame Analyzer
# Run: source("main.R")

students <- data.frame(
  RollNo = c(101, 102, 103, 104, 105),
  Name = c("Arun", "Bala", "Divya", "Kavin", "Meena"),
  Marks = c(78, 64, 95, 42, 35),
  Department = c("CSE", "CSE", "AI&DS", "CSE", "AI&DS"),
  stringsAsFactors = FALSE
)

students$Result <- ifelse(students$Marks >= 40, "Pass", "Fail")
students$Grade <- ifelse(students$Marks >= 90, "A",
                  ifelse(students$Marks >= 75, "B",
                  ifelse(students$Marks >= 60, "C",
                  ifelse(students$Marks >= 40, "D", "F"))))

cat("\n--- STUDENT DATA FRAME ---\n")
print(students, row.names = FALSE)
cat("\nAverage marks:", round(mean(students$Marks), 2), "\n")
cat("Highest marks:", max(students$Marks), "\n")
cat("Lowest marks:", min(students$Marks), "\n")
cat("\nResult frequency:\n")
print(table(students$Result))
cat("\nGrade frequency:\n")
print(table(students$Grade))
cat("\nDepartment frequency:\n")
print(table(factor(students$Department)))
cat("\nStudents who passed:\n")
print(students[students$Result == "Pass", ], row.names = FALSE)

write.csv(students, "student_dataframe_report.csv", row.names = FALSE)
cat("\nReport saved to student_dataframe_report.csv\n")
