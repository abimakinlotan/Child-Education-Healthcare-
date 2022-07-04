### Child Education & Healthcare 

library(dplyr)
library(tidyr)
library(tidyverse)
library(openxlsx)
library(readxl)


# =============================================================================== #
# ======= Transformation and Cleaning of Adolescent Health Data set ============= #
# =============================================================================== #

# Step 1
# Method: Sub-setting the Staked headers of the data set into component
#         Rename & converted stacked headers in2 "long" format - col name: Category
#         Convert age bands into "long" format in col name: "AgeBand" 
#         Cleaning the data set from unwanted values
#         Appending all subsets into a long data set

setwd("C:/Users/abiak/Documents/GitHub/Child-Education-Healthcare-")
child_1 <- list.files(pattern = "*.xlsx")


adHealth <- read.xlsx("Adolescent_Health.xlsx", sheet = "5. Adolescent Health", rows = 4:209, cols = 1:31)
names(adHealth)

adMortRate <- adHealth %>% 
  select(Countries.and.areas, Adolescent.mortality.rate.2019) %>% 
  mutate(Category = "AdMortality_2019") %>% 
  mutate(AgeBand = "Age 10-19") %>% 
  rename("Value" = "Adolescent.mortality.rate.2019")


adDeath <- adHealth %>% 
  select(Countries.and.areas, Adolescent.deaths.2019) %>% 
  mutate(Category = "Adolescent.deaths.2019") %>% 
  mutate(AgeBand = "Aged 10-19") %>% 
  rename("Value" = "Adolescent.deaths.2019")

anRateRed20_19 <- adHealth %>% 
  select(Countries.and.areas, `Annual.rate.of.reduction.in.the.adolescent.mortality.rate.(2000-2019)`) %>% 
  mutate(Category = "AnRateRed_in_AdMort") %>% 
  mutate(AgeBand = "Aged 10-19") %>% 
  rename("Value" = "Annual.rate.of.reduction.in.the.adolescent.mortality.rate.(2000-2019)")

adBirthRate <- adHealth %>% 
  select(Countries.and.areas, `Adolescent.birth.rate.2015-2020.(R)`) %>% 
  mutate(Category = "AdBirthRate_15_20") %>% 
  mutate(AgeBand = "Aged 15-19_F") %>% 
  rename("Value" = "Adolescent.birth.rate.2015-2020.(R)")

Women_2024_birthB418 <- adHealth %>% 
  select(Countries.and.areas, `Births.by.age.18.(%).2015-2020.(R)`) %>% 
  mutate(Category = "Women_20.24_birthB418") %>% 
  mutate(AgeBand = "Aged 20-24") %>% 
  rename("Value" = "Births.by.age.18.(%).2015-2020.(R)")

famPlan1520 <- adHealth %>% 
  select(Countries.and.areas, `Demand.for.family.planning.satisfied.with.modern.methods.(%).2015-2020.(R)`) %>% 
  mutate(Category = "famPlanSatMeth1520") %>% 
  mutate(AgeBand = "Aged 15-19_F") %>% 
  rename("Value" = "Demand.for.family.planning.satisfied.with.modern.methods.(%).2015-2020.(R)")

anteCare1520 <- adHealth %>% 
  select(Countries.and.areas, `Antenatal.care.(%).2015-2020.(R)`) %>% 
  mutate(Category = "anteCare1520") %>% 
  mutate(AgeBand = "Aged 15-19_F") %>% 
  rename("Value" = "Antenatal.care.(%).2015-2020.(R)")

SkillBirthAttend1520 <- adHealth %>% 
  select(Countries.and.areas, `Skilled.birth.attendant.(%).2015-2020.(R)`) %>% 
  mutate(Category = "SkillBirthAttend1520") %>% 
  mutate(AgeBand = "Aged 15-19_F") %>% 
  rename("Value" = "Skilled.birth.attendant.(%).2015-2020.(R)")

girlsVaxHPV2000 <- adHealth %>% 
  select(Countries.and.areas, `Girls.vaccinated.against.HPV.(%).2020`) %>% 
  mutate(Category = "girlsVaxHPV2000") %>% 
  mutate(AgeBand = "NoAgeBand") %>% 
  rename("Value" = "Girls.vaccinated.against.HPV.(%).2020")


adHealthFinal <- bind_rows(adMortRate,
                           adDeath,
                           anRateRed20_19,
                           adBirthRate,
                           Women_2024_birthB418,
                           famPlan1520,
                           anteCare1520,
                           SkillBirthAttend1520,
                           girlsVaxHPV2000)
  view(adHealthFinal)

# Step 2
# ============ Clean appended data frame ============ #



# Step 3
# ========== Filter Countries of Interest =========== #
