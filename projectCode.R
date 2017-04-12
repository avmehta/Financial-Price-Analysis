library(readr)
TY <- read_csv("~/Applied Econophysics/project/TY-5min.csv")
TU <- read_csv("~/Applied Econophysics/project/TU-5min.csv")

TY$ID<-seq.int(nrow(TY))
myvars <- c("ID", "Close")
data <- TY[myvars]
y <- data$Close
yu <- TU$Close



vr <- c()
vru <- c()

lag1 <- diff(y)
var1 <- var(lag1)

lag1u <- diff(yu)
var1u <- var(lag1u)


ptm <- proc.time()
for (i in 1:10000){
  temp <- diff(y,i)
  vari <- var(temp) / (i*var1)
  vr[i] <- vari
  tempu <- diff(yu,i)
  varui <- var(tempu) / (i * var1u)
  vru[i] <- varui
}

print(proc.time() - ptm)

plot(vr, type='l')
plot(vru,type='l')
