knitr::opts_chunk$set(echo = TRUE)

setwd('/Volumes/GoogleDrive-116166411084487006202/Shared drives/College Graduation Rates/Verma-493-Project')


library(readxl)

race = read_excel('Analysis Data/race.xlsx')

# Use this code if the line above does not work

# race = read_excel('/Volumes/GoogleDrive-116166411084487006202/Shared drives/College Graduation Rates/Replication Documentation/Analysis Data/race.xlsx')

head(race)

sex = ('Analysis Data/sex.xlsx')

# Use this code if the line of code above does not work.
# sex = read_excel('/Volumes/GoogleDrive-116166411084487006202/Shared drives/College Graduation Rates/Replication Documentation/Analysis Data/sex.xlsx')

head(sex)

pell = read_excel('Analysis Data/pell.xlsx')

# Use this line of code if the line above does not work.
# pell = read_excel('/Volumes/GoogleDrive-116166411084487006202/Shared drives/College Graduation Rates/Replication Documentation/Importable Data/Final/pell.xlsx')

head(pell)

library(tidyverse)

# First model without year

race_model = lm(grad_rate ~ race + college, data = race)

race_model

summary(race_model)

# Second model with year

race_model_2 = lm(grad_rate ~ race + year + college, data = race)

race_model_2

summary(race_model_2)

# First model without year

sex_model = lm(grad_rate ~ sex + college, data = sex)

sex_model

summary(sex_model)

# Second model with year

sex_model_2 = lm(grad_rate ~ sex + year + college, data = sex)

sex_model_2

summary(sex_model_2)

# First model without year

pell_model = lm(grad_rate ~ pell_status + college, data = pell)

pell_model

summary(pell_model)

# Second model with year

pell_model_2 = lm(grad_rate ~ pell_status + college + year, data = pell)

pell_model_2
summary(pell_model_2)
