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

## Multi-Label Datasets
You can download the multi-label datasets at this link: https://cometa.ujaen.es/datasets/

## Preparing your experiment

### Step-1
Put the datasets in the correct folder

<img src="https://github.com/cissagatto/BellPartitionsMultiLabel/blob/main/images/datasets.png" width="300">

### Step-2
A file called _datasets-original.csv_ must be in the *root project folder*. This file is used to read information about the datasets and they are used in the code. We have 90 multilabel datasets in this _.csv_ file. If you want to use another dataset, please, add the following information about the dataset in the file:


| Parameter    | Status    | Description                                           |
|------------- |-----------|-------------------------------------------------------|
| Id           | mandatory | Integer number to identify the dataset                |
| Name         | mandatory | Dataset name (please follow the benchmark)            |
| Domain       | optional  | Dataset domain                                        |
| Instances    | mandatory | Total number of dataset instances                     |
| Attributes   | mandatory | Total number of dataset attributes                    |
| Labels       | mandatory | Total number of labels in the label space             |
| Inputs       | mandatory | Total number of dataset input attributes              |
| Cardinality  | optional  |                                                       |
| Density      | optional  |                                                       |
| Labelsets    | optional  |                                                       |
| Single       | optional  |                                                       |
| Max.freq     | optional  |                                                       |
| Mean.IR      | optional  |                                                       | 
| Scumble      | optional  |                                                       | 
| TCS          | optional  |                                                       | 
| AttStart     | mandatory | Column number where the attribute space begins*       | 
| AttEnd       | mandatory | Column number where the attribute space ends          |
| LabelStart   | mandatory | Column number where the label space begins            |
| LabelEnd     | mandatory | Column number where the label space ends              |
| Distinct     | optional  |                                                       |
| xn           | mandatory | Value for Dimension X of the Kohonen map              | 
| yn           | mandatory | Value for Dimension Y of the Kohonen map              |
| gridn        | mandatory | X times Y value. Kohonen's map must be square         |
| max.neigbors | mandatory | The maximum number of neighbors is given by LABELS -1 |


* Because it is the first column the number is always 1.

## STEP 3
You need to have installed all the R packages required to execute this code on your machine. Check out which are needed in the file *libraries.R*. This code does not provide any type of automatic package installation! You can use the Conda environment that I created to perform this experiment. Below are the links to download the files.

| [download txt](https://www.4shared.com/s/fUCVTl13zea) | [download yml](https://www.4shared.com/s/f8nOZyxj9iq) | [download yaml](https://www.4shared.com/s/fk5Io4faLiq) |


## Folder Structure

<img src="https://github.com/cissagatto/BellPartitionsMultiLabel/blob/main/images/folders.png" width="300">

## Software Requirements
This code was develop in RStudio Version 1.4.1106 © 2009-2021 RStudio, PBC "Tiger Daylily" (2389bc24, 2021-02-11) for Ubuntu Bionic Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/5.12.8 Chrome/69.0.3497.128 Safari/537.36. The R Language version was: R version 4.1.0 (2021-05-18) -- "Camp Pontanezen" Copyright (C) 2021 The R Foundation for Statistical Computing Platform: x86_64-pc-linux-gnu (64-bit).

## Hardware Requirements
This code may or may not be executed in parallel, however, it is highly recommended that you run it in parallel. The number of cores can be configured via the command line (number_cores). If number_cores = 1 the code will run sequentially. In our experiments, we used 10 cores. For reproducibility, we recommend that you also use ten cores. This code was tested with the birds dataset in the following machine:

*System:*

Host: bionote | Kernel: 5.8.0-53-generic | x86_64 bits: 64 | Desktop: Gnome 3.36.7 | Distro: Ubuntu 20.04.2 LTS (Focal Fossa)

*CPU:*

Topology: 6-Core | model: Intel Core i7-10750H | bits: 64 | type: MT MCP | L2 cache: 12.0 MiB | Speed: 800 MHz | min/max: 800/5000 MHz Core speeds (MHz): | 1: 800 | 2: 800 | 3: 800 | 4: 800 | 5: 800 | 6: 800 | 7: 800 | 8: 800 | 9: 800 | 10: 800 | 11: 800 | 12: 800 |

Then the experiment was executed in a cluster at UFSCar.


# Run

```
Rscript bpm.R [number_dataset] [tem_folder]
```

Example:

```
Rscript bpm.R 1 "/dev/shm/res"
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

The results are store in the Reports folder, like the follow image

<img src="https://github.com/cissagatto/BellPartitionsMultiLabel/blob/main/images/results.png" width="300">

## DOWNLOAD RESULTS
[Click here](https://1drv.ms/u/s!Aq6SGcf6js1mrYo3IopBis_gUWxwdg?e=wFgQSa)

## Acknowledgment
- This study was financed in part by the Coordenação de Aperfeiçoamento de Pessoal de Nível Superior - Brasil (CAPES) - Finance Code 001.
- This study was financed in part by the Conselho Nacional de Desenvolvimento Científico e Tecnológico - Brasil (CNPQ) - Process number 200371/2022-3.
- The authors also thank the Brazilian research agencies FAPESP financial support.

# Contact
elainececiliagatto@gmail.com

## Links

| [Site](https://sites.google.com/view/professor-cissa-gatto) | [Post-Graduate Program in Computer Science](http://ppgcc.dc.ufscar.br/pt-br) | [Computer Department](https://site.dc.ufscar.br/) |  [Biomal](http://www.biomal.ufscar.br/) | [CNPQ](https://www.gov.br/cnpq/pt-br) | [Ku Leuven](https://kulak.kuleuven.be/) | [Embarcados](https://www.embarcados.com.br/author/cissa/) | [Read Prensa](https://prensa.li/@cissa.gatto/) | [Linkedin Company](https://www.linkedin.com/company/27241216) | [Linkedin Profile](https://www.linkedin.com/in/elainececiliagatto/) | [Instagram](https://www.instagram.com/cissagatto) | [Facebook](https://www.facebook.com/cissagatto) | [Twitter](https://twitter.com/cissagatto) | [Twitch](https://www.twitch.tv/cissagatto) | [Youtube](https://www.youtube.com/CissaGatto) |

# Thanks
