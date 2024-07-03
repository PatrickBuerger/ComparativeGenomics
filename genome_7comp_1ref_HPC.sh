#!/bin/bash

echo "####################################################################################"
echo "            ╔╦╗╔═╗╦═╗╦╔╗╔╔═╗  ╔═╗╔╦╗╦╔═╗╔═╗  ╦  ╔═╗╔╗      ╔═╗╔═╗╔╦╗                "
echo "            ║║║╠═╣╠╦╝║║║║║╣   ║ ║║║║║║  ╚═╗  ║  ╠═╣╠╩╗     ║  ║ ║║║║                "
echo "            ╩ ╩╩ ╩╩╚═╩╝╚╝╚═╝  ╚═╝╩ ╩╩╚═╝╚═╝  ╩═╝╩ ╩╚═╝  o  ╚═╝╚═╝╩ ╩                "
echo "####################################################################################"
echo " "
echo "####################################################################################"
echo "####################################################################################"
echo "#### GENOME STRUCTURAL COMPARISON SCRIPT ###########################################"
echo "####################################################################################"
echo "##                                                                                  "
echo "## Pat Buerger				                                          "
echo "## Email: patrick.buerger@mq.edu.au                                                 "
echo "##                                                                                  "
echo "####################################################################################"
echo " "
echo "## This is an comparative genomics bash script to visualise similarities between 7 genomes." 
echo "## The script can be used to: "
echo "##	- filter the input data (seqkit)"
echo "## 	- rearrange scaffolds according to a reference (ragtag)"
echo "## 	- find genomic similarities (blast)"
echo "##	- visualise genomic comparisons (artemis)"
echo " "
sleep 3


################################################################################
################################################################################
#### INSTALL REQUIRED SOFTWARE
################################################################################
################################################################################

#########################################
### ARTEMIS (for visualisation and genome broswing)
#########################################
## Install
# conda config --add channels bioconda   
# conda config --add channels conda-forge
# conda install artemis
##
## Launch with terminal
## act
## art
##
## Alternatively, you can get it directly from their from website:
## http://sanger-pathogens.github.io/Artemis/Artemis/
## https://www.sanger.ac.uk/tool/artemis-comparison-tool-act/
##

#########################################
### RAGTAG (for contig reordering)
#########################################
## Ragtag (for scaffold reordering according to reference)
# conda install -c bioconda ragtag

#########################################
### BLAST NCBI (for genome comparisons)
#########################################
# sudo apt-get install ncbi-blast+

################################################################################
#### Check Sequence length distribution and HISTOGRAM
################################################################################
# pip install bashplotlib
# conda install -c bioconda seqkit
# conda install -c bioconda csvtk
# from website: https://bioinf.shenwei.me/seqkit/download/





################################################################################
#### HOW TO LAUNCH SCRIPT IN YOUR TERMINAL
################################################################################
### USE Script in terminal like this:

## sh genome_comparison_7comps_with2Refs.sh \
##       draft_genome1.fasta minimal_contig_length_1 \
##       draft_genome2.fasta minimal_contig_length_2 \
##       draft_genome3.fasta minimal_contig_length_3 \
##       draft_genome4.fasta minimal_contig_length_4 \
##       draft_genome5.fasta minimal_contig_length_5 \
##       draft_genome6.fasta minimal_contig_length_6 \
##       draft_genome7.fasta minimal_contig_length_7 \
##       reference_genome.fasta minimal_contig_length_8 blast_parameter \    
##       output_directory_name \    | tee log_file.txt   
   
### EXAMPLE        
## sh genome_comparison_7comps_with2Refs.sh \
##        SS1_clado_contigs_metaMDGB.fasta 500000 \
##        SS7_clado_contigs_metaMDGB.fasta 500000 \
##        SS8_clado_contigs_metaMDGB.fasta 500000 \
##        WT10_clado_contigs_metaMDGB.fasta 500000 \
##        SS3_clado_contigs_metaMDGB.fasta 500000 \
##        SS5_clado_contigs_metaMDGB.fasta 500000 \
##        SS9_clado_contigs_metaMDGB.fasta 500000 \
##        GCA_947184155.1_Cgoreaui_SCF055-01_genomic.fna 500000 5000 \
##        comparison1 \    | tee log_file.txt          
       

### INPUT PARAMETERS ARE:
## draft_genome1.fasta 	= Your FIRST draft genome that you want to compare to a reference.
## minimal_contig_length_1	= Anything below this threshold gets excluded to make the BLAST run faster.

## draft_genome2.fasta		= Your SECOND draft genome that you want to compare to a reference.
## minimal_contig_length_2	= Anything below this threshold gets excluded to make the BLAST run faster.

## draft_genome3.fasta		= Your THIRD draft genome that you want to compare to a reference.
## minimal_contig_length_3	= Anything below this threshold gets excluded to make the BLAST run faster.

## draft_genome4.fasta		= Your FOURTH draft genome that you want to compare to a reference.
## minimal_contig_length_4	= Anything below this threshold gets excluded to make the BLAST run faster.

## draft_genome5.fasta		= Your FIFTH draft genome that you want to compare to a reference.
## minimal_contig_length_5	= Anything below this threshold gets excluded to make the BLAST run faster.

## draft_genome6.fasta		= Your SIXTH draft genome that you want to compare to a reference.
## minimal_contig_length_6	= Anything below this threshold gets excluded to make the BLAST run faster.

## draft_genome7.fasta		= Your 7th draft genome that you want to compare to a reference.
## minimal_contig_length_7	= Anything below this threshold gets excluded to make the BLAST run faster.

## reference_genome 		= All genomic scaffolds will be re-arranged according to this reference file.
## minimal_contig_length_8	= Anything below this threshold gets excluded to make the BLAST run faster.

## blast_parameter		= Word size blast parameter. Something between 2000 and 5000, higher requires more resources.

## output_directory_name	= any folder name [Genome_comparison_DIRECTORY_DATE_TIME], if blank, it will be automatically set to Genome_comparison_DATE_TIME

## LOGFILE (| tee log_file.txt) = add this to the end of the command, to automatically save a logfile in the current directory.
				 



################################################################################
################################################################################
#### NOTES
################################################################################
################################################################################

### ADDITIONAL CONSIDERATIONS
## All genome files need to be in the same directory. All software needs to be in your $PATH. 
## If you download Artemis manually, add the Artemis executable to your $PATH with:
## export PATH=$PATH:/path/to/dir_from_artemis 

## The script creates an own directory in which it runs all the analysis. The directory name is according to input data.
## All intermediate files are deleted at the end. If you like to keep them, just silence the respective code.

## Artemis Comparison Tool is started with the respective genome comparison at the end of the script automatically. You can modify the very last line to start different Artemis ACT comparisons.

## If there is an error with the crunch comparison files, adjust the contig and blast thresholds to make it less computational intense.



################################################################################
################################################################################
#### DEFINE INPUT PARAMETERS
################################################################################
################################################################################

### THINGS TO ADJUST BEFORE RUNNING THE SCRIPT
## OUTPUT DIRECTORY NAME    # Change your output directory name in the line "## SET UP OUTPUT DIRECTORY"
## RAGTAG SETTINGS          # Available threads is currently set to 4
## BLAST SETTINGS           # Set the number of blast matches, keep at 5 for now to not make it overly complicated with the comparison

NUMBER_OF_CORES="4"
WORD_SIZE_RAGTAG="5000"
MAX_TARGET_SEQS="5"



echo " "
echo "#################################################################################"
echo "#################################################################################"
echo "#### SCRIPT START"
echo "#################################################################################"
echo "#### SCRIPT START"
echo "#################################################################################"
echo "#### SCRIPT START"
echo "#################################################################################"
echo "#################################################################################"
echo " "
start=`date +%s`



######################################
## GET INPUT PARAMETERS
DRAFT1="$1"		    	# Draft genome #1
PARAMETER1="$2"	    	# Minimal contig length threshold for DRAFT1

DRAFT2="$3"			    # Draft genome #2
PARAMETER2="$4"		    # Minimal contig length threshold for DRAFT2

DRAFT3="$5"			    # Draft genome #3
PARAMETER3="$6"		    # Minimal contig length threshold for DRAFT3

