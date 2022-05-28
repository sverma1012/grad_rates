knitr::opts_chunk$set(echo = TRUE)


library('readxl')

setwd('/Volumes/GoogleDrive-116166411084487006202/Shared drives/College Graduation Rates/Verma-493-Project')

carleton_sr = read_excel('Original Data/Importable Data/Carleton College/4-yrGraduationBySex&Race.xlsx', skip = 5)

head(carleton_sr)


carleton_p = read_excel('Original Data/Importable Data/Carleton College/graduationByPell.xlsx', range = cell_rows(10:15))

head(carleton_p)

coe_p = read_excel('Original Data/Importable Data/Coe College/CC_2010_20_graduationByPell.xlsx', range = cell_rows(8:12))

head(coe_p)

grinnell_sr = read_excel('Original Data/Importable Data/Grinnell College/GC_graduationRates.xlsx', range = cell_rows(1:41))

grinnell_sr

grinnell_p = read_excel('Original Data/Importable Data/Grinnell College/GC_graduationByPell.xlsx', range = cell_rows(10:13))

grinnell_p

lawrence_s = read_excel('Original Data/Importable Data/Lawrence University/LU_2003_14_graduationBySex.xlsx', range = 'B12:AP15')

lawrence_s

lawrence_r = read_excel('Original Data/Importable Data/Lawrence University/LU_2005_14_graduationByRace.xlsx', range = cell_rows(19:30))

lawrence_r

lawrence_p = read_excel('Original Data/Importable Data/Lawrence University/LU_2005_14_graduationByPell.xlsx', range = cell_rows(3:8))

lawrence_p

macalester_r = read_excel('Original Data/Importable Data/Macalester College/MC_2012_21_graduation.xlsx', range = cell_rows(85:101))

macalester_r

library(dplyr)

# Drop columns that have no data
  # Each alternative column is empty.

carleton_sr_2 = select(carleton_sr, -c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34))

carleton_sr_2


# Rename column names to depict proper years.

colnames(carleton_sr_2)

carleton_sr_2 = rename(carleton_sr_2, 'race' = 'Male', '2000' = '...3', '2001' = '...5', '2002' = '...7', '2003' = '...9', '2004' = '...11', '2005' = '...13', '2006' = '...15', '2007' = '...17', '2008' = '...19', '2009' = '...21', '2010' = '...23', '2011' = '...25', '2012' = '...27', '2013' = '...29', '2014' = '...31', '2015' = '...33', '2016' = '...35')

colnames(carleton_sr_2)

carleton_race = tibble(
  'race' = carleton_sr_2$race[23:31],
  '2000' = carleton_sr_2$'2000'[23:31],
  '2001' = carleton_sr_2$'2001'[23:31],
  '2002' = carleton_sr_2$'2002'[23:31],
  '2003' = carleton_sr_2$'2003'[23:31],
  '2004' = carleton_sr_2$'2004'[23:31],
  '2005' = carleton_sr_2$'2005'[23:31],
  '2006' = carleton_sr_2$'2006'[23:31],
  '2007' = carleton_sr_2$'2007'[23:31],
  '2008' = carleton_sr_2$'2008'[23:31],
  '2009' = carleton_sr_2$'2009'[23:31],
  '2010' = carleton_sr_2$'2010'[23:31],
  '2011' = carleton_sr_2$'2011'[23:31],
  '2012' = carleton_sr_2$'2012'[23:31],
  '2013' = carleton_sr_2$'2013'[23:31],
  '2014' = carleton_sr_2$'2014'[23:31],
  '2015' = carleton_sr_2$'2015'[23:31],
  '2016' = carleton_sr_2$'2016'[23:31]
)


