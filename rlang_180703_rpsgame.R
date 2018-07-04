rpsgame <- function(my){
  com <- sample(0:2,1,replace = TRUE)
  return (cat("컴퓨터 : ",com," 플레이어 : ",my," 결과 : ", switch(
    toString(com - my),
    '-2' = "이김",
    '1' = "이김",
    '2' = "짐",
    '-1' = "짐",
    '0' = "비김"
  )))
}
rpsgame(2)