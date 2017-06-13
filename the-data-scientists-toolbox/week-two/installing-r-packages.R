# Install general packages from CRAN
#install.packages("slidify")
#install.packages("slidify", "ggplot2", "devtools")

# Install packages from bioconductor
source("http://bioconductor.org/biocLite.R")
biocLite(c("GenomicFeatures", "AnnotationDbi"))

# Load packages
library(ggplot2)
# to see all functions in ggplot2
search()