DRAFT4="$7" 		    # Draft genome #4 (This is also a blast referral genome, which sits in the middle of the comparison and only acts as a blast databse, it does not get compared to any other genomes)
PARAMETER4="$8"		    # Minimal contig length threshold for DRAFT4

DRAFT5="$9"			    # Draft genome #5
PARAMETER5="${10}"		# Minimal contig length threshold for DRAFT5

DRAFT6="${11}"			# Draft genome #6
PARAMETER6="${12}"		# Minimal contig length threshold for DRAFT6

DRAFT7="${13}"			# Draft genome #7
PARAMETER7="${14}"		# Minimal contig length threshold for DRAFT7

REFERENCE_GENOME="${15}" 	# RagTag Reference genome
PARAMETER8="${16}"		# Minimal contig length threshold for RagTag REFERENCE_GENOME

PARAMETER9="${17}" 		# Blast word size

OUTPUT_DIRECTORY="${18}"	# Output directory name



######################################
## REPEAT INPUT PARAMETERS TO USER IN OUTPUT FILE
echo "########################################################################"
echo "REPEAT INPUT PARAMETERS TO USER IN OUTPUT FILE"
echo "REPEAT INPUT PARAMETERS TO USER IN OUTPUT FILE"
echo "REPEAT INPUT PARAMETERS TO USER IN OUTPUT FILE"
echo " "
echo "Draft genome 1 = "$DRAFT1""
echo "Sequence threshold = "$PARAMETER1""
echo " "
echo "Draft genome 2 = "$DRAFT2""
echo "Sequence threshold = "$PARAMETER2""
echo " "
echo "Draft genome 3 = "$DRAFT3""
echo "Sequence threshold = "$PARAMETER3""
echo " "
echo "Draft genome 4 (blast referral genome) = "$DRAFT4""
echo "Sequence threshold = "$PARAMETER4""
echo " "
echo "Draft genome 5 = "$DRAFT5""
echo "Sequence threshold = "$PARAMETER5""
echo " "
echo "Draft genome 6 = "$DRAFT6""
echo "Sequence threshold = "$PARAMETER6""
echo " "
echo "Draft genome 7 = "$DRAFT7""
echo "Sequence threshold = "$PARAMETER7""
echo " "
echo "RagTag REFERENCE GENOME = "$REFERENCE_GENOME""
echo "Sequence threshold = "$PARAMETER8""
echo " "
echo "Blast word size = "$PARAMETER9""
echo " "
echo " Output directory name is: "$OUTPUT_DIRECTORY""
echo "########################################################################"
echo " "
echo " "
echo " "


######################################
## SET UP OUTPUT DIRECTORY
CURRENTDATE=`date +"%Y%m%d_%H%M"`
mkdir -p ${OUTPUT_DIRECTORY}_${CURRENTDATE}
cd ${OUTPUT_DIRECTORY}_${CURRENTDATE}




################################################################################
################################################################################
#### START ADJUSTING FILES
################################################################################
################################################################################
echo "########################################################################"
echo " START START ADJUSTING CONTIG NUMBERS AND LENGTH "
echo " START START ADJUSTING CONTIG NUMBERS AND LENGTH "
echo " START START ADJUSTING CONTIG NUMBERS AND LENGTH "
echo " "
echo "Start removing sequences below "$PARAMETER1" bp length for "$DRAFT1""
## Code explainer: -m takes the sequnces ABOVE or matching to that threshold; -g is the input file
seqkit seq -m "$PARAMETER1" -g ../"$DRAFT1" > "$DRAFT1"
## Code explainer: -M takes the sequnces BELOW or matching to that threshold; -g is the input file; this prints a line for the logfile output
echo -n "Number of sequences removed below "$PARAMETER1" bp -> " && seqkit seq -M "$PARAMETER1" -g ../"$DRAFT1" | grep ">" | wc -l
echo " DONE "
echo " "

echo "Start removing sequences below "$PARAMETER2" bp length for "$DRAFT2""
seqkit seq -m "$PARAMETER2" -g ../"$DRAFT2" > "$DRAFT2"
echo -n "Number of sequences removed below "$PARAMETER2" bp -> " && seqkit seq -M "$PARAMETER2" -g ../"$DRAFT2" | grep ">" | wc -l
echo " DONE "
echo " "

echo "Start removing sequences below "$PARAMETER3" bp length for "$DRAFT3""
seqkit seq -m "$PARAMETER3" -g ../"$DRAFT3" > "$DRAFT3"
echo -n "Number of sequences removed below "$PARAMETER3" bp -> " && seqkit seq -M "$PARAMETER3" -g ../"$DRAFT3" | grep ">" | wc -l
echo " DONE "
echo " "

echo "Start removing sequences below "$PARAMETER4" bp length for "$DRAFT4""
seqkit seq -m "$PARAMETER4" -g ../"$DRAFT4" > "$DRAFT4"
echo -n "Number of sequences removed below "$PARAMETER4" bp -> " && seqkit seq -M "$PARAMETER4" -g ../"$DRAFT4" | grep ">" | wc -l
echo " DONE "
echo " "

echo "Start removing sequences below "$PARAMETER5" bp length for "$DRAFT5""
seqkit seq -m "$PARAMETER5" -g ../"$DRAFT5" > "$DRAFT5"
echo -n "Number of sequences removed below "$PARAMETER5" bp -> " && seqkit seq -M "$PARAMETER5" -g ../"$DRAFT5" | grep ">" | wc -l
echo " DONE "
echo " "

echo "Start removing sequences below "$PARAMETER6" bp length for "$DRAFT6""
seqkit seq -m "$PARAMETER6" -g ../"$DRAFT6" > "$DRAFT6"
echo -n "Number of sequences removed below "$PARAMETER6" bp -> " && seqkit seq -M "$PARAMETER6" -g ../"$DRAFT6" | grep ">" | wc -l
echo " DONE "
echo " "

echo "Start removing sequences below "$PARAMETER7" bp length for "$DRAFT7""
seqkit seq -m "$PARAMETER7" -g ../"$DRAFT7" > "$DRAFT7"
echo -n "Number of sequences removed below "$PARAMETER7" bp -> " && seqkit seq -M "$PARAMETER7" -g ../"$DRAFT7" | grep ">" | wc -l
echo " DONE "
echo " "

echo "Start removing sequences below "$PARAMETER8" bp length for "$REFERENCE_GENOME""
seqkit seq -m "$PARAMETER8" -g ../"$REFERENCE_GENOME" > "$REFERENCE_GENOME"
echo -n "Number of sequences removed below "$PARAMETER8" bp -> " && seqkit seq -M "$PARAMETER8" -g ../"$REFERENCE_GENOME" | grep ">" | wc -l
echo " DONE "
echo " "
echo " "
echo " "


################################################################################
################################################################################
#### PROVIDE STATISTICS FOR BEFORE AND AFTER REMOVAL
################################################################################
################################################################################
echo "########################################################################"
echo "PROVIDE STATISTICS FOR BEFORE AND AFTER REMOVAL"
echo "PROVIDE STATISTICS FOR BEFORE AND AFTER REMOVAL"
echo "PROVIDE STATISTICS FOR BEFORE AND AFTER REMOVAL"
echo " "
echo "############"
echo "NUMBER OF SEQUENCES IN FASTA FILES - BEFORE REMOVAL"
seqkit stats ../"$DRAFT1" ../"$DRAFT2" ../"$DRAFT3" ../"$DRAFT4" ../"$DRAFT5" ../"$DRAFT6" ../"$DRAFT7" ../"$REFERENCE_GENOME"
echo " "
echo " "

echo "############"
echo "NUMBER OF SEQUENCES IN FASTA FILES - AFTER REMOVAL"
seqkit stats ./"$DRAFT1" ./"$DRAFT2" ./"$DRAFT3" ./"$DRAFT4" ./"$DRAFT5" ./"$DRAFT6" ./"$DRAFT7" ./"$REFERENCE_GENOME"
echo " "
echo " "
echo " "
sleep 5


