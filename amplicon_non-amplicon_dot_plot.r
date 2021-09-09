library(tidyverse)
library(ggplot2)
library(dplyr)

cov_bed <- read.table(file='/path/to/non-amplicon_meancov.csv',
                      header=TRUE, sep=",")
sample_lst <- unique(cov_bed$sample)
# sample_id <- "48MI215706343A"
t <- 20
# df <- filter(cov_bed, sample==sample_id)
# for (id in sample_lst) {
#   df <- filter(cov_bed, sample==id)
#   p <- ggplot(df, aes(x=size, y=mean_coverage)) + 
#     geom_point(aes(color=position)) +
#     geom_hline(yintercept = t)
# }

ggplot(cov_bed, aes(size, mean_coverage, color = position)) +
  ggtitle("Amplicon mean coverage x interval lenght") + xlab("Interval lenght") + ylab("Mean coverage") +
  geom_point() +
  facet_wrap(~cov_bed$sample)
