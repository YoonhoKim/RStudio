#function으로 객체화 할것
#4가지가 반드시 있어야 function이 된다. R syntax
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

a <- grade("김동",60,60,70)
b <- grade("이순신",90,80,60)
c <- grade("홍길동",80,60,70)
d <- grade("안중근",85,95,54)
e <- grade("돼지",100,100,100)

grade.data <- data.frame(
  grade_num = c(1:5),
  grade_name = c(a$name,b$name,c$name,d$name,e$name),
  grade_sum = c(a$sum,b$sum,c$sum,d$sum,e$sum),
  grade_mean = c(a$mean,b$mean,c$mean,d$mean,e$mean),
  grade_grade = c(a$grade,b$grade,c$grade,d$grade,e$grade),
  stringsAsFactors = FALSE
)

result <-data.frame(grade.data$grade_sum,grade.data$grade_mean,grade.data$grade_grade)
print(result)
print(grade.data)

bmi <- function(height, weight){
  BMI <- (weight)/(height*height/10000)
  if(BMI<18.5) res <- "저체중" else 
    if(BMI<23) res <- "정상"else 
      if(BMI<25) res <- "비만 전단계"else 
        if(BMI<30) res <- "1단계 비만"else 
          if(BMI<35) res <- "2단계 비만"else
            res <- "3단계 비만"  
          return (list(height=height,weight=weight,res,round(BMI)=BMI))  
}
aa<-bmi(167,67)
bb<-bmi(182,100)
cc<-bmi(112,42)
dd<-bmi(177,120)
ee<-bmi(166,41)

bmi.data <- data.frame(
  BMI_height = c(aa$height,bb$height,cc$height,dd$height,ee$height),
  BMI_weight = c(aa$weight,bb$weight,cc$weight,dd$weight,ee$weight),
  #BMI_BMI = c(aa$BMI,bb$BMI,cc$BMI,dd$BMI,ee$BMI),
  #BMI_BMINum = c(aa$res,bb$res,cc$res,dd$res,ee$res)
)
print(bmi.data)

#파이차트
x <- c(grade.data$grade_sum)
labels <- c(grade.data$grade_name)
pie(x,labels)
#바 차트
barplot(c(grade.data$grade_mean))
#히스토그램
hist(c(9,13,21,8,36,22,12,41,31,33,19),xlab = "Weight",col = "yellow",border = "blue")
#라인차트
plot(c(7,12,28,3,41),type = "o")
#산포도
input <- mtcars[,c('wt','mpg')]
print(input)
plot(x = input$wt,y = input$mpg,
     xlab = "Weight",
     ylab = "Milage",
     xlim = c(2.5,5),
     ylim = c(15,30),		 
     main = "Weight vs Milage"
)
#주식차트
input <- mtcars[,c('mpg','cyl')]
print(head(input))
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", main = "Mileage Data")

