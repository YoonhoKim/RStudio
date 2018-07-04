bmi <- function(height, weight){
  BMI <- (weight)/(height*height/10000)
if(BMI<18.5) res <- "저체중" else 
if(BMI<23) res <- "정상"else 
if(BMI<25) res <- "비만 전단계"else 
if(BMI<30) res <- "1단계 비만"else 
if(BMI<35) res <- "2단계 비만"else
res <- "3단계 비만"  
return (c(res,round(BMI)))  
}
bmi(167,67)