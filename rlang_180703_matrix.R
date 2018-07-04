rownames <- (row 1:row 5)
colnames <- (col 1:col 5)
print(matrix(c(1:25),nrow = 5, ncol = 5, byrow = TRUE))

print(matrix(c(1:25), nrow = 5, ncol = 5))

#rbind
mat <- matrix(1:10, ncol = 2)
rbind(mat[1:4, ], c(6, 11), mat[5, ])


#triangle
mat<-matrix(nrow=0,ncol=5)
mat<-rbind(mtx,c(1,0,0,0,0))
mat<-rbind(mtx,c(2,3,0,0,0))
mat<-rbind(mtx,c(4,5,6,0,0))
mat<-rbind(mtx,c(7,8,9,10,0))
mat<-rbind(mtx,c(11,12,13,14,15))
mat

print(c(1:15)) 
mtx<-matrix(nrow=5,ncol=5,byrow=TRUE)
count<-0
for(i in 1:5){
  for(j in 1:i){
    mtx[i,j]<-count<-count+1
  }
}
mtx







#zigzag

matrix(c(1:5),nrow = )

#diamond
a <- matrix(c(1:5),nrow=1,ncol=5,byrow=TRUE)

#sandgrass

#append
x <- c(1,2)
cat(x)
x <- append(x,3)
cat(x)

#
n <- 1
for(i in 1:8)
{
  n <- n*2
}
cat(n)

#
x = c()
x[1] = 1
cat(x)
for(i in 2:5){
  x[i] = i
}
cat(x)

#
x = cat(1,2,3,4,5,"\n")
y = cat(10,9,8,7,6)
append(x,y)

