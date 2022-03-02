setwd("C:/Users/yanis/Downloads")

library(car)
library(FactoMineR) 
library(explor)
library(factoextra)    
library(questionr)    ## téléchargements de tous les packages "au cas où" ##
library(dplyr)
library(tidyverse)
library(tidyr)
library(stringr)
library(readxl)

## résultats et statistiques de la saison de premier league 2018-2019 ##

PL <- read_excel("premierleague2018_2019_bdd.xlsx")

PL$Div <- recode(PL$Div, 'E0' = '1ère div' )
PL$FTR <- recode(PL$FTR, 'H'='Victoire Domicile', 'A'='Victoire Extérieur', 'D'='Match Nul')
PL$HTR <- recode(PL$HTR, 'H'='Victoire Domicile', 'A'='Victoire Extérieur', 'D'='Match Nul')
PL <- PL[,-c(11)]

## recodage/renommage pour rendre la base + lisible ##



colnames(PL)[colnames(PL) == 'HomeTeam'] <- 'Domicile'
colnames(PL)[colnames(PL) == 'AwayTeam'] <- 'Extérieur'
colnames(PL)[colnames(PL) == 'FTHG'] <- 'But(s) Domicile Fin Temps Réglementaire '
colnames(PL)[colnames(PL) == 'FTAG'] <- 'But(s) Extérieur Fin Temps Réglementaire '
colnames(PL)[colnames(PL) == 'FTR'] <- 'Résultat Final'
colnames(PL)[colnames(PL) == 'HTHG'] <- 'But(s) Domicile Mi-Temps'
colnames(PL)[colnames(PL) == 'HTAG'] <- 'But(s) Extérieur Mi-Temps'
colnames(PL)[colnames(PL) == 'HTR'] <- 'Résultat Mi-Temps'
colnames(PL)[colnames(PL) == 'HS'] <- 'Tir(s) tenté(s) Domicile'
colnames(PL)[colnames(PL) == 'AS'] <- 'Tir(s) tenté(s) Extérieur'
colnames(PL)[colnames(PL) == 'HST'] <- 'Tir(s) tenté(s) cadré(s) Domicile'
colnames(PL)[colnames(PL) == 'AST'] <- 'Tir(s) tenté(s) cadré(s) Extérieur'
colnames(PL)[colnames(PL) == 'HF'] <- 'Faute(s) Domicile'
colnames(PL)[colnames(PL) == 'AF'] <- 'Faute(s) Extérieur'
colnames(PL)[colnames(PL) == 'HC'] <- 'Corner(s) Domicile'
colnames(PL)[colnames(PL) == 'AC'] <- 'Corner(s) Extérieur'
colnames(PL)[colnames(PL) == 'HY'] <- 'Carton(s) Jaune Domicile'
colnames(PL)[colnames(PL) == 'AY'] <- 'Carton(s) Jaune Extérieur'
colnames(PL)[colnames(PL) == 'HR'] <- 'Carton(s) Rouge Domicile'
colnames(PL)[colnames(PL) == 'AR'] <- 'Carton(s) Rouge Extérieur'

view(PL)


res.ACP <- PCA(PL, quali.sup=c(1,2,3,4,7,10), scale.unit = T)

fviz_contrib(res.ACP, choice = "var")

summary(res.ACP)

res.ACP$eig
get_eig(res.ACP)



explor(res.ACP)