carleton_sex = tibble(
  'sex' = c('male', 'female'),
  '2000' = carleton_sr_2$'2000'[c(10, 21)],
  '2001' = carleton_sr_2$'2001'[c(10, 21)],
  '2002' = carleton_sr_2$'2002'[c(10, 21)],
  '2003' = carleton_sr_2$'2003'[c(10, 21)],
  '2004' = carleton_sr_2$'2004'[c(10, 21)],
  '2005' = carleton_sr_2$'2005'[c(10, 21)],
  '2006' = carleton_sr_2$'2006'[c(10, 21)],
  '2007' = carleton_sr_2$'2007'[c(10, 21)],
  '2008' = carleton_sr_2$'2008'[c(10, 21)],
  '2009' = carleton_sr_2$'2009'[c(10, 21)],
  '2010' = carleton_sr_2$'2010'[c(10, 21)],
  '2011' = carleton_sr_2$'2011'[c(10, 21)],
  '2012' = carleton_sr_2$'2012'[c(10, 21)],
  '2013' = carleton_sr_2$'2013'[c(10, 21)],
  '2014' = carleton_sr_2$'2014'[c(10, 21)],
  '2015' = carleton_sr_2$'2015'[c(10, 21)],
  '2016' = carleton_sr_2$'2016'[c(10, 21)]
)


# Remote first row that contains only the years.
carleton_p_2 = carleton_p[-c(1, 5), ]

carleton_p_2

# Remove the columns that do not have graduation rates recorded
carleton_p_3 = select(carleton_p_2, -c(12, 13, 14, 15))



carleton_p_3 = carleton_p_3 %>%
  rename(
    'pell status' = 'Four Year Graduation Rate',
    '2005' = '...2',
    '2006' = '...3',
    '2007' = '...4',
    '2008' = '...5',
    '2009' = '...6',
    '2010' = '...7',
    '2011' = '...8',
    '2012' = '...9',
    '2013' = '...10',
    '2014' = '...11'
  )


carleton_pell = carleton_p_3

carleton_pell


# Delete unnescessary column

coe_p_2 = select(coe_p, -c(3))

coe_p_2

# Remove first row

coe_p_3 = coe_p_2[-c(1), ]

coe_p_3

# Rename columns for consistency

coe_p_3 = coe_p_3 %>%
  rename('pell status' = '...1')

colnames(coe_p_3)

coe_pell = coe_p_3

coe_pell

grinnell_race_1 = grinnell_sr[7:15, ]

colnames(grinnell_race_1)

# Rename the columns

grinnell_race_1 = grinnell_race_1 %>%
  rename('race' = 'Grinnell College - Four-Year Graduation Rates',
         '2007' = '...2',
         '2008' = '...3',
         '2009' = '...4',
         '2010' = '...5',
         '2011' = '...6',
         '2012' = '...7',
         '2013' = '...8',
         '2014' = '...9',
         '2015' = '...10',
         '2016' = '...11',
         '2017' = '...12'
         )

colnames(grinnell_race_1)

grinnell_race = grinnell_race_1

grinnell_sex_1 = grinnell_sr[c(28, 40), ]

grinnell_sex_1[1, 1] = 'male'
grinnell_sex_1[2, 1] = 'female'

grinnell_sex_1

# Rename columns

grinnell_sex = grinnell_sex_1 %>%
  rename('sex' = 'Grinnell College - Four-Year Graduation Rates',
         '2007' = '...2',
         '2008' = '...3',
         '2009' = '...4',
         '2010' = '...5',
         '2011' = '...6',
         '2012' = '...7',
         '2013' = '...8',
         '2014' = '...9',
         '2015' = '...10',
         '2016' = '...11',
         '2017' = '...12'
         )

colnames(grinnell_sex)

grinnell_p_2 = grinnell_p %>%
  rename('pell status' = '...1')

colnames(grinnell_p_2)

grinnell_p_2[1]

grinnell_p_2$`pell status`[2] = 'Received Subsidized Stafford Loan, No Pell Grant'

grinnell_p_2$`pell status`[3] = 'Received Neither Pell Grant nor Stafford Loan  '

grinnell_p_2$`pell status`

grinnell_pell = grinnell_p_2

grinnell_pell

# Remove first row that only has missing values

