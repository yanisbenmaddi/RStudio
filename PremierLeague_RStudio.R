setwd("C:/Users/yanis/Downloads")

library(car)
library(FactoMineR) 
library(explor)
library(factoextra)    
library(questionr)    ## t�l�chargements de tous les packages "au cas o�" ##
library(dplyr)
library(tidyverse)
library(tidyr)
library(stringr)
library(readxl)

## r�sultats et statistiques de la saison de premier league 2018-2019 ##

PL <- read_excel("premierleague2018_2019_bdd.xlsx")

PL$Div <- recode(PL$Div, 'E0' = '1�re div' )
PL$FTR <- recode(PL$FTR, 'H'='Victoire Domicile', 'A'='Victoire Ext�rieur', 'D'='Match Nul')
PL$HTR <- recode(PL$HTR, 'H'='Victoire Domicile', 'A'='Victoire Ext�rieur', 'D'='Match Nul')
PL <- PL[,-c(11)]

## recodage/renommage pour rendre la base + lisible ##



colnames(PL)[colnames(PL) == 'HomeTeam'] <- 'Domicile'
colnames(PL)[colnames(PL) == 'AwayTeam'] <- 'Ext�rieur'
colnames(PL)[colnames(PL) == 'FTHG'] <- 'But(s) Domicile Fin Temps R�glementaire '
colnames(PL)[colnames(PL) == 'FTAG'] <- 'But(s) Ext�rieur Fin Temps R�glementaire '
colnames(PL)[colnames(PL) == 'FTR'] <- 'R�sultat Final'
colnames(PL)[colnames(PL) == 'HTHG'] <- 'But(s) Domicile Mi-Temps'
colnames(PL)[colnames(PL) == 'HTAG'] <- 'But(s) Ext�rieur Mi-Temps'
colnames(PL)[colnames(PL) == 'HTR'] <- 'R�sultat Mi-Temps'
colnames(PL)[colnames(PL) == 'HS'] <- 'Tir(s) tent�(s) Domicile'
colnames(PL)[colnames(PL) == 'AS'] <- 'Tir(s) tent�(s) Ext�rieur'
colnames(PL)[colnames(PL) == 'HST'] <- 'Tir(s) tent�(s) cadr�(s) Domicile'
colnames(PL)[colnames(PL) == 'AST'] <- 'Tir(s) tent�(s) cadr�(s) Ext�rieur'
colnames(PL)[colnames(PL) == 'HF'] <- 'Faute(s) Domicile'
colnames(PL)[colnames(PL) == 'AF'] <- 'Faute(s) Ext�rieur'
colnames(PL)[colnames(PL) == 'HC'] <- 'Corner(s) Domicile'
colnames(PL)[colnames(PL) == 'AC'] <- 'Corner(s) Ext�rieur'
colnames(PL)[colnames(PL) == 'HY'] <- 'Carton(s) Jaune Domicile'
colnames(PL)[colnames(PL) == 'AY'] <- 'Carton(s) Jaune Ext�rieur'
colnames(PL)[colnames(PL) == 'HR'] <- 'Carton(s) Rouge Domicile'
colnames(PL)[colnames(PL) == 'AR'] <- 'Carton(s) Rouge Ext�rieur'

view(PL)


res.ACP <- PCA(PL, quali.sup=c(1,2,3,4,7,10), scale.unit = T)

fviz_contrib(res.ACP, choice = "var")

summary(res.ACP)

res.ACP$eig
get_eig(res.ACP)



explor(res.ACP)






