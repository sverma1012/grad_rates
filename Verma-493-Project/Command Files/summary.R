knitr::opts_chunk$set(echo = TRUE)

setwd('/Volumes/GoogleDrive-116166411084487006202/Shared drives/College Graduation Rates/Verma-493-Project')

library(readxl)

race = read_excel('Analysis Data/race.xlsx')

# Use this code if the aboce line of code does not work
#race = read_excel('/Volumes/GoogleDrive-116166411084487006202/Shared drives/College Graduation Rates/Verma-493-Project/Analysis Data/race.xlsx')


head(race)

# To verify, let us check the shape of the imported dataset.

dim(race)


factor(race$college)

table(race$college)

#install.packages('plyr')
# Please run the above code if this is the first time running the script.

library(plyr)

count(race ,'college')

library(ggplot2)

college_r = table(race$college)

barplot(college_r, main='Distribution of Colleges (Race)', xlab = 'College Name', ylab = 'Frequency')

factor(race$race)

table(race$race)

count(race, 'race')

race_r = table(race$race)


barplot(race_r, main='Distribution of Race (Race)', xlab = 'Race', ylab = 'Frequency', cex.names = 0.5)

factor(race$year)

summary(race$year)

sd(race$year)

hist(race$year,xlab = "Year", breaks = 5, labels = TRUE, main = "Histogram of Year", ylim = c(0,180))

summary(race$grad_rate)

race_2 = race
race_2[is.na(race_2)] = 0

sd(race_2$grad_rate)

aggregate(race_2$grad_rate, by=list(race_2$race), FUN = mean)

hist(race$grad_rate,xlab = "Graduation Rate", labels = TRUE, main = "Histogram of Graduation Rates", ylim = c(0, 105))


sex = read_excel('Analysis Data/sex.xlsx')

# Use this code if the above line of code does not work
#sex = read_excel('/Volumes/GoogleDrive-116166411084487006202/Shared drives/College Graduation Rates/Verma-493-Project/Analysis Data/sex.xlsx')

head(sex)

# To verify, let us check the shape of the imported dataset.

dim(sex)

factor(sex$college)

table(sex$college)

#install.packages('plyr')
library(plyr)

count(sex, 'college')

library(ggplot2)

college_s = table(sex$college)

barplot(college_s, main='Distribution of Colleges (Sex)', xlab = 'College Name', ylab = 'Frequency')

factor(sex$sex)

table(sex$sex)

count(sex, 'sex')

sex_s = table(sex$sex)

barplot(sex_s, main='Distribution of Sex (Sex)', xlab = 'Sex', ylab = 'Frequency')

factor(sex$year)

summary(sex$year)

sd(sex$year)

hist(sex$year,xlab = "Year", breaks = 5, labels = TRUE, main = "Histogram of Year")

summary(sex$grad_rate)

sex_2 = sex
sex_2[is.na(sex_2)] = 0

sd(sex_2$grad_rate)

aggregate(sex_2$grad_rate, by=list(sex_2$sex), FUN = mean)

aggregate(sex_2$grad_rate, by=list(sex_2$college), FUN = mean)

hist(sex$grad_rate,xlab = "Graduation Rate", labels = TRUE, main = "Histogram of Graduation Rates", ylim = c(0, 30))


pell = read_excel('Analysis Data/pell.xlsx')

# Use this code if the line of code above does not work.
#pell = read_excel('/Volumes/GoogleDrive-116166411084487006202/Shared drives/College Graduation Rates/Replication Documentation/Importable Data/pell.xlsx')

head(pell)

# To verify, let us check the shape of the imported dataset.

dim(pell)

factor(pell$college)

table(pell$college)

#install.packages('plyr')
library(plyr)

count(pell, 'college')

library(ggplot2)

college_p = table(pell$college)

barplot(college_p, main='Distribution of Colleges (Pell)', xlab = 'College Name', ylab = 'Frequency', cex.names = 0.7)

factor(pell$pell_status)

table(pell$pell_status)

count(pell, 'pell_status')

pell_p = table(pell$pell_status)

barplot(pell_p, main='Distribution of Pell Status (Pell)', xlab = 'Pell Status', ylab = 'Frequency', cex.names = 0.5)

factor(pell$year)

summary(pell$year)

sd(pell$year)

hist(pell$year,xlab = "Year", breaks = 5, ylim = c(0,25), labels=TRUE, main = "Histogram of Year")

summary(pell$grad_rate)

pell_2 = pell
pell_2[is.na(pell_2)] = 0

sd(pell_2$grad_rate)

aggregate(pell_2$grad_rate, by=list(pell_2$pell_status), FUN = mean)

aggregate(pell_2$grad_rate, by=list(pell_2$college), FUN = mean)

hist(pell$grad_rate,xlab = "Graduation Rate", labels = TRUE, main = "Histogram of Graduation Rates", ylim = c(0, 25))
