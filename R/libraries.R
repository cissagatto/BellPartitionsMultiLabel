##############################################################################
# BELL PARTITIONS MULTILABEL CLASSIFICATION
# Copyright (C) 2021
# 
# This code is free software: you can redistribute it and/or modify it under
# the terms of the # GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# later version. This code is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
# Public License for more details.                                                                                  #     
#                                                                                                
# Elaine Cecilia Gatto: Prof. Dr. Eng. PhD 
# Ricardo Cerri: Prof. Dr.PhD 
# Mauri Ferrandin: Prof. Dr. PhD 
#
# Federal University of Sao Carlos Campus Sao Carlos 
# UFSCar: https://www2.ufscar.br/
# 
# Computer Department - DC: https://site.dc.ufscar.br/                                           
# 
# Program of Post Graduation in Computer Science 
# PPG-CC: http://ppgcc.dc.ufscar.br/
# 
# Bioinformatics and Machine Learning Group
# BIOMAL: http://www.biomal.ufscar.br/)
#
###############################################################################



##########################################################################
# ROOTING FOLDER
##########################################################################
FolderRoot = "~/BellPartitionsMultiLabel"
FolderScripts =  "~/BellPartitionsMultiLabel/R"


##########################################################################
# Load Packages
##########################################################################

library("readr", quietly = TRUE) 
library("foreign", quietly = TRUE) 
library("stringr", quietly = TRUE) 
library("plyr", quietly = TRUE) 
library("dplyr", quietly = TRUE) 
library("reshape2", quietly = TRUE) 
library("AggregateR", quietly = TRUE) 
# library("rJava", quietly = TRUE) 
# library("RWeka", quietly = TRUE) 
library("partitions", quietly = TRUE)
library("numbers", quietly = TRUE)
library("lme4", quietly = TRUE)


##########################################################################
# Please, any errors, contact us: elainececiliagatto@gmail.com
# Thank you very much!
##########################################################################
