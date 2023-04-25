## code to prepare `DATASET` dataset goes here
rm(list = ls())
library(tidyverse)
## From FMCR
load('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/FoodMealConsumerResearch/data/Plantbaseddiets.RData')
plantbaseddiet <- Ques
pork<- read.csv2('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/FoodMealConsumerResearch/data/eu.qpc.not0.csv')


## From meal systems technology
load('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/Meal Systems and Technology/data/BuffetData2/BuffetSurveyData.RData')
pasta <- Buffet_survey %>%
  mutate(Did_you_take_food_from_both_Dish1_and_Dish2 =
           substr(`Did you take food from both Dish 1 and Dish 2? `,4,8),
         Did_you_consider_the_proteincontent_of_the_dishes_you_choose =
           substr(`Did you consider the protein content of the dish(es) you chose?`,4,8),
         Why_did_you_consider_the_proteincontent =
           substr(`Why did you consider the protein content of the dish(es) you chose?` ,4,100),
         I_like_taste_of_pasta_with_legumes = `I like the taste of pasta with legumes! ` %>%
           factor(labels = substr(Surveyscales$answ[2:7],4,30)),
         I_like_taste_of_pasta_with_mushrooms =
           `I like the taste of pasta with mushrooms! ` %>%
           factor(labels = substr(Surveyscales$answ[5:7],4,30)),
         Pasta_with_legumes_is_visually_appealing =
           `Pasta with legumes is visually appealing to me. ` %>%
           factor(labels = substr(Surveyscales$answ[2:7],4,30)),
         Pasta_with_mushrooms_is_visually_appealing =
           `Pasta with mushrooms is visually appealing to me. ` %>%
           factor(labels = substr(Surveyscales$answ[4:7],4,30))) %>%
  dplyr::select(Person,Day,StationName,Consumption,Did_you_take_food_from_both_Dish1_and_Dish2,Did_you_consider_the_proteincontent_of_the_dishes_you_choose,Why_did_you_consider_the_proteincontent,I_like_taste_of_pasta_with_legumes,I_like_taste_of_pasta_with_mushrooms,Pasta_with_legumes_is_visually_appealing,Pasta_with_mushrooms_is_visually_appealing)

pastaold <- pasta
pasta <- pastaold %>%
  gather(var,val,I_like_taste_of_pasta_with_legumes:Pasta_with_mushrooms_is_visually_appealing) %>%
  mutate(valnum = val %>% factor(levels = c('Disagree','More or less disagree','Neither agree nor disagree' ,'More or less agree' ,'Agree','Strongly agree')) %>% as.numeric(),
         valnum = valnum + 1) %>%
  select(-val) %>%
  spread(var,valnum)

# table(xx$val,xx$valnum)
  # mutate(Why_did_you_consider_the_proteincontent %>% factor())

load('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/Meal Systems and Technology/data/AcceptanceParsnip.RData')
acceptanceparsnip <- AcceptanceParsnip
load('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/Meal Systems and Technology/data/Canteengrade.RData')

load('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/Meal Systems and Technology/data/Chili.RData')
chili <- Chili
carrot <- readxl::read_excel("~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/Meal Systems and Technology/data/carrot/mst.xls", col_types = c("numeric", "text", "text", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## From TFIH
# beercata <- rio::import('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/Thematic_FoodInnovationHealth/data/Beer_XYZmatrix.xlsx',sheet = 'X unfolded') %>%
#   dplyr::select(-`Unique ID`)
# beerdemo <- rio::import('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/Thematic_FoodInnovationHealth/data/Beer_XYZmatrix.xlsx',sheet = 'Z Background', skip = 1)
# beerliking <- rio::import('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/Thematic_FoodInnovationHealth/data/Beer_XYZmatrix.xlsx',sheet = 'Y (long thin)', skip = 1) %>%
#   dplyr::select(-`missing data points`)

beercata <- rio::import('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/DataAnalysis_ConsumerScience/dataanalyssisconsumerscience/DatasetRbook.xlsx',sheet = 'BeerCATA')
beerdemo <-  rio::import('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/DataAnalysis_ConsumerScience/dataanalyssisconsumerscience/DatasetRbook.xlsx',sheet = 'BeerBackground') #, skip = 1)
beerliking <-  rio::import('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/DataAnalysis_ConsumerScience/dataanalyssisconsumerscience/DatasetRbook.xlsx',sheet = 'BeerLiking')


yogurt <- rio::import('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/Thematic_FoodInnovationHealth/data/ConsumerData_Yoghurt.csv') %>%
  mutate(sessiondate = SessionDate %>% factor(labels = c('day1','day2'))) %>%
  select(Consumer:ConsumerGroup,sessiondate,ProductName:Liking)
# table(yogurt$sessiondate,yogurt$SessionDate)

tempetotemperature <- rio::import('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/Thematic_FoodInnovationHealth/data/Tempeto data.xls', sheet = 'Unfolded data 1') %>% select(Productname,Product,Sousvidetemperature_C:Stout)
#tempetotemperature %>% head

tempetofermentation <- rio::import('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/Thematic_FoodInnovationHealth/data/Tempeto data.xls', sheet = 'Unfolded data 2') %>% select(Productname,Product,Culture:Assessor,id,X1:Miso)
#tempetofermentation %>% head

## Add Beef data from sensory course
beef <- rio::import('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/SensoryEvaluationofFood/Data/Data_Beef.xls')

### add FCMR_survey
fmcrsurvey <- rio::import('~/Dropbox/Backup/MyDocumentsOnC/Course and teaching/DataAnalysis_ConsumerScience/dataanalyssisconsumerscience/DatasetRbook.xlsx', which = 'FMCR_Survey')

# xx <- fmcrsurvey %>%
  # gather(var,val,I_will_only_buy_products_at_a_reduced_price:I_am_able_to_prepare_a_soup) %>%
  # mutate(val = factor(val, levels = c()))

# c("Disagree extremely","Completely disagree","Disagree","Disagree slightly","Neutral","Agree slightly","Agree","Completely agree","Agree extremely","Neither disagree nor agree")

# xx$val %>% table()

usethis::use_data(plantbaseddiet, overwrite = TRUE)
usethis::use_data(pasta, overwrite = TRUE)
usethis::use_data(pork, overwrite = TRUE)
usethis::use_data(acceptanceparsnip, overwrite = TRUE)
usethis::use_data(canteen, overwrite = TRUE)
usethis::use_data(chili, overwrite = TRUE)
usethis::use_data(carrot, overwrite = TRUE)

usethis::use_data(beercata, overwrite = TRUE)
usethis::use_data(beerdemo, overwrite = TRUE)
usethis::use_data(beerliking, overwrite = TRUE)

usethis::use_data(yogurt, overwrite = TRUE)
usethis::use_data(tempetofermentation, overwrite = TRUE)
usethis::use_data(tempetotemperature, overwrite = TRUE)
usethis::use_data(beef, overwrite = TRUE)

usethis::use_data(fmcrsurvey, overwrite = TRUE)

usethis::use_r("plantbaseddiet")
usethis::use_r("pork")