# OUTPUT IS TOO CLUTTERED ON HPC, THEREFOR CODE HAS BEEN SILENCED
################################################################################
################################################################################
#### HISTOGRAMS SHOWING SEQUENCE LENGTH DISTRIBUTION
################################################################################
################################################################################
#echo "##################################################################################"
#echo "#### HISTOGRAM SEQUENCE LENGTH; DRAFT 1: "$DRAFT1""
#echo "##################################################################################"
#echo "############################### HISTOGRAM **AFTER** SEQUENCE REMOVAL"
#seqkit fx2tab -n -l ./"$DRAFT1"  | cut -f2- | hist -b 100 -s 10 -x
#echo " "
#echo " "

#echo "##################################################################################"
#echo "#### HISTOGRAM SEQUENCE LENGTH; DRAFT 2: "$DRAFT2""
#echo "##################################################################################"
#echo "############################### HISTOGRAM **AFTER** SEQUENCE REMOVAL"
#seqkit fx2tab -n -l ./"$DRAFT2"  | cut -f2- | hist -b 100 -s 10 -x
#echo " "
#echo " "

#echo "##################################################################################"
#echo "#### HISTOGRAM SEQUENCE LENGTH; DRAFT 3: "$DRAFT3""
#echo "##################################################################################"
#echo "############################### HISTOGRAM **AFTER** SEQUENCE REMOVAL"
#seqkit fx2tab -n -l ./"$DRAFT3"  | cut -f2- | hist -b 100 -s 10 -x
#echo " "
#echo " "

#echo "##################################################################################"
#echo "#### HISTOGRAM SEQUENCE LENGTH; BLAST REFERENCE: "$DRAFT4""
#echo "##################################################################################"
#echo "############################### HISTOGRAM **AFTER** SEQUENCE REMOVAL"
#seqkit fx2tab -n -l ./"$DRAFT4"  | cut -f2- | hist -b 100 -s 10 -x
#echo " "
#echo " "

#echo "##################################################################################"
#echo "#### HISTOGRAM SEQUENCE LENGTH; DRAFT 5: "$DRAFT5""
#echo "##################################################################################"
#echo "############################### HISTOGRAM **AFTER** SEQUENCE REMOVAL"
#seqkit fx2tab -n -l ./"$DRAFT5"  | cut -f2- | hist -b 100 -s 10 -x
#echo " "
#echo " "
#echo " "

#echo "##################################################################################"
#echo "#### HISTOGRAM SEQUENCE LENGTH; DRAFT 6: "$DRAFT6""
#echo "##################################################################################"
#echo "############################### HISTOGRAM **AFTER** SEQUENCE REMOVAL"
#seqkit fx2tab -n -l ./"$DRAFT6"  | cut -f2- | hist -b 100 -s 10 -x
#echo " "
#echo " "
#echo " "

#echo "##################################################################################"
#echo "#### HISTOGRAM SEQUENCE LENGTH; DRAFT 7: "$DRAFT7""
#echo "##################################################################################"
#echo "############################### HISTOGRAM **AFTER** SEQUENCE REMOVAL"
#seqkit fx2tab -n -l ./"$DRAFT7"  | cut -f2- | hist -b 100 -s 10 -x
#echo " "
#echo " "
#echo " "

#echo "##################################################################################"
#echo "#### HISTOGRAM SEQUENCE LENGTH; RagTag Reference: "$REFERENCE_GENOME""
#echo "##################################################################################"
#echo "############################### HISTOGRAM **AFTER** SEQUENCE REMOVAL"
#seqkit fx2tab -n -l ./"$REFERENCE_GENOME"  | cut -f2- | hist -b 100 -s 10 -x
#echo " "
#echo " "
#echo " "
#sleep 3



################################################################################
################################################################################
#### RagTag Contig Reordering
################################################################################
################################################################################
echo "########################################################################"
echo "Start RagTag Re-ordering of Contigs "$DRAFT1""
echo "Start RagTag Re-ordering of Contigs "$DRAFT1""
echo "Start RagTag Re-ordering of Contigs "$DRAFT1""
echo " "
######################
## REORDER Draft 1
## Code exlainer: https://github.com/malonge/RagTag/wiki/scaffold
## scaffold: Scaffolding is the process of ordering and orienting draft assembly (query) sequences into longer sequences. 
## Gaps (stretches of "N" characters) are placed between adjacent query sequences to indicate the presence of unknown sequence. 
## RagTag uses whole-genome alignments to a reference assembly to scaffold query sequences. 
## RagTag does not alter input query sequence in any way and only orders and orients sequences, joining them with gaps.
## usage: ragtag.py scaffold -o <output_directory> <reference.fa> <query.fa>
##   -w                   overwrite intermediate files
##  -t INT               number of minimap2/unimap threads [1] ## INCREASE THIS VALUE IF YOU RUN OUT OF MEMORY!! MATCH IT TO YOUR NEEDS
##  -f INT               minimum unique alignment length [1000] ## COULD BE DECREASED FOR BETTER REARRANGEMENTS, NEEDS TO BE LONGER THAN MINIMAL SEQ LENGTH
##  -u                   add suffix to unplaced sequence headers
ragtag.py scaffold -o ./RagTag_"$DRAFT1" ./"$REFERENCE_GENOME" ./"$DRAFT1" -w -t "$NUMBER_OF_CORES" -f "$WORD_SIZE_RAGTAG" -u
echo " "
echo "END RagTag Re-ordering of Contigs "$DRAFT1""
echo " DONE "
echo " "
echo " "
echo " "

echo "########################################################################"
echo "Start RagTag Re-ordering of Contigs "$DRAFT2""
echo "Start RagTag Re-ordering of Contigs "$DRAFT2""
echo "Start RagTag Re-ordering of Contigs "$DRAFT2""
echo " "
######################
## REORDER Draft 2
ragtag.py scaffold -o ./RagTag_"$DRAFT2" ./"$REFERENCE_GENOME" ./"$DRAFT2" -w -t "$NUMBER_OF_CORES" -f "$WORD_SIZE_RAGTAG" -u
## Flags are:
## w = overwrite RagTag output files
## t = number of CPUs
## Word Size Parameter
echo " "
echo "END RagTag Re-ordering of Contigs "$DRAFT2""
echo " DONE "
echo " "
echo " "
echo " "

echo "########################################################################"
echo "Start RagTag Re-ordering of Contigs "$DRAFT3""
echo "Start RagTag Re-ordering of Contigs "$DRAFT3""
echo "Start RagTag Re-ordering of Contigs "$DRAFT3""
echo " "
######################
## REORDER Draft 2
ragtag.py scaffold -o ./RagTag_"$DRAFT3" ./"$REFERENCE_GENOME" ./"$DRAFT3" -w -t "$NUMBER_OF_CORES" -f "$WORD_SIZE_RAGTAG" -u
## Flags are:
## w = overwrite RagTag output files
## t = number of CPUs
## Word Size Parameter
echo " "
echo "END RagTag Re-ordering of Contigs "$DRAFT3""
echo " DONE "
echo " "
echo " "
echo " "

echo "########################################################################"
echo "Start RagTag Re-ordering of Contigs "$DRAFT4""
echo "Start RagTag Re-ordering of Contigs "$DRAFT4""
echo "Start RagTag Re-ordering of Contigs "$DRAFT4""
echo " "
######################
## REORDER Draft 2
ragtag.py scaffold -o ./RagTag_"$DRAFT4" ./"$REFERENCE_GENOME" ./"$DRAFT4" -w -t "$NUMBER_OF_CORES" -f "$WORD_SIZE_RAGTAG" -u
## Flags are:
## w = overwrite RagTag output files
## t = number of CPUs
## Word Size Parameter
echo " "
echo "END RagTag Re-ordering of Contigs "$DRAFT4""
echo " DONE "
echo " "
echo " "
echo " "

