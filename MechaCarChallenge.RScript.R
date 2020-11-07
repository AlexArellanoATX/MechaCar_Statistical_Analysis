# Import Libraries
library(tidyverse)


# Read in mpg data
data_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Mulitple Regression mpg vs. 5 other vehicle data columns
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=data_table) 

#Summary statistics for mult regression
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=data_table)) 

#Read in suspension coil data
suspCoil_table <- read.csv(file='Suspension_Coil.csv',check.names = F,stringsAsFactors = F)

#Summary stats for all suspension coil data
total_summary <- suspCoil_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI)) 

#Summary stats for suspension coil data by Lot
lot_summary <- suspCoil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# Suspension Coil t-tests
t.test(suspCoil_table$PSI, mu=1500)

lot1 <- suspCoil_table %>% filter(Manufacturing_Lot=='Lot1')
lot2 <- suspCoil_table %>% filter(Manufacturing_Lot=='Lot2')
lot3 <- suspCoil_table %>% filter(Manufacturing_Lot=='Lot3')

t.test(lot1$PSI, lot2$PSI, paired = T)
t.test(lot2$PSI, lot3$PSI, paired = T)
t.test(lot1$PSI, lot3$PSI, paired = T)

