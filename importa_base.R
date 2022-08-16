library(foreign)

lapop2004_2018 <- read.spss("bases/lapop2004_2008.sav", to.data.frame = T,
                            use.value.labels = F)

save(lapop2004_2018, file = "bases/lapop2004_2018.RData")