echo "########################################################################"
echo "Start RagTag Re-ordering of Contigs "$DRAFT5""
echo "Start RagTag Re-ordering of Contigs "$DRAFT5""
echo "Start RagTag Re-ordering of Contigs "$DRAFT5""
echo " "
######################
## REORDER Draft 2
ragtag.py scaffold -o ./RagTag_"$DRAFT5" ./"$REFERENCE_GENOME" ./"$DRAFT5" -w -t "$NUMBER_OF_CORES" -f "$WORD_SIZE_RAGTAG" -u
## Flags are:
## w = overwrite RagTag output files
## t = number of CPUs
## Word Size Parameter
echo " "
echo "END RagTag Re-ordering of Contigs "$DRAFT5""
echo " DONE "
echo " "
echo " "
echo " "

echo "########################################################################"
echo "Start RagTag Re-ordering of Contigs "$DRAFT6""
echo "Start RagTag Re-ordering of Contigs "$DRAFT6""
echo "Start RagTag Re-ordering of Contigs "$DRAFT6""
echo " "
######################
## REORDER Draft 2
ragtag.py scaffold -o ./RagTag_"$DRAFT6" ./"$REFERENCE_GENOME" ./"$DRAFT6" -w -t "$NUMBER_OF_CORES" -f "$WORD_SIZE_RAGTAG" -u
## Flags are:
## w = overwrite RagTag output files
## t = number of CPUs
## Word Size Parameter
echo " "
echo "END RagTag Re-ordering of Contigs "$DRAFT6""
echo " DONE "
echo " "
echo " "
echo " "

echo "########################################################################"
echo "Start RagTag Re-ordering of Contigs "$DRAFT7""
echo "Start RagTag Re-ordering of Contigs "$DRAFT7""
echo "Start RagTag Re-ordering of Contigs "$DRAFT7""
echo " "
######################
## REORDER Draft 2
ragtag.py scaffold -o ./RagTag_"$DRAFT7" ./"$REFERENCE_GENOME" ./"$DRAFT7" -w -t "$NUMBER_OF_CORES" -f "$WORD_SIZE_RAGTAG" -u
## Flags are:
## w = overwrite RagTag output files
## t = number of CPUs
## Word Size Parameter
echo " "
echo "END RagTag Re-ordering of Contigs "$DRAFT7""
echo " DONE "
echo " "
echo " "
echo " "




################################################################################
################################################################################
#### MERGE SEQUENCES INTO one big contig (required for Artemis visualisation)
################################################################################
################################################################################
echo "########################################################################"
echo "START Merging Sequences"
echo "START Merging Sequences"
echo "START Merging Sequences"
echo " "

######################
## MAKE SINGLE SEQUENCE FASTA FILE FOR COMPARISON OF DRAFT GENOME (required for proper display in ACT)
## Code explainer: Take the Draft_genome1, use sed to keep only the first line with >, then use sed to concatenate all lines together, then write it as an output.
cat ./RagTag_"$DRAFT1"/ragtag.scaffold.fasta | sed -e '1!{/^>.*/d;}' | sed ':a;N;$!ba;s/\n//2g' > ./SingleSeq_RagTag_"$DRAFT1"
echo "1/7 done: "$DRAFT1":"
echo -n "Sequences in merged file (If displayed value is 1 then OK) -> " && grep ">" ./SingleSeq_RagTag_"$DRAFT1" | wc -l
echo " "

######################
## MAKE SINGLE SEQUENCE FASTA FILE FOR COMPARISON OF DRAFT GENOME (required for proper display in ACT)
cat ./RagTag_"$DRAFT2"/ragtag.scaffold.fasta | sed -e '1!{/^>.*/d;}' | sed ':a;N;$!ba;s/\n//2g' > ./SingleSeq_RagTag_"$DRAFT2"
echo "2/7 done: "$DRAFT2":"
echo -n "Sequences in merged file (If displayed value is 1 then OK) -> " && grep ">" ./SingleSeq_RagTag_"$DRAFT2" | wc -l
echo " "

######################
## MAKE SINGLE SEQUENCE FASTA FILE FOR COMPARISON OF DRAFT GENOME (required for proper display in ACT)
cat ./RagTag_"$DRAFT3"/ragtag.scaffold.fasta | sed -e '1!{/^>.*/d;}' | sed ':a;N;$!ba;s/\n//2g' > ./SingleSeq_RagTag_"$DRAFT3"
echo "3/7 done: "$DRAFT3":"
echo -n "Sequences in merged file (If displayed value is 1 then OK) -> " && grep ">" ./SingleSeq_RagTag_"$DRAFT3" | wc -l
echo " "

######################
## MAKE SINGLE SEQUENCE FASTA FILE FOR COMPARISON OF REFERENCE GENOME (required for proper display in ACT)
cat ./RagTag_"$DRAFT4"/ragtag.scaffold.fasta | sed -e '1!{/^>.*/d;}' | sed ':a;N;$!ba;s/\n//2g' > ./SingleSeq_RagTag_"$DRAFT4"
echo "4/7 done "$DRAFT4":"
echo -n "Sequences in merged file (If displayed value is 1 then OK) -> " && grep ">" ./SingleSeq_RagTag_"$DRAFT4" | wc -l
echo " "

######################
## MAKE SINGLE SEQUENCE FASTA FILE FOR COMPARISON OF DRAFT GENOME (required for proper display in ACT)
cat ./RagTag_"$DRAFT5"/ragtag.scaffold.fasta | sed -e '1!{/^>.*/d;}' | sed ':a;N;$!ba;s/\n//2g' > ./SingleSeq_RagTag_"$DRAFT5"
echo "5/7 done "$DRAFT5":"
echo -n "Sequences in merged file (If displayed value is 1 then OK) -> " && grep ">" ./SingleSeq_RagTag_"$DRAFT5" | wc -l 
echo " "

######################
## MAKE SINGLE SEQUENCE FASTA FILE FOR COMPARISON OF DRAFT GENOME (required for proper display in ACT)
cat ./RagTag_"$DRAFT6"/ragtag.scaffold.fasta | sed -e '1!{/^>.*/d;}' | sed ':a;N;$!ba;s/\n//2g' > ./SingleSeq_RagTag_"$DRAFT6"
echo "6/7 done "$DRAFT6":"
echo -n "Sequences in merged file (If displayed value is 1 then OK) -> " && grep ">" ./SingleSeq_RagTag_"$DRAFT6" | wc -l 
echo " "

######################
## MAKE SINGLE SEQUENCE FASTA FILE FOR COMPARISON OF DRAFT GENOME (required for proper display in ACT)
cat ./RagTag_"$DRAFT7"/ragtag.scaffold.fasta | sed -e '1!{/^>.*/d;}' | sed ':a;N;$!ba;s/\n//2g' > ./SingleSeq_RagTag_"$DRAFT7"
echo "7/7 done: "$DRAFT7":"
echo -n "Sequences in merged file (If displayed value is 1 then OK) -> " && grep ">" ./SingleSeq_RagTag_"$DRAFT7" | wc -l

echo " "
echo "END Merge Sequences"
echo " "
echo " "
echo " "



echo " "
echo "########################################################################"
echo "####### RUNTIME"
echo "########################################################################"
echo " "
echo "RUNTIME till here: $((($(date +%s)-$start)/60)) minutes"
echo "########################################################################"
echo " "
echo " "
echo " "
echo " "



################################################################################
################################################################################
#### MAKE BLAST Database
################################################################################
################################################################################
echo "########################################################################"
echo "START Make Blast DB"
echo "START Make Blast DB"
echo "START Make Blast DB"

######################
## MAKE BLAST DATABASE
makeblastdb -in ./SingleSeq_RagTag_"$DRAFT2" -dbtype nucl 
echo " "
makeblastdb -in ./SingleSeq_RagTag_"$DRAFT3" -dbtype nucl 
echo " "
makeblastdb -in ./SingleSeq_RagTag_"$DRAFT4" -dbtype nucl 
echo " "
makeblastdb -in ./SingleSeq_RagTag_"$DRAFT5" -dbtype nucl 
echo " "
makeblastdb -in ./SingleSeq_RagTag_"$DRAFT6" -dbtype nucl 

echo " "
echo "END Make Blast DB"
echo " "
echo " "
echo " "





################################################################################
################################################################################
#### START BLAST COMPARISON
################################################################################
################################################################################
echo "########################################################################"
echo "START Blast Comparison"
echo "START Blast Comparison"
echo "START Blast Comparison"
echo " "

