# BellPartitionsMultiLabel
This code generates partitions based on bell numbers for multilabel classification. This code is part of my doctoral research. Important: when executing in Linux, this code uses the folder "/dev/shm" to reduce I/O process.

## How to cite 
@misc{Gatto2021, author = {Gatto, E. C.}, title = {Bell Partitions for Multilabel Classification}, year = {2021}, publisher = {GitHub}, journal = {GitHub repository}, howpublished = {\url{https://github.com/cissagatto/BellPartitionsMultiLabel/}}}

## Scripts
This source code consists of an R project for R Studio and the following R scripts:

1. libraries
2. utils
3. BellPartitionsMultiLabel
4. run
5. bpm

## Folder Path
Place a copy of this code in _"C:/Users/[username]/BellPartitionsMultiLabel"_ or _"/home/username/BellPartitionsMultiLabel"_. You can change the path in the code if you want.

## File "datasets.csv"
A file called *datasets.csv* must be in the root project folder. This file is used to read information about the datasets and they are used in the code. All 74 datasets available in cometa (https://cometa.ujaen.es/) are in this file. If you want to use another dataset, please, add the following information about the dataset in the file:

*Id, Name, Domain, Labels, Instances, Attributes, Inputs, Labelsets, Single, Max freq, Card, Dens, MeanIR, Scumble, TCS, AttStart, AttEnd, LabelStart, LabelEnd, xn, yn, gridn*

The _"Id"_ of the dataset is a mandatory parameter in the command line to run all code. The fields are used in a lot of internal functions. Please, make sure that this information is available before running the code. *xn* and *yn* correspond to a dimension of the quadrangular map for kohonen, and *gridn* is *xn* * *yn*. Example: xn = 4, yn = 4, gridn = 16.

## Datasets
You will need the originals datasets to run this code. Please, make sure that the folder *datasets* contain the arrf and xml files from cometa.

# Run

```
Rscript bpm.R [number_dataset]
```

Example:

```
Rscript bpm.R 1
```

## Results
Three files are generated as result:

**[dataset_name]-countPartitions.csv**: Returns the frequency of groups. For example group 1 appears only 1 time while group 3 appears 6 times.
| groups | total | 
| ------ | ----- | 
|   1    |   1   | 
|   2    |   7   | 
|   3    |   6   | 
|   4    |   1   | 

**[dataset_name]-groupsPerPartitions.csv**: Returns the number of groups for each partition. For example partition 2, 3 and 4 has 2 groups while partition 1 only one.
| part | totalGroups | 
| ---- | ----------- | 
|   1  |      1      | 
|   2  |      2      |  
|   3  |      2      |  
|   4  |      2      |  

**[dataset_name]-partitions.csv**: Returns the label distributions in each partition. For example: in partition 12 the Label1 and Label2 are located in group 1 while Label3 and Label4 are in group 2.
| id | part | group | id_labels |  labels  |
| -- | ---- | ----- | --------- | -------- |
|  1 |  12  |   1   |     1     | "Label1" |
|  2 |  12  |   1   |     2     | "Label2" |
|  3 |  12  |   2   |     3     | "Label3" |
|  4 |  12  |   2   |     4     | "Label4" |


## Software Requirements
This code was develop in R Studio Version 1.3.959 © 2009-2020, PBC, "Middlemist Red" (3a09be39, 2020-05-18) for Windows. The R language version was 4.0.1 (2020-06-06) with x86_64-w64-mingw32 platform. Please make sure all the dependencies are installed (verify libraries.R). This code does not provide an installation of R packages.

## Hardware Requirements
This code was tested in a laptop with 16,0GB RAM and a processor Intel (R) Core (TM) i7-5500U CPU @ 2.40 GHz for datasets with less than 8 labels in label space. With you want to test datasets with more than 8 labels, it is recommended that you use a cluster with high available RAM.

## Acknowledgment
This study is financed in part by the Coordenação de Aperfeiçoamento de Pessoal de Nível Superior - Brasil (CAPES) - Finance Code 001

## Links

[Post-Graduate Program in Computer Science](http://ppgcc.dc.ufscar.br/pt-br)

[Biomal](http://www.biomal.ufscar.br/)

[Computer Department](https://site.dc.ufscar.br/)

[CAPES](https://www.gov.br/capes/pt-br)

[Embarcados](https://www.embarcados.com.br/author/cissa/)

[Linkedin](https://www.linkedin.com/in/elainececiliagatto/)

[Linkedin](https://www.linkedin.com/company/27241216)

[Instagram](https://www.instagram.com/professoracissa/)

[Facebook](https://www.facebook.com/ProfessoraCissa/)

[Twitter](https://twitter.com/professoracissa)

# Thanks
