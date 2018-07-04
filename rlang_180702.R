help("solve")
?solve
#java : int a = 3;
#system.out.println(a);
a <- "3"
a
b <- 4
b
c <- a + b
a <- c(1,2,3,4)
a
a <- c(1,"2",3,"4")
a
# int[] arr = new int[3];
# arr[0] = 1;
# arr[1] = 2;
# arr[2] = 3;
# arr <- c(1,2,3)
x <- c(1,2,3,4,5,6,7,8,9,10)
sum(x-mean(x)^2)/(length(x)-1)

?seq
x <- seq(length=100,from=1,by=1)
sum(x)

# °¡À§ : 0 ¹ÙÀ§ : 1 º¸ : 2
?sample
#
my <- 1
my
com <- 
  com 
if(my - com == 2 || my - com == -1) print ("Áü") else 
  if(my - com == -2 || my - com == 1) print ("ÀÌ±è") else 
    if(my - com == 0) print("ºñ±è")
my - com

# switch
com <- sample(0:2,1,replace = TRUE)
my <- 2
cat("ÄÄÇ»ÅÍ : ",com)
cat("ÇÃ·¹ÀÌ¾î : ",toString(com - my))
x <- switch(
  toString(com - my),
  '-2' = "ÀÌ±è",
  '1' = "ÀÌ±è",
  '2' = "Áü",
  '-1' = "Áü",
  '0' = "ºñ±è"
)
print(x)

# BMI switch
height <- 167
weight <- 67
BMI <- (weight)/(height*height/10000)
cat("BMI : ",BMI)
if(BMI<18.5) res <- "ÀúÃ¼Áß" else 
if(BMI<23) res <- "Á¤»ó"else 
if(BMI<25) res <- "ºñ¸¸ Àü´Ü°è"else 
if(BMI<30) res <- "1´Ü°è ºñ¸¸"else 
if(BMI<35) res <- "2´Ü°è ºñ¸¸"else
res <- "3´Ü°è ºñ¸¸"
print(BMI)
print(res)


#vector ë§Œë“¤ê¸?
print(c(1:10))
print(seq(from=1,to=10,by=2))
print(seq(from=1,length=10,by=2))
print(seq(1:5))
print(rep(1:5))
print(rep(1:5,each=2))
print(rep(1:5,times=2))
print(rep(1:5,each=2,times=3))
print(rep(1:5,times=3,each=2))
print(rep(1:5,times=3,each=2,len=5))
print(rep(1:5,each=2,times=3,len=5))
?
# ê¸°ë³¸??€?ž… : character, wide character, integer
# floating point : double, floating point, Boolean etc..
# R-Objects : vector, List, Matric, Array, Factor, Data Frame
# vector ?˜ 6ê°? ??€?ž…
# Logical(T,F), Numeric(?‹¤?ˆ˜), integer(? •?ˆ˜)
# Complex(?—ˆ?ˆ˜), Character(ë¬¸ìž?—´), Raw(ì£¼ì†Œê°?)

num1 <- c(3,3,5)
num2 <- c(2,3,4)
cat(num1, opcode, num2, "=",x <- switch(
  opcode,
  '+' = num1 + num2,
  '-' = num1 - num2,
  '*' = num1 * num2,
  '/' = num1 / num2,
  
))

v <- c(1:100)
for (i in v){
  if(i<=4) cat(i,'+ ') else 
    cat(i,'=',(sum(v))) 
}

cnt <- 1
su <- 1
repeat{
  cat(cnt,'+ ')
  cnt <- cnt+1
  su <- su + cnt
  if(cnt>=5){
    cat(cnt,'=',su)
    break
  } 
}   

total <- 0
for(i in 1:100){
  if(i<100){
    if(i %% 2 == 0){
      total <- total - i
      cat(i,'+ ')
    }
    else if(i %% 2 == 1){
      total <- total + i
      cat(i,'- ') 
    }
  }
  else if(i==100)
    cat(i,'=',total - i)
}
#1-2+3...-100=-50
for(i in 1:100){
  if(i == 100)
    cat(i,'=',sum(seq(1,99,2))-sum(seq(2,100,2))) 
  else if(i %% 2 == 0)
    cat(i,'+')
  else
    cat(i,'-')
}

#grade
name <- "ê¹€ê³„ë™"
kor <- 90
eng <- 80
math <- 70
score <- kor+eng+math
# cat(name,'|',score,'|',score/3,'|',(if(score/3<=100 && score/3 >= 90) 
#   'A' else if(score/3 >= 80)
#     'B' else if(score/3 >= 70)
#       'C' else if(score/3 >= 60)
#         'D' else if(score/3 >= 50)
#           'E' else 
#             'F'))
x <- switch(
  toString(round(score%/%30),0),
  '9' = 'A',
  '8' = 'B',
  '7' = 'C',
  '6' = 'D',
  '5' = 'E',
  'F'
)
cat(name,'|',score,'|',score/3,'|',x)


myGrade3 <- function(){
  subject <- c("êµ??–´", "?˜?–´", "?ˆ˜?•™")
  i <- 1
  print("?´ë¦„ì„ ?ž…? ¥?•˜?„¸?š”")
  name <- as.character(readline())
  for(s in subject){
    cat(s, "? ?ˆ˜ë¥? ?ž…? ¥?•˜?„¸?š”")
    score[i] <- as.integer(readline())
    i <- i+1
  }
  total <- sum(score)
  avg <- mean(total)
  ifelse(avg<=100 & avg>=90, grade <- "A",
         ifelse(avg<90 & avg>=80, grade <- "B", grade <- "C"))
  cat("?´ë¦?: ", name, "ì´ì : ", total, "?‰ê·?: ", avg, "?“±ê¸?: ", grade)
}
myGrade3()