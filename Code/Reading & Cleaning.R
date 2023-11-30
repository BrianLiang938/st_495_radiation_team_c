library(tidyverse)
library(readxl)
library(dplyr)
rm(list = ls())

# If someone needs this - make sure to change the command below so you can access the data!
# This is what I have it as on my machine.
setwd("~/Documents/ST 495/FinalProject/st_495_radiation_team_c/Raw Data")

#ACC-Pat_Users-New.xlsx
users <- read_csv("ACC-Pat_Users-New.xlsx - Pat_Users.csv")
users <- users[-c(22,23,24),]

#ACC-Pat_Category_Codes-New.xlsx
catCodes <- read_csv("ACC-Pat_Category_Codes-New.xlsx - Pat_Category_Codes.csv")
catCodes <- catCodes[-c(3135,3136,3137),]

#ACC-Patient_Master-Chart ID DELETED-New.xlsx
patientMasterChart <- 
  read_csv("ACC-Patient_Master-Chart ID DELETED-New.xlsx - Patient_Master.csv")
patientMasterChart <- patientMasterChart[-c(569,568,567),]

#ACC-Pat_Tasks-Chart ID DELETED-New.xlsx
patTasks <-
  read_csv("ACC-Pat_Tasks-Chart ID DELETED-New.xlsx - Pat_Tasks.csv")
patTasks <- patTasks[-c(161,162,163),]

#ACC-Pat_Roles-New.xlsx
patRoles <-
  read_csv("ACC-Pat_Roles-New.xlsx - Pat_Roles.csv")
patRoles <- patRoles[-c(14,15,16),]

#ACC-Pat_Error_Lookup-New.xlsx
errorLookup <-
  read_csv("ACC-Pat_Error_Lookup-New.xlsx - Pat_Error_Lookup.csv")
errorLookup <- errorLookup[-c(1308,1309,1310),]

#ACC-Pat_Dailyportions-New.xlsx
DailyPortions <-
  read_csv("ACC-Pat_Dailyportions-New.xlsx - Pat_Dailyportions.csv")
DailyPortions <- DailyPortions[-c(35,34,33),]

#ACC-Pat_Corrective_Node-New.xlsx
correctiveNode <-
  read_csv("ACC-Pat_Corrective_Node-New.xlsx - Pat_Correctice_Node.csv")
correctiveNode <- correctiveNode[-c(3243,3242,3241),]

#ACC-Pat_Corrections-New.xlsx
corrections <-
  read_csv("ACC-Pat_Corrections-New.xlsx - Pat_Corrections.csv")
corrections <- corrections[-c(479,478,477),]

#ACC-Pat_Approvals-New.xlsx
patApprovals <-
  read_csv("ACC-Pat_Approvals-New.xlsx - Pat_Approvals.csv")
patApprovals <- patApprovals[-c(157,156,155),]

#Acc-Error_Master-Chart ID DELETED-New.xlsx
#errorMasterChart <-
#  read_csv("ACC-Error_Master-Chart ID DELETED-New.xlsx - Error_Master.csv")
#errorMasterChart <- errorMasterChart[-c(127,126,125),]

#Acc-Error_Master-Chart ID DELETED-New.xlsx
#errorMasterChart <-
#  read_excel("/Users/david/Desktop/Raw_Data/ACC - New/ACC-Error_Master-Chart ID DELETED-New.xlsx")

errorMasterChart <-
  read_excel("ACC-Error_Master-Chart ID DELETED-New.xlsx")
errorMasterChart <- errorMasterChart %>%
  filter((str_detect(DEVID, "\\d"))) %>%
  separate(ERROR_CODE, into=c('start', 'CATEGORY1_ID', 'CATEGORY2_ID', 'ATTRIBUTE_ID'), sep = '-', remove = F)
errorMasterChart <- errorMasterChart[-c(21,27,29,31,33,67,85,86,94,96),]
errorMasterChart <- errorMasterChart[-c(84),]
errorMasterChart$DEVID <- as.character(as.numeric(errorMasterChart$DEVID))

catcodes1 <- catCodes %>%
  filter(CATLEVEL == 1) %>%
  rename(CATEGORY1_ID = ID, CAT1_DESCRIPTION = DESCRIPTION)

catcodes2 <- catCodes %>%
  filter(CATLEVEL == 2) %>%
  rename(CATEGORY2_ID = ID, CAT2_DESCRIPTION = DESCRIPTION)

catcodes3 <- catCodes %>%
  filter(CATLEVEL == 3) %>%
  rename(ATTRIBUTE_ID = ID, ATR_DESCRIPTION = DESCRIPTION)

errorLookup1 <- errorLookup %>%
  mutate(ERROR_CODE = ID) %>%
  select(ID, ERROR_CODE)

