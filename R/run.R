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
# Runs for all datasets listed in the "datasets.csv" file
# n_dataset: number of the dataset in the "datasets.csv"
# number_cores: number of cores to paralell
# number_folds: number of folds for cross validation
##########################################################################
execute <- function(parameters){
  
  cat("\n\n#############################################################")
    cat("\n# START                                                     #")
    cat("\n#############################################################\n\n") 
  
  diretorios = directories(parameters$FolderResults)
  
  retorno = list()
  
  cat("\n\n##############################################################")
    cat("\n# RUN                                                        #")
    cat("\n# Number Dataset: ", parameters$number.dataset, "            #")
    cat("\n# Name Dataset: ", parameters$name.dataset, "                #")
    cat("\n##############################################################\n\n") 
  
  # get the names labels
  folder = paste(diretorios$FolderDatasets, "/", parameters$name.dataset, sep="")
  setwd(folder)
  nome = paste(folder, "/", parameters$name.dataset, ".arff", sep="")
  arquivo = data.frame(foreign::read.arff(nome))
  parameters$names.labels = c(colnames(arquivo[,parameters$dataset.info$LabelStart:parameters$dataset.info$LabelEnd]))
  
  timeComPart = system.time(resPart <- partition(parameters))  
  result_time <- t(data.matrix(timeComPart))
  setwd(parameters$FolderResDataset)
  write.csv(result_time, "runtime_run.csv")
  cat("\n")
  
  retorno$partitions = resPart
  return(retorno)
  
  gc()
  cat("\n##################################################################################################")
  cat("\n# RUN: END                                                                                       #")
  cat("\n##################################################################################################")
  cat("\n\n\n\n") 
}


##########################################################################
# Please, any errors, contact us: elainececiliagatto@gmail.com
# Thank you very much!
##########################################################################