######################
## COMPARE GENOMES WITH BLAST
echo "# BLAST 1/6 RagTag "$DRAFT1""
blastn -query ./SingleSeq_RagTag_"$DRAFT1" -db ./SingleSeq_RagTag_"$DRAFT2" -max_target_seqs "$MAX_TARGET_SEQS" -evalue 1 -task megablast -word_size "$PARAMETER9" -num_threads "$NUMBER_OF_CORES" -outfmt 6 > ./1_RagTag_"$DRAFT1"_vs_"$DRAFT2"_"$PARAMETER9"_fmt6.crunch
echo -n "Number of blast hits found -> " && cat ./1_RagTag_"$DRAFT1"_vs_"$DRAFT2"_"$PARAMETER9"_fmt6.crunch | wc -l
echo "OUTPUT: 1_RagTag_"$DRAFT1"_vs_"$DRAFT2"_"$PARAMETER9"_fmt6.crunch"
echo " "

######################
## COMPARE GENOMES WITH BLAST
echo "# BLAST 2/6 RagTag "$DRAFT2""
blastn -query ./SingleSeq_RagTag_"$DRAFT2" -db ./SingleSeq_RagTag_"$DRAFT3" -max_target_seqs "$MAX_TARGET_SEQS" -evalue 1 -task megablast -word_size "$PARAMETER9" -num_threads "$NUMBER_OF_CORES" -outfmt 6 > ./2_RagTag_"$DRAFT2"_vs_"$DRAFT3"_"$PARAMETER9"_fmt6.crunch
echo -n "Number of blast hits found -> " && cat ./2_RagTag_"$DRAFT2"_vs_"$DRAFT3"_"$PARAMETER9"_fmt6.crunch | wc -l
echo "OUTPUT: 2_RagTag_"$DRAFT2"_vs_"$DRAFT3"_"$PARAMETER9"_fmt6.crunch"
echo " "

######################
## COMPARE GENOMES WITH BLAST
echo "# BLAST 3/6 RagTag "$DRAFT3""
blastn -query ./SingleSeq_RagTag_"$DRAFT3" -db ./SingleSeq_RagTag_"$DRAFT4" -max_target_seqs "$MAX_TARGET_SEQS" -evalue 1 -task megablast -word_size "$PARAMETER9" -num_threads "$NUMBER_OF_CORES" -outfmt 6 > ./3_RagTag_"$DRAFT3"_vs_"$DRAFT4"_"$PARAMETER9"_fmt6.crunch
echo -n "Number of blast hits found -> " && cat ./3_RagTag_"$DRAFT3"_vs_"$DRAFT4"_"$PARAMETER9"_fmt6.crunch | wc -l
echo "OUTPUT: 3_RagTag_"$DRAFT3"_vs_"$DRAFT4"_"$PARAMETER9"_fmt6.crunch"
echo " "

######################
## COMPARE GENOMES WITH BLAST
echo "# BLAST 4/6 RagTag "$DRAFT5""
blastn -query ./SingleSeq_RagTag_"$DRAFT5" -db ./SingleSeq_RagTag_"$DRAFT4" -max_target_seqs "$MAX_TARGET_SEQS" -evalue 1 -task megablast -word_size "$PARAMETER9" -num_threads "$NUMBER_OF_CORES" -outfmt 6 > ./4_RagTag_"$DRAFT5"_vs_"$DRAFT4"_"$PARAMETER9"_fmt6.crunch
echo -n "Number of blast hits found -> " && cat ./4_RagTag_"$DRAFT5"_vs_"$DRAFT4"_"$PARAMETER9"_fmt6.crunch | wc -l
echo "OUTPUT: 4_RagTag_"$DRAFT5"_vs_"$DRAFT4"_"$PARAMETER9"_fmt6.crunch"
echo " "

######################
## COMPARE GENOMES WITH BLAST
echo "# BLAST 5/6 RagTag "$DRAFT6""
blastn -query ./SingleSeq_RagTag_"$DRAFT6" -db ./SingleSeq_RagTag_"$DRAFT5" -max_target_seqs "$MAX_TARGET_SEQS" -evalue 1 -task megablast -word_size "$PARAMETER9" -num_threads "$NUMBER_OF_CORES" -outfmt 6 > ./5_RagTag_"$DRAFT6"_vs_"$DRAFT5"_"$PARAMETER9"_fmt6.crunch
echo -n "Number of blast hits found -> " && cat ./5_RagTag_"$DRAFT6"_vs_"$DRAFT5"_"$PARAMETER9"_fmt6.crunch | wc -l
echo "OUTPUT: 5_RagTag_"$DRAFT6"_vs_"$DRAFT5"_"$PARAMETER9"_fmt6.crunch"
echo " "

######################
## COMPARE GENOMES WITH BLAST
echo "# BLAST 6/6 RagTag "$DRAFT7""
blastn -query ./SingleSeq_RagTag_"$DRAFT7" -db ./SingleSeq_RagTag_"$DRAFT6" -max_target_seqs "$MAX_TARGET_SEQS" -evalue 1 -task megablast -word_size "$PARAMETER9" -num_threads "$NUMBER_OF_CORES" -outfmt 6 > ./6_RagTag_"$DRAFT7"_vs_"$DRAFT6"_"$PARAMETER9"_fmt6.crunch
echo -n "Number of blast hits found -> " && cat ./6_RagTag_"$DRAFT7"_vs_"$DRAFT6"_"$PARAMETER9"_fmt6.crunch | wc -l
echo "OUTPUT: 6_RagTag_"$DRAFT7"_vs_"$DRAFT6"_"$PARAMETER9"_fmt6.crunch"

echo " "
echo "END Blast Comparison"
echo " "
echo " "




################################################################################
################################################################################
# Make GFF File Draft_1 RagTag
################################################################################
################################################################################
echo "########################################################################"
echo "GFF FILES"
echo "########################################################################"
echo " "
echo "Make GFF File "$DRAFT1""

### EXTRACT SEQUENCE NAMES AND RESPECTIVE LENGTH
## Code explainer: use sed to replace spaces with underscores | use seqkit to fasta file to tabular format | use cut to remove the first column | and then print only the header (first line)
## Code explainer: use sed to replace spaces with underscores | use seqkit to fasta file to tabular format | use awk to calculate the cumulative sum of the sequence lengths starting from the second line and prints the sum | write output to sequence length file
sed 's/ /_/g' ./RagTag_"$DRAFT1"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | cut -f2- | head -n 1 > seqlength_end_"$DRAFT1"
sed 's/ /_/g' ./RagTag_"$DRAFT1"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{sum+=$2} NR>1{print sum}' >> seqlength_end_"$DRAFT1"

## Take the header by removing the last line of the file | number lines and save output | do some more reformatting
sed '$d' seqlength_end_"$DRAFT1" | awk -v s=1 '{print $1+s}' > seqlength_start3_"$DRAFT1"
echo "1" > seqlength_start2_"$DRAFT1"
cat seqlength_start2_"$DRAFT1" seqlength_start3_"$DRAFT1" >  seqlength_start_"$DRAFT1"
paste -d"\t" seqlength_start_"$DRAFT1" seqlength_end_"$DRAFT1" > seqlength_"$DRAFT1"

## -F sets input to tab; -vOFS sets output to tab; some reformatting for the GFF file by adding the character string to the first field and then to the 6th field of the file.
awk -F'\t' -vOFS='\t' '{ $1="gff_seqname	artemis	fasta_record	" $1 "" }1' < seqlength_"$DRAFT1" > GFF2_"$DRAFT1"
awk -F'\t' -vOFS='\t' '{ $6=".	+	.	ID=PLACEHOLDER;colour=10;label=PLACEHOLDER;note=PLACEHOLDER" $6 "" }1' < GFF2_"$DRAFT1" > GFF_"$DRAFT1"

## GENERATE FILE WITH SEQUENCE NAMES: use sed to replace spaces with underscores | use seqkit to fasta file to tabular format | use awk to print sequence names to file
sed 's/ /_/g' ./RagTag_"$DRAFT1"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{ print $1 }' > seqlength_names_"$DRAFT1"

