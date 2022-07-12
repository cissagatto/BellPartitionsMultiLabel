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

##################################################################################################
# Configures the workspace according to the operating system                                     #
##################################################################################################
FolderRoot = "~/BellPartitionsMultiLabel"
FolderScripts = paste(FolderRoot, "/R", sep="")


##################################################################################################
# Runs for all datasets listed in the "datasets.csv" file                                        #
# n_dataset: number of the dataset in the "datasets.csv"                                         #
# number_cores: number of cores to paralell                                                      #
# number_folds: number of folds for cross validation                                             # 
##################################################################################################
execute <- function(ds, number_dataset, folderResults){
  
  cat("\n\n################################################################################################")
  cat("\n# START                                                                                          #")
  cat("\n##################################################################################################\n\n") 
  
  diretorios = directories(folderResults)
  
  retorno = list()
  
  cat("\n\n################################################################################################")
  cat("\n# RUN: Get dataset information: ", number_dataset, "                                                  #")
  dataset_name = ds$Name
  cat("\nDataset: ", dataset_name)
  
  # get the names labels
  folder = paste(diretorios$FolderDatasets, "/", dataset_name, sep="")
  setwd(folder)
  nome = paste(folder, "/", dataset_name, ".arff", sep="")
  arquivo = data.frame(foreign::read.arff(nome))
  namesLabels = c(colnames(arquivo[,ds$LabelStart:ds$LabelEnd]))
  
  FolderR = paste(diretorios$folderResults, "/", dataset_name, sep="")
  if(dir.exists(FolderR)==FALSE){
    dir.create(FolderR)
    print(FolderR)
  }
  
  timeComPart = system.time(resPart <- partition(ds, dataset_name, namesLabels, FolderR))  
  
  retorno$partitions = resPart
  return(retorno)
  
  gc()
  cat("\n##################################################################################################")
  cat("\n# RUN: END                                                                                       #")
  cat("\n##################################################################################################")
  cat("\n\n\n\n") 
}


##################################################################################################
# Please, any errors, contact us: elainececiliagatto@gmail.com                                   #
# Thank you very much!                                                                           #
##################################################################################################