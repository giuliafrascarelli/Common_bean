# Common bean origin

 Investigation of the evolutionary history of wild common bean (*Phaseolus vulgaris*) 

## Plastid data
### Samples 
100 *Phaeolus* samples

### Process:
1. Preprocessing: 
    * FasstQC_1
    * Trimmomatic
    * FastQC_2
    
2. Allignment
    * FastQscreen
    * Bowtie2

3. SNPs calling
    * bcftools mpileup
    * Filtering of singletons

4. Maximum likelihood tree



-----------------------
##  Nuclear data
### Samples
10 accessions of *Phaseolus vulgaris*

### Process:
1. I used the [sequenced_handlig](https://github.com/MorrellLAB/sequence_handling) pipeline.
2. Filtering
3. SNPs in centromeric regions
4. ML tree for each centromer
## Useful link
* Sequence processing analysis refers to __sequence_handling__:
https://github.com/MorrellLAB/sequence_handling

* To change the names of fastq files I used the script developed by Chaochih Liu: https://github.com/ChaochihL/Utilities/tree/master/renaming_files




