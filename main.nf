nextflow.enable.dsl=2

include { atlas_recal_1 } from './modules/atlas_recal_1/module.nf'

workflow {
input1 = Channel.fromPath(params.atlas_recal_1.meta_bam_bai_empiric_readgroups).splitCsv(sep: ';').map { row -> tuple(evaluate(row[0]), row[1], row[2], row[3], row[4]) }
input2 = Channel.fromPath(params.atlas_recal_1.alleles)
input3 = Channel.fromPath(params.atlas_recal_1.invariant_sites)
atlas_recal_1(input1, input2, input3)
}
