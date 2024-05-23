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
# CLEANING ALL
##########################################################################
rm(list=ls())

##########################################################################
# 
##########################################################################
parameters = list()


##########################################################################
# ROOTING FOLDER
##########################################################################
# FolderRoot = "~/BellPartitionsMultiLabel"
# FolderScripts =  "~/BellPartitionsMultiLabel/R"

parameters$FolderRoot = "~/BellPartitionsMultiLabel"
parameters$FolderScripts = "~/BellPartitionsMultiLabel/R"

  
##########################################################################
# LOAD SOURCES
##########################################################################
# cat("\nLoad Scripts\n")

setwd(parameters$FolderScripts)
source("libraries.R") 

setwd(parameters$FolderScripts)
source("utils.R") 

setwd(parameters$FolderScripts)
source("BellPartitionsMultiLabel.R") 

setwd(parameters$FolderScripts)
source("run.R") 


##########################################################################
# Options Configuration
##########################################################################
options(java.parameters = "-Xmx64g")
options(show.error.messages = TRUE)
options(scipen=30)


##########################################################################
# Read the file with the information for each dataset
##########################################################################
setwd(parameters$FolderRoot)
datasets <- data.frame(read.csv("datasets-original.csv"))


##########################################################################
# ARGS COMMAND LINE
##########################################################################
args <- commandArgs(TRUE)



##########################################################################
# DON'T RUN -- it's only for test the code locally 
# parameters$number.dataset =  43
# parameters$dataset.info = datasets[parameters$number.dataset,]
# parameters$name.dataset = parameters$dataset.info$Name
# parameters$FolderResults = "~/BellPartitionsMultiLabel/Results"
# folderResults = "/dev/shm/teste"
##########################################################################



##########################################################################
# Get the number of the dataset
##########################################################################
parameters$number.dataset = as.numeric(args[1])
cat("\nBPM: DS \t ", parameters$number.dataset)


##########################################################################
# Get dataset information
##########################################################################
parameters$dataset.info <- datasets[parameters$number.dataset,]
cat("\nBPM: DS \t ", parameters$dataset.info)


##########################################################################
# Get folder results name and path
##########################################################################
parameters$FolderResults  <- toString(args[2])
cat("\nBPM: folder \t ", parameters$FolderResults)


##########################################################################
# Get dataset name
##########################################################################
parameters$name.dataset = parameters$dataset.info$Name
cat("\nBPM: nome \t ", parameters$name.dataset)


##########################################################################
# CONFIG THE FOLDER RESULTS
##########################################################################
if(dir.exists(parameters$FolderResults)==FALSE){ dir.create(parameters$FolderResults)}
diretorios = directories(parameters$FolderResults)


##########################################################################
# Use this only with you are using RCLONE for transfer files
##########################################################################
# cat("\nCopy FROM google drive \n")
# destino = paste(FolderRoot, "/Datasets/", dataset_name, sep="")
# origem = paste("cloud:Datasets/Originais/", dataset_name, ".arff", sep="")
# comando = paste("rclone -v copy ", origem, " ", destino, sep="")
# print(system(comando))
##########################################################################


##########################################################################
# destino = paste(FolderRoot, "/Datasets/", dataset_name, sep="")
# origem = paste("cloud:Datasets/Originais/", dataset_name, ".xml", sep="")
# comando = paste("rclone -v copy ", origem, " ", destino, sep="")
# print(system(comando))
##########################################################################


##########################################################################
# SAVE RESULTS
##########################################################################
FolderResDataset = paste(parameters$FolderResults, "/", 
                         parameters$name.dataset, sep="")
if(dir.exists(FolderResDataset)==FALSE){dir.create(FolderResDataset)}
parameters$FolderResDataset = FolderResDataset
setwd(FolderResDataset)


##########################################################################
# EXECUTE
##########################################################################
cat("\nCompute Bell Partitions for MultiLabel Classification")
timeBPM = system.time(res <- execute(parameters))
result_time <- t(data.matrix(timeBPM))
setwd(parameters$FolderResDataset)
write.csv(result_time, "runtime_bpm.csv")
cat("\n")



##########################################################################
# You can compress the results for transfer!
##########################################################################
# cat("\nCompress results\n")
# str3 = paste("tar -zcvf ", dataset_name, "-results.tar.gz ", Folder, sep="")
# print(system(str3))



##########################################################################
# Use this only with you are using RCLONE for transfer files
##########################################################################
# cat("\n Copy to google drive")
# origem = paste(Folder, "/", dataset_name, "-results.tar.gz", sep="")
# destino = paste("cloud:elaine/BellPartitionsMultiLabel/Results/", 
# dataset_name, sep="")
# comando = paste("rclone copy ", origem, " ", destino, sep="")
# system(comando)
##########################################################################



##########################################################################
# DELETE ALL FROM THE SERVER
##########################################################################
# cat("\nDelete folder \n")
# str5 = paste("rm -r ", Folder)
# print(system(str5))
##########################################################################



##########################################################################
# CLEANING ALL
##########################################################################
rm(list=ls())



##########################################################################
# Please, any errors, contact us: elainececiliagatto@gmail.com
# Thank you very much!
##########################################################################