sequenc <- function(){
  for(i in 1:100){
    if(i == 100)
      res<-cat(i,'=',sum(seq(1,99,2))-sum(seq(2,100,2))) 
    else if(i %% 2 == 0)
      res<-cat(i,'+')
    else
      res<-cat(i,'-')
  }  
  return (res)
}
sequenc()