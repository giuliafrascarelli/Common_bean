#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH	--cpus-per-task=1
#SBATCH --mem=20gb
#SBATCH -t 150:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gfrascar@umn.edu
#SBATCH -p max
#SBATCH -o %j.out
#SBATCH -e %j.err

module load raxml

raxml -f a -p 12345 -s /scratch.global/gfrascar/raxml_centromers/chr_centromers/Chr07.min4.fasta  -x 12345 -N 100000 -m GTRCAT -V -n raxml_100000_chr07 -w /scratch.global/gfrascar/raxml_centromers/chr_centromers

# Explenation
# -f a rapid Bootstrap analysis and search for best­scoring ML tree in one program run
# -p Specify a random number seed for the parsimony inferences. This allows you to reproduce your results and will help me debug the program. Make sure to pass different random number seeds to RAxML and not only 12345 as I have done in the examples.
# -s Specify the name of the alignment data file in PHYLIP or FASTA format. RAxML can now also parse FASTA format. If RAxML notices that it can't parse a phylip
#format it will try to parse the alignment file as FASTA format. So far it has been able to
#parse all FASTA files.
#- x Specify an integer number (random seed) and turn on rapid bootstrapping 
#     CAUTION:   unlike   in   previous   versions   of   RAxML   will   conduct   rapid   BS  
#replicates under the model of rate heterogeneity you specified via ­m and  
#not by default under CAT 
# -V Disable   rate   heterogeneity   among   sites   model   and   use   one   without   rate  
#heterogeneity   instead.   Only   works   if   you   specify   the   CAT   model   of   rate  
#heterogeneity. 
# -w FULL (!) path to the directory into which RAxML shall write its output files


raxml -f b -m GTRCAT -s /scratch.global/gfrascar/raxml_centromers/chr_centromers/Chr07.min4.fasta -z /scratch.global/gfrascar/raxml_centromers/chr_centromers/RAxML_bootstrap.raxml_100000_chr07 -t /scratch.global/gfrascar/raxml_centromers/chr_centromers/RAxML_bestTree.raxml_100000_chr07 -w /scratch.global/gfrascar/raxml_centromers/chr_centromers -n bootTree_centr_chr07


#raxmlHPC-PTHREADS -f b -m GTRCAT -s /panfs/roc/groups/9/morrellp/gfrascar/Bean/sequence_processing/Create_HC_Subset/final_vcf.fa -z /panfs/roc/groups/9/morrellp/gfrascar/Bean/sequence_processing/Tree/RAxML_bootstrap.merged_raxml_1000 -t /panfs/roc/groups/9/morrellp/gfrascar/Bean/sequence_processing/Tree/RAxML_bestTree.merged_raxml_1000  -w /panfs/roc/groups/9/morrellp/gfrascar/Bean/sequence_processing/Tree -n  bootTree -T 8
