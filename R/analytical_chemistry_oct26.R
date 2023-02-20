
Ca <- matrix(c(0.00, 2.00, 5.00, 8.00, 10.00, 0.000, 0.063, 0.141, 0.218, 0.265),ncol = 2)
colnames(Ca) <- c('ppmCa2','Absorbance')
Ca <- data.frame(Ca)

ggplot(data = Ca, aes(Absorbance,ppmCa2)) + geom_point() + stat_smooth(method = lm)

# new sample abs = 0.101
m <- lm(data = Ca, ppmCa2 ~ Absorbance)
summary(m)
predict(m,newdata = data.frame(Absorbance = 0.101),
        interval = 'prediction')

ggplot(data = Ca, aes(ppmCa2,Absorbance)) +
  geom_point() + stat_smooth(method = lm) +
  geom_hline(yintercept = 0.101)

m2 <- lm(data = Ca, Absorbance~ppmCa2)
nwCa <- data.frame(ppmCa2 = seq(0,10,0.01))
prd <- predict(m2, newdata = nwCa, interval = 'prediction')
nwCa <- data.frame(nwCa,prd)

nwCa$fit
nwCa[363,]

which(nwCa$fit==0.101) # virker ikke, der er ikke en som ere præcis 0.101
# metode 1
sl <- 0.001
which(nwCa$fit > (0.101-sl) & nwCa$fit < (0.101+sl))
# metode 2
id <- which.min(abs(nwCa$fit - 0.101))
nwCa$ppmCa2[id]
id <- which.min(abs(nwCa$upr - 0.101))
nwCa$ppmCa2[id]
nwCa$ppmCa2[which.min(abs(nwCa$lwr - 0.101))]


X_SA <- data.frame(conc = c(0.0, 0.8, 1.5, 2.2, 3.0),
           signal = c(2.2, 3.3, 4.0, 4.8, 6.0))

ggplot(data = X_SA, aes(conc, signal)) + geom_point() +
  stat_smooth(method = lm,fullrange=TRUE) + ylim(c(-2,6)) +
  xlim(c(-4,3)) + geom_hline(yintercept = 0)

m3 <- lm(data = X_SA, signal~conc)
nwSA <- data.frame(conc = seq(-3,0, 0.001))
prd <- predict(m3,newdata = nwSA, interval = 'confidence')
nwSA <- data.frame(nwSA,prd)
nwSA[which.min(abs(nwSA$fit)),]
nwSA[which.min(abs(nwSA$lwr)),]
nwSA[which.min(abs(nwSA$upr)),]
