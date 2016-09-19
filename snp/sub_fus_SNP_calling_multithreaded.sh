#$ -S /bin/bash
#$ -cwd
#$ -pe smp 6
#$ -l h_vmem=4G
#$ -l h=blacklace01.blacklace|blacklace02.blacklace|blacklace04.blacklace|blacklace05.blacklace|blacklace06.blacklace|blacklace07.blacklace|blacklace08.blacklace|blacklace09.blacklace|blacklace10.blacklace|blacklace11.blacklace|blacklace12.blacklace

# Testing parallelisation of GATk HaplotypeCaller - may crash.

input=/home/sobczm/popgen/input/mappings

reference=Fus2_canu_contigs_unmasked.fa
filename=$(basename "$reference")
output="${filename%.*}.vcf"

gatk=/home/sobczm/bin/GenomeAnalysisTK-3.6

java -jar $gatk/GenomeAnalysisTK.jar \
     -R $input/$reference \
     -T HaplotypeCaller \
     -ploidy 1 \
     -nct 6 \
     --allow_potentially_misencoded_quality_scores \
     -I $input/125/125_Fus2_canu_contigs_unmasked.fa_aligned_nomulti_proper_sorted_nodup_rg.bam \
     -I $input/55/55_Fus2_canu_contigs_unmasked.fa_aligned_nomulti_proper_sorted_nodup_rg.bam \
     -I $input/A1-2/A1-2_Fus2_canu_contigs_unmasked.fa_aligned_nomulti_proper_sorted_nodup_rg.bam \
     -I $input/A13/A13_Fus2_canu_contigs_unmasked.fa_aligned_nomulti_proper_sorted_nodup_rg.bam \
     -I $input/A23/A23_Fus2_canu_contigs_unmasked.fa_aligned_nomulti_proper_sorted_nodup_rg.bam \
     -I $input/A28/A28_Fus2_canu_contigs_unmasked.fa_aligned_nomulti_proper_sorted_nodup_rg.bam \
     -I $input/CB3/CB3_Fus2_canu_contigs_unmasked.fa_aligned_nomulti_proper_sorted_nodup_rg.bam \
     -I $input/D2/D2_Fus2_canu_contigs_unmasked.fa_aligned_nomulti_proper_sorted_nodup_rg.bam \
     -I $input/Fus2/Fus2_Fus2_canu_contigs_unmasked.fa_aligned_nomulti_proper_sorted_nodup_rg.bam \
     -I $input/HB6/HB6_Fus2_canu_contigs_unmasked.fa_aligned_nomulti_proper_sorted_nodup_rg.bam \
     -I $input/PG/PG_Fus2_canu_contigs_unmasked.fa_aligned_nomulti_proper_sorted_nodup_rg.bam \
     -o $output


#####################################
# Notes on GATK parallelisation
#####################################
# http://gatkforums.broadinstitute.org/gatk/discussion/1975/how-can-i-use-parallelism-to-make-gatk-tools-run-faster