## GENERATE MORE LINE IN THE FORMAT OF GFF 
awk -F'\t' '{$2=";colour=10;label="$1}1' < seqlength_names_"$DRAFT1" > seqlength_names2_"$DRAFT1"
awk -F'\t' -vOFS='\t' '{$1="	.	+	.	ID=" $1 ";note="}1' < seqlength_names2_"$DRAFT1" > seqlength_names3_"$DRAFT1"

paste -d" " seqlength_names3_"$DRAFT1" seqlength_names_"$DRAFT1" | sed 's/ //g' > GFF3_"$DRAFT1"

paste -d" " GFF2_"$DRAFT1" GFF3_"$DRAFT1" | awk '/colour=10/{c++;if(c==2){sub("colour=10","colour=11");c=0}}1' | sed 's/ //g' > "$DRAFT1"2.gff

echo "##FASTA" > Fastadummy
cat Fastadummy SingleSeq_RagTag_"$DRAFT1" | sed 's/ /_/g' > TEST_SingleSeq_RagTag_"$DRAFT1" 
cat "$DRAFT1"2.gff TEST_SingleSeq_RagTag_"$DRAFT1" > 1_RagTag_"$DRAFT1".gff

rm seqlength_*
rm GFF*
rm *2.gff
rm Fastadummy
rm TEST_SingleSeq_RagTag_"$DRAFT1"
rm SingleSeq_RagTag_"$DRAFT1"

echo "DONE"
echo " "



################################################################################
################################################################################
##### Make GFF File Draft_2 RagTag
################################################################################
################################################################################
echo "Make GFF File "$DRAFT2""

sed 's/ /_/g' ./RagTag_"$DRAFT2"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | cut -f2- | head -n 1 > seqlength_end_"$DRAFT2"
sed 's/ /_/g' ./RagTag_"$DRAFT2"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{sum+=$2} NR>1{print sum}' >> seqlength_end_"$DRAFT2"

sed '$d' seqlength_end_"$DRAFT2" | awk -v s=1 '{print $1+s}' > seqlength_start3_"$DRAFT2"
echo "1" > seqlength_start2_"$DRAFT2"
cat seqlength_start2_"$DRAFT2" seqlength_start3_"$DRAFT2" >  seqlength_start_"$DRAFT2"

paste -d"\t" seqlength_start_"$DRAFT2" seqlength_end_"$DRAFT2" > seqlength_"$DRAFT2"

awk -F'\t' -vOFS='\t' '{ $1="gff_seqname	artemis	fasta_record	" $1 "" }1' < seqlength_"$DRAFT2" > GFF2_"$DRAFT2"
awk -F'\t' -vOFS='\t' '{ $6=".	+	.	ID=PLACEHOLDER;colour=10;label=PLACEHOLDER;note=PLACEHOLDER" $6 "" }1' < GFF2_"$DRAFT2" > GFF_"$DRAFT2"

sed 's/ /_/g' ./RagTag_"$DRAFT2"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{ print $1 }' > seqlength_names_"$DRAFT2"

awk -F'\t' '{$2=";colour=10;label="$1}1' < seqlength_names_"$DRAFT2" > seqlength_names2_"$DRAFT2"
awk -F'\t' -vOFS='\t' '{$1="	.	+	.	ID=" $1 ";note="}1' < seqlength_names2_"$DRAFT2" > seqlength_names3_"$DRAFT2"

paste -d" " seqlength_names3_"$DRAFT2" seqlength_names_"$DRAFT2" | sed 's/ //g' > GFF3_"$DRAFT2"

paste -d" " GFF2_"$DRAFT2" GFF3_"$DRAFT2" | awk '/colour=10/{c++;if(c==2){sub("colour=10","colour=11");c=0}}1' | sed 's/ //g' > "$DRAFT2"2.gff

echo "##FASTA" > Fastadummy
cat Fastadummy SingleSeq_RagTag_"$DRAFT2" | sed 's/ /_/g' > TEST_SingleSeq_RagTag_"$DRAFT2" 
cat "$DRAFT2"2.gff TEST_SingleSeq_RagTag_"$DRAFT2" > 2_RagTag_"$DRAFT2".gff

rm seqlength_*
rm GFF*
rm *2.gff
rm Fastadummy
rm TEST_SingleSeq_RagTag_"$DRAFT2"
rm SingleSeq_RagTag_"$DRAFT2"

echo "DONE"
echo " "



################################################################################
################################################################################
##### Make GFF File Draft_3 RagTag
################################################################################
################################################################################
echo "Make GFF File "$DRAFT3""

sed 's/ /_/g' ./RagTag_"$DRAFT3"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | cut -f2- | head -n 1 > seqlength_end_"$DRAFT3"
sed 's/ /_/g' ./RagTag_"$DRAFT3"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{sum+=$2} NR>1{print sum}' >> seqlength_end_"$DRAFT3"

sed '$d' seqlength_end_"$DRAFT3" | awk -v s=1 '{print $1+s}' > seqlength_start3_"$DRAFT3"
echo "1" > seqlength_start2_"$DRAFT3"
cat seqlength_start2_"$DRAFT3" seqlength_start3_"$DRAFT3" >  seqlength_start_"$DRAFT3"

paste -d"\t" seqlength_start_"$DRAFT3" seqlength_end_"$DRAFT3" > seqlength_"$DRAFT3"

awk -F'\t' -vOFS='\t' '{ $1="gff_seqname	artemis	fasta_record	" $1 "" }1' < seqlength_"$DRAFT3" > GFF2_"$DRAFT3"
awk -F'\t' -vOFS='\t' '{ $6=".	+	.	ID=PLACEHOLDER;colour=10;label=PLACEHOLDER;note=PLACEHOLDER" $6 "" }1' < GFF2_"$DRAFT3" > GFF_"$DRAFT3"

sed 's/ /_/g' ./RagTag_"$DRAFT3"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{ print $1 }' > seqlength_names_"$DRAFT3"

awk -F'\t' '{$2=";colour=10;label="$1}1' < seqlength_names_"$DRAFT3" > seqlength_names2_"$DRAFT3"
awk -F'\t' -vOFS='\t' '{$1="	.	+	.	ID=" $1 ";note="}1' < seqlength_names2_"$DRAFT3" > seqlength_names3_"$DRAFT3"

paste -d" " seqlength_names3_"$DRAFT3" seqlength_names_"$DRAFT3" | sed 's/ //g' > GFF3_"$DRAFT3"

paste -d" " GFF2_"$DRAFT3" GFF3_"$DRAFT3" | awk '/colour=10/{c++;if(c==2){sub("colour=10","colour=11");c=0}}1' | sed 's/ //g' > "$DRAFT3"2.gff

echo "##FASTA" > Fastadummy
cat Fastadummy SingleSeq_RagTag_"$DRAFT3" | sed 's/ /_/g' > TEST_SingleSeq_RagTag_"$DRAFT3" 
cat "$DRAFT3"2.gff TEST_SingleSeq_RagTag_"$DRAFT3" > 3_RagTag_"$DRAFT3".gff

rm seqlength_*
rm GFF*
rm *2.gff
rm Fastadummy
rm TEST_SingleSeq_RagTag_"$DRAFT3"
rm SingleSeq_RagTag_"$DRAFT3"

echo "DONE"
echo " "





################################################################################
################################################################################
# Make GFF File Reference UNORDERED | NO RAGTAG
################################################################################
################################################################################
echo "Make GFF File "$DRAFT4""

### EXTRACT SEQUENCE NAMES AND RESPECTIVE LENGTH
sed 's/ /_/g' ./RagTag_"$DRAFT4"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | cut -f2- | head -n 1 > seqlength_end_"$DRAFT4"
sed 's/ /_/g' ./RagTag_"$DRAFT4"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{sum+=$2} NR>1{print sum}' >> seqlength_end_"$DRAFT4"

sed '$d' seqlength_end_"$DRAFT4" | awk -v s=1 '{print $1+s}' > seqlength_start3_"$DRAFT4"
echo "1" > seqlength_start2_"$DRAFT4"
cat seqlength_start2_"$DRAFT4" seqlength_start3_"$DRAFT4" >  seqlength_start_"$DRAFT4"