draft <- merge(errorMasterChart, errorLookup1, by = "ERROR_CODE")
draft1 <- merge(draft, catcodes1, by = "CATEGORY1_ID")
draft2 <- merge(draft1, catcodes2, by = "CATEGORY2_ID")
final <- merge(draft2, catcodes3, by = "ATTRIBUTE_ID")

corrections <- corrections %>% 
  rename(DEVID = DEVIATION_ID)

correctiveNode <- correctiveNode %>% 
  rename(ACTION_ID = ID)


correctionRelated <- merge(corrections, correctiveNode, by = "ACTION_ID",
                           suffixes = c("_Custom", "_Formal"))

finalWithCorrections <- merge(final, correctionRelated, by = "DEVID", all.x = TRUE)

finalWithCorrections1 <- finalWithCorrections %>% 
  select(-c(12, 14:16, 23:26, 6:8)) %>% 
  rename(Category_Desc = CAT1_DESCRIPTION, Subcat_Desc = CAT2_DESCRIPTION,
         Attribute_Desc = ATR_DESCRIPTION, CATLEVEL = CATLEVEL.x,
         SUBLEVEL = CATLEVEL.y, ATTLEVEL = CATLEVEL, 
         Treatment_Intent = TX_INTENT, Treatment_Method = TX_METHOD)

finalWithCorrections1$AFFECTED_TREATMENT <- as.factor(finalWithCorrections1$AFFECTED_TREATMENT)
levels(finalWithCorrections1$AFFECTED_TREATMENT) <- c("No", "Yes")

finalWithCorrections1$Treatment_Intent <- as.factor(finalWithCorrections1$Treatment_Intent)
levels(finalWithCorrections1$Treatment_Intent) <- c("NA", "Curative", "Pallative")
levels(finalWithCorrections1$Treatment_Intent)[levels(finalWithCorrections1$Treatment_Intent)=="NA"]<-NA

finalWithCorrections1$Treatment_Method <- as.factor(finalWithCorrections1$Treatment_Method)
levels(finalWithCorrections1$Treatment_Method) <- c("NA", "IMRT")
levels(finalWithCorrections1$Treatment_Method)[levels(finalWithCorrections1$Treatment_Method)=="NA"]<-NA

finalWithCorrections1$CORRECTED <- as.factor(finalWithCorrections1$CORRECTED)
levels(finalWithCorrections1$CORRECTED) <- c("Yes", "No", "NA")
levels(finalWithCorrections1$CORRECTED)[levels(finalWithCorrections1$CORRECTED)=="NA"]<-NA

finalWithCorrections1$DEV_TYPE <- as.factor(finalWithCorrections1$DEV_TYPE)
levels(finalWithCorrections1$DEV_TYPE) <- c("Clinical", "Radiation Safety", "Quality Assurance")

# Put the role of the person who identified the error
users1 <- users %>% 
  select(-c(2,3,4,6))

users1$ROLE_CODES <- as.factor(users1$ROLE_CODES)
levels(users1$ROLE_CODES)[3] = "U"
levels(users1$ROLE_CODES)[2] = "1"


patRoles1 <- patRoles %>% 
  select(-c(2,4,5,6)) %>% 
  rename(ROLE_CODES = ID)

userRoles <- merge(users1, patRoles1, by = "ROLE_CODES") %>% 
  select(-c(1)) %>% 
  rename(IDENTIFIED_BY = ID, Role = DESCRIPTION)

finalWithCorrections3 <- merge(finalWithCorrections1, userRoles, by = "IDENTIFIED_BY", all.x = TRUE)

# Put the date the error was identified.
finalWithCorrections1 <- finalWithCorrections3 %>% 
  separate(DATE_OCCURRED, into = c('Date', 'Time'), sep=' ', remove = FALSE) %>% 
  select(-c("Time", "DATE_OCCURRED"))
finalWithCorrections1$Date <- as.Date(finalWithCorrections1$Date, 
                                      tryFormats = c("%Y-%m-%d", "%Y/%m/%d"))

## FIX FROM BELOW
cleanedWithActions <- finalWithCorrections1 %>% 
  select(2:9, 1, 30, 10:29)
cleanedWithoutActions <- finalWithCorrections1 %>% 
  select(-c(22:30)) %>% 
  distinct(DEVID, .keep_all = TRUE)

cleanedWithActions <- cleanedWithActions %>% 
  rename(CATDESC = Category_Desc, SUBDESC = Subcat_Desc, 
         ATTRDESC = Attribute_Desc, ACTIONDESC_CUST = DESCRIPTION_Custom ,
         ACTIONDESC = DESCRIPTION_Formal)


setwd("~/Documents/ST 495/FinalProject/st_495_radiation_team_c/Datasets/Cleaned Data")
save(cleanedWithActions, file = "cleanedDataWithCorrectiveActions.RData")
save(cleanedWithoutActions, file = "cleanedDataWithoutCorrectiveActions.RData")
  

