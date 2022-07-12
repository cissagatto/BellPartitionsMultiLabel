##################################################################################################
# BELL PARTITIONS MULTILABEL CLASSIFICATION                                                      #
# Copyright (C) 2021                                                                             #
#                                                                                                #
# This code is free software: you can redistribute it and/or modify it under the terms of the    #
# GNU General Public License as published by the Free Software Foundation, either version 3 of   #  
# the License, or (at your option) any later version. This code is distributed in the hope       #
# that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of         #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for    #
# more details.                                                                                  #     
#                                                                                                #
# Elaine Cecilia Gatto | Prof. Dr. Ricardo Cerri | Prof. Dr. Mauri Ferrandin                     #
# Federal University of Sao Carlos (UFSCar: https://www2.ufscar.br/) Campus Sao Carlos           #
# Computer Department (DC: https://site.dc.ufscar.br/)                                           #
# Program of Post Graduation in Computer Science (PPG-CC: http://ppgcc.dc.ufscar.br/)            #
# Bioinformatics and Machine Learning Group (BIOMAL: http://www.biomal.ufscar.br/)               #
#                                                                                                #
##################################################################################################


##################################################################################################
# Script 1 - Libraries                                                                           #
##################################################################################################


##################################################################################################
# Configures the workspace according to the operating system                                     #
##################################################################################################
FolderRoot = "~/BellPartitionsMultiLabel"
FolderScripts = paste(FolderRoot, "/R", sep="")

##################################################################################################
# Load Libraries                                                                                #
##################################################################################################

library("readr", quietly = TRUE) 
library("foreign", quietly = TRUE) 
library("stringr", quietly = TRUE) 
library("plyr", quietly = TRUE) 
library("dplyr", quietly = TRUE) 
library("reshape2", quietly = TRUE) 
library("AggregateR", quietly = TRUE) 
library("rJava", quietly = TRUE) 
library("RWeka", quietly = TRUE) 
library("partitions", quietly = TRUE)
library("numbers", quietly = TRUE)
library("lme4", quietly = TRUE)

##################################################################################################
# Please, any errors, contact us: elainececiliagatto@gmail.com                                   #
# Thank you very much!                                                                           #
##################################################################################################