paste -d"\t" seqlength_start_"$DRAFT4" seqlength_end_"$DRAFT4" > seqlength_"$DRAFT4"

awk -F'\t' -vOFS='\t' '{ $1="gff_seqname	artemis	fasta_record	" $1 "" }1' < seqlength_"$DRAFT4" > GFF2_"$DRAFT4"
awk -F'\t' -vOFS='\t' '{ $6=".	+	.	ID=PLACEHOLDER;colour=10;label=PLACEHOLDER;note=PLACEHOLDER" $6 "" }1' < GFF2_"$DRAFT4" > GFF_"$DRAFT4"

sed 's/ /_/g'  ./RagTag_"$DRAFT4"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{ print $1 }' > seqlength_names_"$DRAFT4"

awk -F'\t' '{$2=";colour=10;label="$1}1' < seqlength_names_"$DRAFT4" > seqlength_names2_"$DRAFT4"
awk -F'\t' -vOFS='\t' '{$1="	.	+	.	ID=" $1 ";note="}1' < seqlength_names2_"$DRAFT4" > seqlength_names3_"$DRAFT4"

paste -d" " seqlength_names3_"$DRAFT4" seqlength_names_"$DRAFT4" | sed 's/ //g' > GFF3_"$DRAFT4"

paste -d" " GFF2_"$DRAFT4" GFF3_"$DRAFT4" | awk '/colour=10/{c++;if(c==2){sub("colour=10","colour=11");c=0}}1' | sed 's/ //g' > "$DRAFT4"2.gff

echo "##FASTA" > Fastadummy
cat Fastadummy SingleSeq_RagTag_"$DRAFT4" | sed 's/ /_/g' > TEST_SingleSeq_RagTag_"$DRAFT4" 
cat "$DRAFT4"2.gff TEST_SingleSeq_RagTag_"$DRAFT4" > 4_RagTag_"$DRAFT4".gff

rm seqlength_*
rm GFF*
rm *2.gff
rm Fastadummy
rm TEST_SingleSeq_RagTag_"$DRAFT4"
rm SingleSeq_RagTag_"$DRAFT4"

echo "DONE"
echo " "




################################################################################
################################################################################
# Make GFF File Draft_5 RagTag
################################################################################
################################################################################
echo "Make GFF File "$DRAFT5""

### EXTRACT SEQUENCE NAMES AND RESPECTIVE LENGTH
sed 's/ /_/g' ./RagTag_"$DRAFT5"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | cut -f2- | head -n 1 > seqlength_end_"$DRAFT5"
sed 's/ /_/g' ./RagTag_"$DRAFT5"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{sum+=$2} NR>1{print sum}' >> seqlength_end_"$DRAFT5"

sed '$d' seqlength_end_"$DRAFT5" | awk -v s=1 '{print $1+s}' > seqlength_start3_"$DRAFT5"
echo "1" > seqlength_start2_"$DRAFT5"
cat seqlength_start2_"$DRAFT5" seqlength_start3_"$DRAFT5" >  seqlength_start_"$DRAFT5"

paste -d"\t" seqlength_start_"$DRAFT5" seqlength_end_"$DRAFT5" > seqlength_"$DRAFT5"

awk -F'\t' -vOFS='\t' '{ $1="gff_seqname	artemis	fasta_record	" $1 "" }1' < seqlength_"$DRAFT5" > GFF2_"$DRAFT5"
awk -F'\t' -vOFS='\t' '{ $6=".	+	.	ID=PLACEHOLDER;colour=10;label=PLACEHOLDER;note=PLACEHOLDER" $6 "" }1' < GFF2_"$DRAFT5" > GFF_"$DRAFT5"

sed 's/ /_/g' ./RagTag_"$DRAFT5"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{ print $1 }' > seqlength_names_"$DRAFT5"

awk -F'\t' '{$2=";colour=10;label="$1}1' < seqlength_names_"$DRAFT5" > seqlength_names2_"$DRAFT5"
awk -F'\t' -vOFS='\t' '{$1="	.	+	.	ID=" $1 ";note="}1' < seqlength_names2_"$DRAFT5" > seqlength_names3_"$DRAFT5"

paste -d" " seqlength_names3_"$DRAFT5" seqlength_names_"$DRAFT5" | sed 's/ //g' > GFF3_"$DRAFT5"

paste -d" " GFF2_"$DRAFT5" GFF3_"$DRAFT5" | awk '/colour=10/{c++;if(c==2){sub("colour=10","colour=11");c=0}}1' | sed 's/ //g' > "$DRAFT5"2.gff

echo "##FASTA" > Fastadummy
cat Fastadummy SingleSeq_RagTag_"$DRAFT5" | sed 's/ /_/g' > TEST_SingleSeq_RagTag_"$DRAFT5" 
cat "$DRAFT5"2.gff TEST_SingleSeq_RagTag_"$DRAFT5" > 5_RagTag_"$DRAFT5".gff

rm seqlength_*
rm GFF*
rm *2.gff
rm Fastadummy
rm TEST_SingleSeq_RagTag_"$DRAFT5"
rm SingleSeq_RagTag_"$DRAFT5"

echo "DONE"
echo " "



################################################################################
################################################################################
# Make GFF File Draft_6 RagTag
################################################################################
################################################################################
echo "Make GFF File "$DRAFT6""

### EXTRACT SEQUENCE NAMES AND RESPECTIVE LENGTH
sed 's/ /_/g' ./RagTag_"$DRAFT6"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | cut -f2- | head -n 1 > seqlength_end_"$DRAFT6"
sed 's/ /_/g' ./RagTag_"$DRAFT6"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{sum+=$2} NR>1{print sum}' >> seqlength_end_"$DRAFT6"

sed '$d' seqlength_end_"$DRAFT6" | awk -v s=1 '{print $1+s}' > seqlength_start3_"$DRAFT6"
echo "1" > seqlength_start2_"$DRAFT6"
cat seqlength_start2_"$DRAFT6" seqlength_start3_"$DRAFT6" >  seqlength_start_"$DRAFT6"

paste -d"\t" seqlength_start_"$DRAFT6" seqlength_end_"$DRAFT6" > seqlength_"$DRAFT6"

awk -F'\t' -vOFS='\t' '{ $1="gff_seqname	artemis	fasta_record	" $1 "" }1' < seqlength_"$DRAFT6" > GFF2_"$DRAFT6"
awk -F'\t' -vOFS='\t' '{ $6=".	+	.	ID=PLACEHOLDER;colour=10;label=PLACEHOLDER;note=PLACEHOLDER" $6 "" }1' < GFF2_"$DRAFT6" > GFF_"$DRAFT6"

sed 's/ /_/g' ./RagTag_"$DRAFT6"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{ print $1 }' > seqlength_names_"$DRAFT6"

awk -F'\t' '{$2=";colour=10;label="$1}1' < seqlength_names_"$DRAFT6" > seqlength_names2_"$DRAFT6"
awk -F'\t' -vOFS='\t' '{$1="	.	+	.	ID=" $1 ";note="}1' < seqlength_names2_"$DRAFT6" > seqlength_names3_"$DRAFT6"

paste -d" " seqlength_names3_"$DRAFT6" seqlength_names_"$DRAFT6" | sed 's/ //g' > GFF3_"$DRAFT6"

paste -d" " GFF2_"$DRAFT6" GFF3_"$DRAFT6" | awk '/colour=10/{c++;if(c==2){sub("colour=10","colour=11");c=0}}1' | sed 's/ //g' > "$DRAFT6"2.gff

echo "##FASTA" > Fastadummy
cat Fastadummy SingleSeq_RagTag_"$DRAFT6" | sed 's/ /_/g' > TEST_SingleSeq_RagTag_"$DRAFT6" 
cat "$DRAFT6"2.gff TEST_SingleSeq_RagTag_"$DRAFT6" > 6_RagTag_"$DRAFT6".gff

rm seqlength_*
rm GFF*
rm *2.gff
rm Fastadummy
rm TEST_SingleSeq_RagTag_"$DRAFT6"
rm SingleSeq_RagTag_"$DRAFT6"

echo "DONE"
echo " "




