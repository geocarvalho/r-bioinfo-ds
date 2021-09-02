library(ggplot2)
library(dplyr)

dataset <- 'variant_samples_regions_meancov.bed'
cov_bed <- read.table(file=dataset, sep='\t', header=TRUE, 
                      col.names=c("transcript", "start", "end", "source", "mean_cov", "samples", "amplicon"))
head(cov_bed)

# 
p <- ggplot(cov_bed, aes(x=samples, y=mean_cov)) + 
  geom_dotplot(binaxis='y', stackdir='center',
               stackratio=0.35, dotsize=0.4)
t <- 1000
p + ggtitle("Variant mean coverage across amplicons") + xlab("Samples") + ylab("Variant mean coverage") +
  coord_flip() + geom_hline(yintercept=t, linetype="dashed", color = "red") +
  geom_text(aes(0,t,label = t, vjust = -1), color="red") + 
  facet_grid(. ~ amplicon, space="free_x", scales="free_x", switch="x") +
  theme_classic()

ggsave("variants_amplicon_plot.png")
