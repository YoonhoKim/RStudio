#function으로 객체화 할것
#4가지가 반드시 있어야 function이 된다. R syntax
grade <- function(name,kor,eng,math){
  x <- c (kor,eng,math)

return (c(name,sum(x),mean(x)%/%1, switch(
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
res <- grade("김동",60,60,70)
cat(res)
cat(res[1],res[2],res[3],res[4])