lawrence_r_2 = lawrence_r[-c(1), ]

lawrence_r_2

# Delete columns that have no values

colnames(lawrence_r_2)

lawrence_r_3 = lawrence_r_2 %>%
  select(-c('...2', '...4', '...6', '...8', '...10', '...12', '...14'))

colnames(lawrence_r_3)

# Rename first column

lawrence_r_3 = lawrence_r_3 %>%
  rename('race' = '...1')

# Delete last column

lawrence_race = lawrence_r_3[-c(10), ]

lawrence_race

#install.packages('naniar')
#Run this code only once

library(naniar)

lawrence_race = lawrence_race %>%
  replace_with_na(replace = list('2005' = c('n/a'),
                                 '2006' = c('n/a'),
                                 '2007' = c('n/a'),
                                 '2008' = c('n/a'),
                                 '2009' = c('n/a'),
                                 '2010' = c('n/a'),
                                 '2011' = c('n/a'),
                                 '2012' = c('n/a'),
                                 '2013' = c('n/a'),
                                 '2014' = c('n/a')))

# Delete columns

lawrence_s_2 = lawrence_s %>%
  select(-c(1, 3:11, 13:14, 16:17, 19:20, 22:24, 26:28, 30:31, 33, 35:36, 40))

lawrence_s_2

# Delete last row

lawrence_s_3 = lawrence_s_2[-c(3), ]

# Rename columns

lawrence_sex = lawrence_s_3 %>%
  rename('sex' = 'Four-Year Graduation Rate',
         '2003' = '...12',
         '2004' = '...15',
         '2005' = '...18',
         '2006' = '...21',
         '2007' = '...25',
         '2008' = '...29',
         '2009' = '...32',
         '2010' = '...34',
         '2011' = '...37',
         '2012' = '...38',
         '2013' = '...39',
         '2014' = '...41'
         )

colnames(lawrence_sex)

colnames(lawrence_p)

# Delete unnecessary columns

lawrence_p_2 = lawrence_p %>%
  select(-c(2, 3, 4, 5, 6, 8, 9, 11, 13, 15, 16, 17, 19, 21))

lawrence_p_2

# Delete first row

lawrence_p_3 = lawrence_p_2[-c(1, 5), ]

lawrence_p_3

# Rename first column name

lawrence_pell = lawrence_p_3 %>%
  rename('pell status' = '...1')

colnames(lawrence_pell)

# Delete unnecessary rows

macalester_r_2 = macalester_r[-c(1:10), ]

macalester_r_2

# Delete empty columns

macalester_r_3 = macalester_r_2 %>%
  select(-c(2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20, 22, 23, 24, 26, 27, 29, 30, 32, 33, 34))

macalester_r_3

# Rename columns

macalester_r_4 = macalester_r_3 %>%
  rename('race' = '...1',
         '2008' = 'Fall 2008\r\nCohort',
         '2009' = 'Fall 2009\r\nCohort',
         '2010' = 'Fall 2010\r\nCohort',
         '2011' = 'Fall 2011\r\nCohort',
         '2012' = 'Fall 2012\r\nCohort',
         '2013' = 'Fall 2013\r\nCohort',
         '2014' = 'Fall 2014\r\nCohort',
         '2015' = 'Fall 2015\r\nCohort',
         '2016' = 'Fall 2016\r\nCohort',
         '2017' = 'Fall 2017\r\nCohort'
         )

macalester_r_4


macalester_r_4[macalester_r_4 == '**'] = NA
macalester_r_4[macalester_r_4 == '*'] = NA

macalester_r_4

macalester_race = macalester_r_4

macalester_race

carleton_race$race

# "Hispanic or Latino"                  
# "American Indian or Alaska Native"    
# "Asian"                               
# "Black or African‐American"           
# "Native Hawaiian or Pacific Islander*"
# "Two or more races"                   
# "Nonresident Alien"                   
# "White, non‐Hispanic"                 
# "Race and Ethnicity unknown"


grinnell_race$race

