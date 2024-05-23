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
#
##########################################################################
partition <- function(parameters){
  
  retorno = list()
  
  cat("\nNumber of Labels: ", parameters$dataset.info$Labels)
  
  # generating partitions from bell number
  num.partitions = bell(parameters$dataset.info$Labels)
  cat("\nNumber of Partitions: ", num.partitions)
  
  # bell(10)
  
  # partitions itself!
  BellPartitions = listParts(parameters$dataset.info$Labels, do.set=FALSE)
  # print(BellPartitions)
  
  # ordering label name vector
  ordem.labels = sort(parameters$names.labels, index.return = TRUE)
  
  # creating a data frame that has the label number and name
  rotulos = data.frame(ordem.labels)
  names(rotulos) = c("rotulos","indice")
  
  # cat("\nNames Labels\n")
  # print(rotulos)
  
  # Data frames to save the generated partitions and number of groups within each partition
  particoes <- data.frame(part = integer(), group = integer(), id_labels = integer())
  groupsPerPartitions <- data.frame(part = integer(), totalGroups = integer())
  
  # Organizing partition information in a data frame
  n <- length(BellPartitions)
  
  # loop
  for (p in 1:n) {
    cat("\nPartition: ", p)
    m <- length(BellPartitions[[p]])
    groupsPerPartitions <- rbind(groupsPerPartitions, data.frame(part = p, totalGroups = m))
    
    for (g in 1:m) {
      # Extracting the group data
      h <- as.data.frame(BellPartitions[[p]][g])
      colnames(h)[1] <- "X"
      
      # Creating the partition data
      particoes <- rbind(particoes, data.frame(part = p, group = g, id_labels = h$X))
    }
  }
  
  
  # # data frame to save the generated partitions
  # part = c(0)
  # group = c(0)
  # id_labels = c(0)
  # particoes = data.frame(part, group, id_labels)
  # 
  # # data frame to save the number of groups within each partition
  # totalGroups = c(0)
  # groupsPerPartitions = data.frame(part, totalGroups)
  # 
  # # organizing partition information in a data frame
  # # cat("\nStart replace numbers per names labels")
  # n = length(BellPartitions)
  # p = 1
  # for(p in 1:n){
  #   cat("\nPartition: ", p)
  #   m = length(BellPartitions[[p]])
  #   part = p
  #   totalGroups = m
  #   groupsPerPartitions = rbind(groupsPerPartitions, data.frame(part, 
  # totalGroups))
  #   
  #   g = 1
  #   for(g in 1:m){
  #     #cat("\n\tGroup: ", g)
  #     h = as.data.frame(BellPartitions[[p]][g])
  #     colnames(h)[1] = "X"
  #     part = p
  #     group = g
  #     id_labels = h$X
  #     b = data.frame(part, group, id_labels)
  #     particoes = rbind(particoes, b)
  #     g = g + 1
  #     gc()
  #   } # fim do grupo
  #   
  #   p = p +1
  #   gc()
  # } # fim da partição
  
  
  
  ##############################
  # organizing the partitions  #
  ##############################
  
  # particoes = particoes[-1,]
  # id = seq(1, nrow(particoes), by=1)
  # particoes2 = cbind(id, particoes)
  
  particoes2 <- particoes %>%
    mutate(id = row_number()) %>%
    select(id, everything())
  
  ##############################################
  # Associating label names with label indices #
  ##############################################
  
  # labels = particoes2$id_labels
  # particoes3 = cbind(particoes2, labels)
  # rotulos2 = rotulos[order(rotulos$indice , decreasing = FALSE), ] 
  # j = 1
  # while(j<=parameters$dataset.info$Labels){
  #   particoes3$labels[particoes3$labels == j] <- rotulos2$rotulos[j]  
  #  j = j + 1
  # }
  
  # Sort the labels
  rotulos2 <- rotulos[order(rotulos$indice), ]
  
  # Replace label indices with label names in vectorized form
  particoes3 <- particoes2
  particoes3$labels <- rotulos2$rotulos[match(particoes2$id_labels, 
                                              rotulos2$indice)]
  
  ############
  # FREQUENCY #
  ############
  
  # countPartitions = count(groupsPerPartitions, vars = 
  # groupsPerPartitions$totalGroups)
  # colnames(countPartitions) = c("groups", "total")
  
  countPartitions <- groupsPerPartitions %>% count(totalGroups) %>% 
    rename(groups = totalGroups, total = n)
  
  # saving the information
  setwd(parameters$FolderResDataset)
  write.csv(particoes3, paste(parameters$name.dataset, "-partitions.csv", sep=""))
  write.csv(groupsPerPartitions, paste(parameters$name.dataset, 
                                       "-groupsPerPartitions.csv", sep=""))
  write.csv(countPartitions, paste(parameters$name.dataset, "-countPartitions.csv", 
                                   sep=""))
  
  # return
  retorno$numPartitions = num.partitions
  retorno$BellPartitions = BellPartitions
  retorno$labelsNumber = parameters$dataset.info$Labels
  retorno$labelsOrder = ordem.labels
  retorno$labelsNames = rotulos
  retorno$partitions = particoes3
  retorno$groupsPerPartitions = groupsPerPartitions
  
  return(retorno)
  
  gc()
  
  cat("\n##############################################################")
  cat("\n# Compute Partitions: END                                    #") 
  cat("\n###############################################################")
  cat("\n\n\n\n")
  
}


##########################################################################
# Please, any errors, contact us: elainececiliagatto@gmail.com
# Thank you very much!
##########################################################################