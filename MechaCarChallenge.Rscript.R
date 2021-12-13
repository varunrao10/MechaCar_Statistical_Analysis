#Read csv and create dataframes
mechaCarTable <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
suspensionCoilTable <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)


#deliverable 1
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechaCarTable) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechaCarTable)) #generate summary statistics

#deliverable 2
total_summary <- suspensionCoilTable %>% summarize(Mean=mean(PSI), Median= median(PSI), Variance = var(PSI, y=NULL), SD = sqrt(Variance),  .groups = 'keep')
lot_summary <- suspensionCoilTable %>% group_by(Manufacturing_Lot)  %>% summarize(Mean=mean(PSI), Median= median(PSI), Variance = var(PSI, y=NULL), SD = sqrt(Variance),  .groups = 'keep')

#deliverable 3
susCoil_lot_1 <- suspensionCoilTable %>% filter(Manufacturing_Lot=='Lot1')
susCoil_lot_2 <- suspensionCoilTable %>% filter(Manufacturing_Lot=='Lot2')
susCoil_lot_3 <- suspensionCoilTable %>% filter(Manufacturing_Lot=='Lot3')

t.test(susCoil_lot_1$PSI, mu=1500)
t.test(susCoil_lot_2$PSI, mu=1500)
t.test(susCoil_lot_3$PSI, mu=1500)