# "Nonresident aliens"                                     
# "Hispanic/Latino"                                        
# "Black or African American, non\r\nHispanic"             
# "White, non-Hispanic"                                    
# "American Indian or Alaska\r\nNative, non-Hispanic"      
# "Asian, non-Hispanic"                                    
# "Native Hawaiian or other Pacific Islander, non-Hispanic"
# "Two or more races, non-\r\nHispanic"                    
# "Race and/or ethnicity\r\nunknown"

lawrence_race$race

# [1] "Non-resident alien"                    
# [2] "Unknown"                               
# [3] "Hispanic of any race"                  
# [4] "American Indian/Alaska Native"         
# [5] "Asian"                                 
# [6] "Black/African American"                
# [7] "Native Hawaiian/Other Pacific Islander"
# [8] "White"                                 
# [9] "Two or More Races" 

macalester_race$race

# [1] "Asian"             "Black"             "Hispanic"         
# [4] "Native American"   "Pacific Islander"  "Two or more races"

# Delete other categories of race not listed above.

carleton_race$race

carleton_race = carleton_race[-c(2, 9), ]


# Rename the categories for consistency.

carleton_race$race[1] = 'Hispanic/Latino'
carleton_race$race[3] = 'Black/African American'
carleton_race$race[4] = 'Native Hawaiian/Pacific Islander'
carleton_race$race[6] = 'Non-resident Alien'
carleton_race$race[7] = 'White'

carleton_race$race

grinnell_race$race

grinnell_race = grinnell_race[-c(5, 9), ]

grinnell_race$race

# Rename the categories for consistency.

grinnell_race$race[1] = 'Non-resident Alien'
grinnell_race$race[3] = 'Black/African American'
grinnell_race$race[4] = 'White'
grinnell_race$race[5] = 'Asian'
grinnell_race$race[6] = 'Native Hawaiian/Pacific Islander'
grinnell_race$race[7] = 'Two or more races'

grinnell_race$race

lawrence_race$race

lawrence_race = lawrence_race[-c(2, 4), ]

lawrence_race$race

lawrence_race$race[1] = 'Non-resident Alien'
lawrence_race$race[2] = 'Hispanic/Latino'
lawrence_race$race[5] = 'Native Hawaiian/Pacific Islander'
lawrence_race$race[7] = 'Two or more races'

lawrence_race$race

macalester_race$race

macalester_race = macalester_race[-c(4), ]
macalester_race$race

macalester_race$race[2] = 'Black/African American'
macalester_race$race[3] = 'Hispanic/Latino'
macalester_race$race[4] = 'Native Hawaiian/Pacific Islander'

macalester_race$race

# Add a column for college name to each dataset before appending.

carleton_race$college = c('carleton college')
carleton_race = select(carleton_race, college, everything())
carleton_race

grinnell_race$college = c('grinnell college')
grinnell_race = select(grinnell_race, college, everything())
grinnell_race

lawrence_race$college = c('lawrence university')
lawrence_race = select(lawrence_race, college, everything())
lawrence_race

macalester_race$college = c('macalester college')
macalester_race = select(macalester_race, college, everything())
macalester_race

str(carleton_race) # all columns are numeric
str(grinnell_race) # all columns are numeric

str(lawrence_race) # all columns are NOT numeric
lawrence_race$'2006' = as.double(lawrence_race$'2006')
lawrence_race$'2010' = as.double(lawrence_race$'2010')
lawrence_race$'2011' = as.double(lawrence_race$'2011')
lawrence_race$'2012' = as.double(lawrence_race$'2012')
lawrence_race$'2014' = as.double(lawrence_race$'2014')
str(lawrence_race)

str(macalester_race)

