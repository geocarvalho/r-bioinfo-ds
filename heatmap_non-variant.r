library(tidyverse)
library(ggplot2)
library(dplyr)
library(ComplexHeatmap)
library(circlize)

dat <- read.table(file='C:/Users/george.carvalho/Nextcloud/Documents/projects/NSC/features/mosdepth_cov/outputs/non-variant_meancov.csv',
                      header=TRUE, sep=",")
head(dat)
# p <- ggplot(cov_bed, aes(x = sample, y = source, fill = mean_coverage)) + geom_tile() +
#  ggtitle("Variant and non-variant intervals coverage accross samples") + xlab("Samples") + ylab("Intervals") +
#  theme(axis.text.x = element_text(angle = 15, vjust = 0.5, hjust=0.8))

#ggsave("heatmap_non-variant.pdf", width=15, height=15)

mat <- dat %>% select(source, mean_coverage, sample) %>%
  pivot_wider(names_from = source, values_from = mean_coverage) %>%
  column_to_rownames('sample') %>%
  as.matrix

options(repr.plot.width = 15, repr.plot.height = 8)
cell_colors <- colorRamp2(c(0, log10(20), 4), c("white", "orange", "red"))
title_fontsize <- 14
labels_fontsize <- 8
png("variant-non-variant-complexheatmap.png",width=15,height=8,units="in",res=1200)
Heatmap(log10(mat + 1),
             col = cell_colors,
             column_title = "Variant / inter-variant region",
             column_title_side = 'top',
             row_title = 'Sample',
             column_title_gp = gpar(fontsize = title_fontsize),
             row_title_gp = gpar(fontsize = title_fontsize),
             cluster_columns = FALSE,
             name = 'log10(coverage)',
             border = 'gray',
             width = unit(ncol(mat) / 4, 'cm'),
             height = unit(nrow(mat) / 4, 'cm'),
             row_names_gp = gpar(fontsize = labels_fontsize),
             column_names_gp = gpar(fontsize = labels_fontsize),
             rect_gp = gpar(col = "gray", lwd = 0.5))
draw(p, heatmap_legend_side = 'left')
dev.off()