################################################################################
################################################################################
# Make GFF File Draft_7 RagTag
################################################################################
################################################################################
echo "Make GFF File "$DRAFT7""

### EXTRACT SEQUENCE NAMES AND RESPECTIVE LENGTH
sed 's/ /_/g' ./RagTag_"$DRAFT7"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | cut -f2- | head -n 1 > seqlength_end_"$DRAFT7"
sed 's/ /_/g' ./RagTag_"$DRAFT7"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{sum+=$2} NR>1{print sum}' >> seqlength_end_"$DRAFT7"

sed '$d' seqlength_end_"$DRAFT7" | awk -v s=1 '{print $1+s}' > seqlength_start3_"$DRAFT7"
echo "1" > seqlength_start2_"$DRAFT7"
cat seqlength_start2_"$DRAFT7" seqlength_start3_"$DRAFT7" >  seqlength_start_"$DRAFT7"

paste -d"\t" seqlength_start_"$DRAFT7" seqlength_end_"$DRAFT7" > seqlength_"$DRAFT7"

awk -F'\t' -vOFS='\t' '{ $1="gff_seqname	artemis	fasta_record	" $1 "" }1' < seqlength_"$DRAFT7" > GFF2_"$DRAFT7"
awk -F'\t' -vOFS='\t' '{ $6=".	+	.	ID=PLACEHOLDER;colour=10;label=PLACEHOLDER;note=PLACEHOLDER" $6 "" }1' < GFF2_"$DRAFT7" > GFF_"$DRAFT7"

sed 's/ /_/g' ./RagTag_"$DRAFT7"/ragtag.scaffold.fasta | seqkit fx2tab -n -l | awk '{ print $1 }' > seqlength_names_"$DRAFT7"

awk -F'\t' '{$2=";colour=10;label="$1}1' < seqlength_names_"$DRAFT7" > seqlength_names2_"$DRAFT7"
awk -F'\t' -vOFS='\t' '{$1="	.	+	.	ID=" $1 ";note="}1' < seqlength_names2_"$DRAFT7" > seqlength_names3_"$DRAFT7"

paste -d" " seqlength_names3_"$DRAFT7" seqlength_names_"$DRAFT7" | sed 's/ //g' > GFF3_"$DRAFT7"

paste -d" " GFF2_"$DRAFT7" GFF3_"$DRAFT7" | awk '/colour=10/{c++;if(c==2){sub("colour=10","colour=11");c=0}}1' | sed 's/ //g' > "$DRAFT7"2.gff

echo "##FASTA" > Fastadummy
cat Fastadummy SingleSeq_RagTag_"$DRAFT7" | sed 's/ /_/g' > TEST_SingleSeq_RagTag_"$DRAFT7" 
cat "$DRAFT7"2.gff TEST_SingleSeq_RagTag_"$DRAFT7" > 7_RagTag_"$DRAFT7".gff

rm seqlength_*
rm GFF*
rm *2.gff
rm Fastadummy
rm TEST_SingleSeq_RagTag_"$DRAFT7"
rm SingleSeq_RagTag_"$DRAFT7"

echo "DONE"
echo " "
echo " "
echo " "


################################################################################
################################################################################
#### CLEAN UP FILES
################################################################################
################################################################################
echo "########################################################################"
echo "########################################################################"
echo "########################################################################"
echo "START REMOVING tmp FILES"
rm ./"$DRAFT1"
rm ./"$DRAFT2"
rm ./"$DRAFT3"
rm ./"$DRAFT4"
rm ./"$DRAFT5"
rm ./"$DRAFT6"
rm ./"$DRAFT7"
rm -r RagTag*
rm ./*.nsq
rm ./*.nin
rm ./*.nhr
rm ./*.fai

echo "DONE"
echo " "
echo " "
echo " "
#### END REMOVE FILES


################################################################################
#### GENERATE LOGFILE
################################################################################
###
echo " "
echo "########################################################################"
echo "####### RUNTIME"
echo "########################################################################"
echo " "
echo "RUNTIME till here: $((($(date +%s)-$start)/60)) minutes"
echo "########################################################################"
echo " "
echo " "
echo " "

######################################################################################
######################################################################################
#### SCRIPT END
######################################################################################
#### SCRIPT END
######################################################################################
#### SCRIPT END
######################################################################################
######################################################################################




echo "########################################################################"
echo "########################################################################"
echo "########################################################################"
echo " Record the used commands and logfile"
echo "Command used: $0" >> log_file.txt
mv ../log_file.txt ./log_file.txt

echo "DONE"
echo " "
echo " "
echo " "


################################################################################
################################################################################
#### START ARTEMIS
################################################################################
################################################################################
echo "########################################################################"
echo "########################################################################"
echo "########################################################################"
echo "START Artemis Comparison Tool"
echo "START Artemis Comparison Tool"
echo "START Artemis Comparison Tool"
echo " "
## START Artemis Comp TOOL for visualisation
## Load the genome files and comparison file

#act ./1_RagTag_"$DRAFT1".gff \
#    ./1_RagTag_"$DRAFT1"_vs_"$DRAFT2"_"$PARAMETER9"_fmt6.crunch \
#    ./2_RagTag_"$DRAFT2".gff \
#    ./2_RagTag_"$DRAFT2"_vs_"$DRAFT3"_"$PARAMETER9"_fmt6.crunch \
#    ./3_RagTag_"$DRAFT3".gff \
#    ./3_RagTag_"$DRAFT3"_vs_"$DRAFT4"_"$PARAMETER9"_fmt6.crunch \
#    ./4_RagTag_"$DRAFT4".gff \
#    ./4_RagTag_"$DRAFT5"_vs_"$DRAFT4"_"$PARAMETER9"_fmt6.crunch \
#    ./5_RagTag_"$DRAFT5".gff \
#    ./5_RagTag_"$DRAFT6"_vs_"$DRAFT5"_"$PARAMETER9"_fmt6.crunch \
#    ./6_RagTag_"$DRAFT6".gff \
#    ./6_RagTag_"$DRAFT7"_vs_"$DRAFT6"_"$PARAMETER9"_fmt6.crunch \
#    ./7_RagTag_"$DRAFT7".gff 


## Create the new script content
# Replace modules and conda environment line according to your HPC
SCRIPT_CONTENT="source /g/data/ey34/conda/conda-setup.sh \\
    conda activate ragtag \\
    module load blast \\
    act ./1_RagTag_\"$DRAFT1\".gff \\
    ./1_RagTag_\"$DRAFT1\"_vs_\"$DRAFT2\"_\"$PARAMETER9\"_fmt6.crunch \\
    ./2_RagTag_\"$DRAFT2\".gff \\
    ./2_RagTag_\"$DRAFT2\"_vs_\"$DRAFT3\"_\"$PARAMETER9\"_fmt6.crunch \\
    ./3_RagTag_\"$DRAFT3\".gff \\
    ./3_RagTag_\"$DRAFT3\"_vs_\"$DRAFT4\"_\"$PARAMETER9\"_fmt6.crunch \\
    ./4_RagTag_\"$DRAFT4\".gff \\
    ./4_RagTag_\"$DRAFT5\"_vs_\"$DRAFT4\"_\"$PARAMETER9\"_fmt6.crunch \\
    ./5_RagTag_\"$DRAFT5\".gff \\
    ./5_RagTag_\"$DRAFT6\"_vs_\"$DRAFT5\"_\"$PARAMETER9\"_fmt6.crunch \\
    ./6_RagTag_\"$DRAFT6\".gff \\
    ./6_RagTag_\"$DRAFT7\"_vs_\"$DRAFT6\"_\"$PARAMETER9\"_fmt6.crunch \\
    ./7_RagTag_\"$DRAFT7\".gff"

# Define the output file name
OUTPUT_FILE="./artemis_visualisation_${OUTPUT_DIRECTORY}_${CURRENTDATE}.sh"

# Write the script content to the output file
echo -e "$SCRIPT_CONTENT" > "$OUTPUT_FILE"

# Make the output file executable
chmod +x "$OUTPUT_FILE"

# Optional: Print a message indicating the script was created
echo "Script $OUTPUT_FILE created successfully. Go to output folder and run script for visuals."
