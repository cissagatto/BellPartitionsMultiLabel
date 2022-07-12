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

rm(list=ls())


##################################################################################################
# Script 1 - Libraries                                                                           #
##################################################################################################

##################################################################################################
# Configures the workspace according to the operating system                                     #
##################################################################################################
getwd()
FolderRoot = "~/BellPartitionsMultiLabel"
FolderScripts = paste(FolderRoot, "/R", sep="")

  
##################################################################################################
# LOAD MAIN.R                                                                                     #
##################################################################################################
cat("\nLoad Scripts\n")

setwd(FolderScripts)
source("libraries.R") 

setwd(FolderScripts)
source("utils.R") 

setwd(FolderScripts)
source("BellPartitionsMultiLabel.R") 

setwd(FolderScripts)
source("run.R") 


##################################################################################################
# Options Configuration                                                                          #
##################################################################################################
options(java.parameters = "-Xmx64g")
options(show.error.messages = TRUE)
options(scipen=30)


##################################################################################################
# Read the dataset file with the information for each dataset                                    #
##################################################################################################
setwd(FolderRoot)
datasets <- data.frame(read.csv("datasets-original.csv"))


##################################################################################################
# ARGS COMMAND LINE                                                                              #
##################################################################################################
args <- commandArgs(TRUE)


##################################################################################################
# Get dataset information                                                                        #
##################################################################################################
number_dataset = as.numeric(args[1])
cat("\nLocal: DS \t ", number_dataset)


##################################################################################################
# Get dataset information                                                                        #
##################################################################################################
ds <- datasets[number_dataset,]



##################################################################################################
# Get the number of folds                                                                        #
##################################################################################################
folderResults  <- toString(args[4])
cat("\nLocal: folder \t ", folderResults)


##################################################################################################
# Get dataset name                                                                               #
##################################################################################################
dataset_name  <- toString(ds$Name) 
cat("\nLocal: nome \t ", dataset_name)


##################################################################################################
# DON'T RUN -- it's only for test the code
 # ds <- datasets[43,]
 # dataset_name = ds$Name
 # number_dataset = ds$Id
 # folderResults = "/dev/shm/teste"
##################################################################################################


##################################################################################################
# CONFIG THE FOLDER RESULTS                                                                      #
##################################################################################################
if(dir.exists(folderResults)==FALSE){
  dir.create(folderResults)
  cat("\n")
}
 
diretorios = directories(folderResults)


##################################################################################################
#cat("\nCopy FROM google drive \n")
#destino = paste(FolderRoot, "/Datasets/", dataset_name, sep="")
#origem = paste("cloud:Datasets/Originais/", dataset_name, ".arff", sep="")
#comando = paste("rclone -v copy ", origem, " ", destino, sep="")
#print(system(comando))

##################################################################################################
#destino = paste(FolderRoot, "/Datasets/", dataset_name, sep="")
#origem = paste("cloud:Datasets/Originais/", dataset_name, ".xml", sep="")
#comando = paste("rclone -v copy ", origem, " ", destino, sep="")
#print(system(comando))


##################################################################################################
# EXECUTE
##################################################################################################
cat("\nCompute Bell Partitions for MultiLabel Classification")
timeBPM = system.time(res <- execute(ds, number_dataset, folderResults))
cat("\n")


##################################################################################################
# SAVE RESULTS
##################################################################################################
Folder = paste(FolderRoot, "/Results/", dataset_name, sep="")
setwd(Folder)


##################################################################################################
# compress the results for later transfer to the dataset folder                                  #
##################################################################################################
#cat("\nCompress results\n")
#str3 = paste("tar -zcvf ", dataset_name, "-results.tar.gz ", Folder, sep="")
#print(system(str3))


########################################################################################################################
#cat("\n Copy to google drive")
#origem = paste(Folder, "/", dataset_name, "-results.tar.gz", sep="")
#destino = paste("cloud:elaine/BellPartitionsMultiLabel/Results/", dataset_name, sep="")
#comando = paste("rclone copy ", origem, " ", destino, sep="")
#system(comando)


##################################################################################################
# del                                                                                      #
##################################################################################################
#cat("\nDelete folder \n")
#str5 = paste("rm -r ", Folder)
#print(system(str5))


##################################################################################################
# Please, any errors, contact us: elainececiliagatto@gmail.com                                   #
# Thank you very much!                                                                           #
##################################################################################################

rm(list=ls())
