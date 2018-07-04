install.packages("ggplot2")
library(ggplot2)
read.csv(file = "C:\\Users\\1027\\RWorkSpace\\yoonhokim\\2013년_전년대비_시간대별_교통사고_사망자_현황.csv")
read.csv(file = "C:\\Users\\1027\\RWorkSpace\\yoonhokim\\47_2015년_도로교통사고_통계_종합.csv")
##sample
x <- c("2","2","3","1","4","4","4","4")
x
qplot(x)
rm(x)
# manufacturer
# model
# model name
# displ
# engine displacement, in litres
# year
# year of manufacture
# cyl
# number of cylinders
# trans
# type of transmission
# drv
# f = front-wheel drive, r = rear wheel drive, 4 = 4wd
# cty
# city miles per gallon
# hwy
# highway miles per gallon
# fl
# fuel type
# class
# "type" of car





###### mpg 데이터 파악하기
## 내가 모르는 빅데이터를 분석하는 방법

# data = mpg, x축에 변수 지정해 그래프 생성
qplot(data = mpg, x = hwy)
# x 축 cty
qplot(data = mpg, x = cty)

# mpg 데이터를 데이터 프레임으로 만든다
mpg <- as.data.frame(ggplot2::mpg)
head(mpg) ## 상위6개
tail(mpg) ## 하위6개
dim(mpg) ## 234 행    11  열  구조이다.
str(mpg) ## 타입, 데이터 나열
summary(mpg) ## table 요약정보
mpg$total <- (mpg$cty + mpg$hwy) / 2 #통합 연비 변수 설정
head(mpg)
## 통합연비 변수 평균
mean(mpg$total)
summary(mpg$total)
hist(mpg$total)
# total 연비의 평균과 중앙값이 약 20이다.
# total 연비가 20 ~ 25 사이에 해당하는
# 자동차 모델이 가장 많다.
# 대부분 25이하이고, 25를 넘기는 자동차는
# 많지 않다.
## 합격 판정 변수 만들기
## total 이 20 이상이면 pass, 미만이면 fail을 
# 부여하는 test 라는 변수를 생성합니다.
mpg$test <- ifelse(mpg$total >= 20, "pass","fail")
head(mpg,20)
# 합격판정을 받은 자동차 수 살펴보자
table(mpg$test)
qplot(mpg$test)
# 중첩조건문
# total 30 이상이면 A
# total 20 ~ 29 면 B
# total 20 미만이면 C
mpg$grade <- ifelse(
  mpg$total >= 30 ,"A",
  ifelse(mpg$total >= 20, "B",
         ifelse(mpg$total >= 10,"C","D"))
)
head(mpg,20)
table(mpg$grade)
qplot(mpg$grade)
# 변수명 변경
# mpg <- rename(mpg,company <- manufacture)
## 데이터베이스 값은 함부로 바꿀 수 없다.
## 그러나 ...