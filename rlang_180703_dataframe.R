#function?œ¼ë¡? ê°ì²´?™” ?• ê²?
#4ê°€ì§€ê°€ ë°˜ë“œ?‹œ ?žˆ?–´?•¼ function?´ ?œ?‹¤. R syntax
grade <- function(name,kor,eng,math){
  x <- c (kor,eng,math)
  return(list(
    name = name,
    sum = sum(x),
    mean = mean(x)%/%1,
    grade = switch(
      toString(mean(x)%/%10),
      '10' = 'A',
      '9' = 'A',
      '8' = 'B',
    '7' = 'C',
    '6' = 'D',
    '5' = 'E',
    '4' = 'F',
    'F'
  )))
}

kim <- grade("ê¹€?™",60,60,70)
lee <- grade("?´?ˆœ?‹ ",90,80,60)
hong <- grade("?™ê¸¸ë™",80,60,70)
ahn <- grade("?•ˆì¤‘ê·¼",85,95,54)
res <-

grade.data <- data.frame(
  grade_num = c(1:4),
  grade_name = c(kim$name,lee$name,hong$name,ahn$name),
  grade_sum = c(kim$sum,lee$sum,hong$sum,ahn$sum),
  grade_mean = c(kim$mean,lee$mean,hong$mean,ahn$mean),
  grade_grade = c(kim$grade,lee$grade,hong$grade,ahn$grade),
  stringsAsFactors = FALSE
)

result <-data.frame(grade.data$grade_sum,grade.data$grade_mean,grade.data$grade_grade)
print(result)
print(gradedata)

class(kim$name)
class(kim$sum)
class(kim$mean)
class(kim$grade)


# Create the data frame.
emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
                         "2015-03-27")),
  stringsAsFactors = FALSE
)
class()
# Print the data frame.			
print(emp.data) 