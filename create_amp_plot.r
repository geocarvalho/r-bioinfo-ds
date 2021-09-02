library(ggplot2)
library(dplyr)


cov_bed <- read.table(file='amplicon_regions.bed', sep='\t', header=TRUE, 
           col.names=c("transcript", "start", "end", "source", "mean_cov", "samples"))

head(cov_bed)
# Take one sample as example 02MI214440581A
one_df <- filter(cov_bed, samples=="02MI214440581A")

# Change dotsize and stack ratio
p <- ggplot(cov_bed, aes(x=samples, y=mean_cov)) + 
      geom_dotplot(binaxis='y', stackdir='center',
               stackratio=0.35, dotsize=0.1)

# Rotate the dot plot
t <- 500
p + ggtitle("Amplicon mean coverage across samples") + xlab("Samples") + ylab("Amplicon mean coverage") + 
  coord_flip() + geom_hline(yintercept=t, linetype="dashed", color = "red") +
  geom_text(aes(0,t,label = t, vjust = -1), color="red")

ggsave("amplicon_regions_plot.png")

# Bar plot for amplicon coverage and snp
