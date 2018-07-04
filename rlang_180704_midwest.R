# ggplot2 패키지에는 미국 동북중부 437개 지역의
# 인구통계 정보를 담은 midwest 라는 데이터가
# 들어 있습니다.
# midwest 데이터를 사용해 데이터 분석 문제를 해결하시오.
# 1. poptotal 변수를 total 로, popasian 변수를
# asian 으로 수정하세요
# 2. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율'
# 파생변수를 만들고, 히스토그램을 만들어 도시들이
# 어떻게 분포하는지 살펴보세요.
# 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하고
# 'large', 그 외에는 'small' 을 부여하는 파생변수를 만드시오.
# 'large' 와 'small' 에 해당하는 지역이 얼마나 되는지
# 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.

install.packages("ggplot2")
library(ggplot2)
read.csv(file =)
x <- c(midwest)
x
rm(x)
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

qplot(data = midwest,x = poptotal)
table(midwest$poptotal)
head(midwest)
tail(midwest)
dim(midwest)
str(midwest)

# 1. poptotal 변수를 total 로, popasian 변수를
# asian 으로 수정하세요
midwest$total <- midwest$poptotal
midwest$asian <- midwest$popasian
str(midwest)
# 2. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율'
# 파생변수를 만들고, 히스토그램을 만들어 도시들이
# 어떻게 분포하는지 살펴보세요.
midwest$percasia <- round((midwest$asian/midwest$total)*100,2)
hist(midwest$percasia)
# 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하고
# 'large', 그 외에는 'small' 을 부여하는 파생변수를 만드시오.
# 'large' 와 'small' 에 해당하는 지역이 얼마나 되는지
# 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.
midwest$perasiamean <- ifelse(mean(midwest$percasia)<midwest$percasia,"large","small")
qplot(data = midwest, x = perasiamean)
