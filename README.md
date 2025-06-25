# Comparative Genomics Script
The shell script performs large scale genomics comparisons between 7 genomes using RagTag and Blast visualises them in Artemis.
The script can be used to:
- filter the input data (Seqkit)
- re-arrange scaffolds according to a reference (RagTag)
- find genomic similarities (Blast)
- visualise genomic comparisons (Artemis)
<br>
<br>  
___________________________________________________________________________________
<br> 
## INSTALL REQUIRED SOFTWARE
### ARTEMIS 
Install Artemis (for visualisation and genome broswing):
```
conda config --add channels bioconda   
conda config --add channels conda-forge
conda install artemis
```
Alternatively, you can get it directly from their from website:<br> 
http://sanger-pathogens.github.io/Artemis/Artemis/<br> 
https://www.sanger.ac.uk/tool/artemis-comparison-tool-act/<br>
<br> 
<br>

### RAGTAG (for contig reordering)
Ragtag (for scaffold reordering according to reference)
```
conda install -c bioconda ragtag
```
<br>

### BLAST NCBI (for genome comparisons)
```
sudo apt-get install ncbi-blast+
```
<br>

### Seqkit and Sequence length HISTOGRAM 
Visit website: https://bioinf.shenwei.me/seqkit/download/
```
pip install bashplotlib
conda install -c bioconda seqkit
conda install -c bioconda csvtk
```
<br>
<br>

## HOW TO LAUNCH SCRIPT IN YOUR TERMINAL
Use the script in your terminal like this:
```
sh genome_comparison_7comps_with2Refs.sh \
       draft_genome1.fasta minimal_contig_length_1 \
       draft_genome2.fasta minimal_contig_length_2 \
       draft_genome3.fasta minimal_contig_length_3 \
       draft_genome4.fasta minimal_contig_length_4 \
       draft_genome4.fasta minimal_contig_length_5 \
       draft_genome5.fasta minimal_contig_length_6 \
       draft_genome6.fasta minimal_contig_length_7 \
       reference_genome.fasta minimal_contig_length_8 blast_parameter \    | tee log_file.txt
``` 
EXAMPLE SCRIPT:
```
sh genome_comparison_7comps_with2Refs.sh \
        SS1_clado_contigs_metaMDGB.fasta 500000 \
        SS7_clado_contigs_metaMDGB.fasta 500000 \
        SS8_clado_contigs_metaMDGB.fasta 500000 \
        WT10_clado_contigs_metaMDGB.fasta 500000 \
        SS3_clado_contigs_metaMDGB.fasta 500000 \
        SS5_clado_contigs_metaMDGB.fasta 500000 \
        SS9_clado_contigs_metaMDGB.fasta 500000 \
        GCA_947184155.1_Cgoreaui_SCF055-01_genomic.fna 500000 5000 \    | tee log_file.txt
```       
<br>
<br>

## INPUT PARAMETERS ARE:<br>
draft_genome1.fasta 	= Your FIRST draft genome that you want to compare to a reference.<br>
minimal_contig_length_1	= Any sequences below this length threshold get excluded to make the BLAST run faster.<br>
<br>
draft_genome2.fasta		= Your 2nd draft genome that you want to compare to a reference.<br>
minimal_contig_length_2	= Any sequences below this length threshold get excluded to make the BLAST run faster.<br>
<br>
draft_genome3.fasta		= Your 3rd draft genome that you want to compare to a reference.<br>
minimal_contig_length_3	= Any sequences below this length threshold get excluded to make the BLAST run faster.<br>
<br>
draft_genome4.fasta		= Your 4th draft genome that you want to compare to a reference. This is also a blast referral genome, which sits in the middle of   the comparison and only acts as a blast databse, it does not get compared to any other genomes. <br>
minimal_contig_length_4	= Any sequences below this length threshold get excluded to make the BLAST run faster.<br>
<br>
draft_genome5.fasta		= Your 5th draft genome that you want to compare to a reference.<br>
minimal_contig_length_5	= Any sequences below this length threshold get excluded to make the BLAST run faster.<br>
<br>
draft_genome6.fasta		= Your 6th draft genome that you want to compare to a reference.<br>
minimal_contig_length_6	= Any sequences below this length threshold get excluded to make the BLAST run faster.<br>
<br>
draft_genome7.fasta		= Your 7th draft genome that you want to compare to a reference.<br>
minimal_contig_length_7	= Any sequences below this length threshold get excluded to make the BLAST run faster.<br>
<br>
reference_genome 		= All genomic scaffolds will be re-arranged according to this reference file.<br>
minimal_contig_length_8	= Any sequences below this length threshold get excluded to make the BLAST run faster.<br>
<br>
blast_parameter		= Word size blast parameter. Something between 2000 and 5000, higher requires more resources.<br>
LOGFILE (| tee log_file.txt) = add this to the end of the command, to automatically save a logfile in the current directory.<br>
<br>				 
<br>

## NOTES
### ADDITIONAL CONSIDERATIONS
All genome files need to be in the same directory. All software needs to be in your $PATH.<br>
If you download Artemis manually, add the Artemis executable to your $PATH with:<br>
```
export PATH=$PATH:/path/to/dir_from_artemis 
```
The script creates an own directory in which it runs all the analysis. The directory name is according to input data.<br>
All intermediate files are deleted at the end. If you like to keep them, just silence the respective code.<br>
<br>
Artemis Comparison Tool is started with the respective genome comparison at the end of the script automatically. You can modify the very last line to start different Artemis ACT comparisons.
<br>
If there is an error with the crunch comparison files, adjust the contig and blast thresholds to make it less computational intense.
<br>
<br>

## DEFINE INPUT PARAMETERS
THINGS TO ADJUST BEFORE RUNNING THE SCRIPT<br><br>
OUTPUT DIRECTORY NAME    # Change your output directory name in the line "## SET UP OUTPUT DIRECTORY"<br>
RAGTAG SETTINGS          # Available threads is currently set to 4<br>
BLAST SETTINGS           # Set the number of blast matches, keep at 5 for now to not make it overly complicated with the comparison<br>
```
OUTPUT_DIRECTORY="NEW_SCRIPT_TEST"
NUMBER_OF_CORES="4"
WORD_SIZE_RAGTAG="5000"
MAX_TARGET_SEQS="5"
```
<br>  

<p align="center">
  <img src="https://github.com/PatrickBuerger/ComparativeGenomics/blob/main/Artemis_example_output1.png" height="500" />
<br>Figure 2. Example output using Artemis for visualisaton (automatically generated).
</p>
