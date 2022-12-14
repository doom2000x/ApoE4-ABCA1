##############################################################################################################
# load libraries
require(SingleCellExperiment)
require(Matrix)
##############################################################################################################
# load qc files and generate sce
print('reading matrix')
C <- readMM("../data/single_cell_data/raw_counts_data/raw_counts.mtx")
print('making sce object')
sce <- SingleCellExperiment(assays=list(counts=C))
rowMeta <- read.csv("../data/single_cell_data/raw_counts_data/gene_names.csv")
colMeta <- DataFrame(read.csv("../data/single_cell_data/raw_counts_data/column_metadata.csv", row.names = 1))
sce@colData <- colMeta
rowData(sce) <- rowMeta
##############################################################################################################
print('saving')
saveRDS(sce, '../data/single_cell_data/single_cell_experiment_object_raw.rds')
print('done')
