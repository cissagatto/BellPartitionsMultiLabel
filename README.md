# BellPartitionsMultiLabel
This code generates partitions based on bell numbers for multilabel classification. This code is part of my doctoral research. Important, this code will execute on Windows and Linux. When executing in Linux, this code uses the folder "/dev/shm" to reduce I/O process.

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
A file called "datasets.csv" must be in the *datasets* and *root* folder of the project. This file is used to read information about the datasets. These information are used in the code. All 74 datasets available in cometa are in this file. If you want to use another dataset, please, add the following information about the dataset in the file:

_Id, Name, Domain, Labels, Instances, Attributes, Inputs, Labelsets, Single, Max freq, Card, Dens, MeanIR, Scumble, TCS, AttStart, AttEnd, LabelStart, LabelEnd_

The _"Id"_ of the dataset is a mandatory parameter (_n_dataset_) in the command line to run all code. The "LabelStart" and "LabelEnd" are used in a lot of internal functions. Please, make sure that this information is available before running the code.

## Datasets
You will need the originals datasets to run this code. Please, make sure that the folder *datasets* contain the files arrf and xml from cometa.

# Run

```
Rscript bpm.R [number_dataset]
```

Example:

```
Rscript bpm.R 1
```

## Results
This code results in a following files:

[dataset_name]-countPartitions.csv

[dataset_name]-groupsPerPartitions.csv

[dataset_name]-partitions.csv

Returns the label distributions in each partition. Example:

---------------------------------------
|id | part | group | id_labels | labels
---------------------------------------
| 1 | 1 | 1 | 1 | "Label1" |
| 2 | 1 | 1 | 2 | "Label2" |
| 3 | 1 | 1 | 3 | "Label3" |
| 4 | 1 | 1 | 4 | "Label4" |
---------------------------------------

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