macalester_race$'2008' = as.double(macalester_race$'2008')
macalester_race$'2009' = as.double(macalester_race$'2009')
macalester_race$'2010' = as.double(macalester_race$'2010')
macalester_race$'2011' = as.double(macalester_race$'2011')
macalester_race$'2012' = as.double(macalester_race$'2012')
macalester_race$'2013' = as.double(macalester_race$'2013')
macalester_race$'2014' = as.double(macalester_race$'2014')
macalester_race$'2015' = as.double(macalester_race$'2015')
macalester_race$'2016' = as.double(macalester_race$'2016')
macalester_race$'2017' = as.double(macalester_race$'2017')

str(macalester_race)

# First, remove all NA values

macalester_race[is.na(macalester_race)] = 0

macalester_race[,3:ncol(macalester_race)] = macalester_race[,3:ncol(macalester_race)]/100

# Now convert all values of zero back to values of NA

macalester_race[macalester_race == 0] = NA

macalester_race

race = bind_rows(carleton_race, grinnell_race, lawrence_race, macalester_race)

race

library(tidyr)

race_2 = pivot_longer(race, '2000':'2017', names_to = 'year', values_to = 'grad_rate')

race_2$year = as.numeric(race_2$year)

str(race_2$year)

carleton_sex

grinnell_sex

lawrence_sex

lawrence_sex$sex[1] = 'female'
lawrence_sex$sex[2] = 'male'

lawrence_sex$sex

carleton_sex$college = c('carleton college')
carleton_sex = select(carleton_sex, college, everything())
carleton_sex

grinnell_sex$college = c('grinnell college')
grinnell_sex = select(grinnell_sex, college, everything())
grinnell_sex

lawrence_sex$college = c('lawrence university')
lawrence_sex = select(lawrence_sex, college, everything())
lawrence_sex

sex = bind_rows(carleton_sex, grinnell_sex, lawrence_sex)

sex

sex_2 = pivot_longer(sex, '2000':'2017', names_to = 'year', values_to = 'grad_rate')

sex_2

sex_2$year = as.numeric(sex_2$year)

str(sex_2)

carleton_pell$`pell status`
grinnell_pell$`pell status`
coe_pell$`pell status`
lawrence_pell$`pell status`

coe_pell$`pell status`[3] = "Received Neither Pell Grant nor Stafford Loan"

coe_pell$`pell status`[3]

grinnell_pell$`pell status`[3] = "Received Neither Pell Grant nor Stafford Loan"

grinnell_pell$`pell status`[3]

carleton_pell$`pell status`[3] = "Received Neither Pell Grant nor Stafford Loan" 

carleton_pell$`pell status`[3]

lawrence_pell$`pell status`[3] = "Received Neither Pell Grant nor Stafford Loan" 

lawrence_pell$`pell status`[3]

carleton_pell$college = c('carleton college')
carleton_pell = select(carleton_pell, college, everything())
carleton_pell

grinnell_pell$college = c('grinnell college')
grinnell_pell = select(grinnell_pell, college, everything())
grinnell_pell

lawrence_pell$college = c('lawrence university')
lawrence_pell = select(lawrence_pell, college, everything())
lawrence_pell

coe_pell$college = c('coe college')
coe_pell = select(coe_pell, college, everything())
coe_pell

# First, remove all NA values

coe_pell[is.na(coe_pell)] = 0

coe_pell[,3:ncol(coe_pell)] = coe_pell[,3:ncol(coe_pell)]/100

# Now convert all values of zero back to values of NA

coe_pell[coe_pell == 0] = NA

coe_pell

pell = bind_rows(carleton_pell, grinnell_pell, coe_pell, lawrence_pell)

pell

pell_2 = pivot_longer(pell, '2005':'2017', names_to = 'year', values_to = 'grad_rate')

pell_2

pell_2$year = as.numeric(pell_2$year)

str(pell_2)

colnames(pell_2)[2] = 'pell_status'

colnames(pell_2)

# install.packages("writexl")
library("writexl")

# Race
write_xlsx(race_2, 'Analysis Data/race.xlsx')

# Sex
write_xlsx(sex_2, 'Analysis Data/sex.xlsx')

# Pell Grant
write_xlsx(pell_2, 'Analysis Data/pell.xlsx')
