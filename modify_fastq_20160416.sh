#!/bin/bash
####################################################################
#
#A (quite) simple submit script for a one or tow processor job
#
####################################################################
#
# SGE options
#
#Change to the current working directory upon starting of the job
#$ -cwd
#
source ~/.profile
# Specify the kind of shell script you use, for example, bash
#$ -S /bin/bash
#
# join the error and standard output streams
#$ -j y
#
#
# don't flood myself with e-mail
#$ -m e
#
# this is my e-mail address
##$ -M zihailing@live.cn
#
#where the format error go
#$ -e /psc/home/zihailing/
#where the format output go
#$ -o /psc/home/zihailing
# notify me about pending SIG_STOP and SIG_KILL
#$ -notify
#
# Specify the array start ,end , step
#$ -t 1-2:1 
# end of SGE stuff
#########################################################
# now execute my job:
ARRAY_A=( head YHH0014_ash2-3_ChIP0325_S160409_TTGGCA_L001 YHH0014_ash2-3_ChIP0325_S160409_TTGGCA_L002 )
ARRAY_B=( head YHH0014_ash2-input-3_ChIP0325_S160409_CACAGT_L001 YHH0014_ash2-input-3_ChIP0325_S160409_CACAGT_L002 )
#  echo ${ARRAY[$SGE_TASK_ID]}

DIR=/psc/home/zihailing/zihailing/YHH_HXG_20160415/
perl ~/zihailing/tool/modify_fastq_v1.pl  -n ${ARRAY_A[$SGE_TASK_ID]} -a $DIR/YHH0014/Sample_YHH0014_ash2-3_ChIP0325_S160409/${ARRAY_A[$SGE_TASK_ID]}_R# -r $DIR/tmp_data
perl ~/zihailing/tool/modify_fastq_v1.pl  -n ${ARRAY_B[$SGE_TASK_ID]} -a $DIR/YHH0014/Sample_YHH0014_ash2-input-3_ChIP0325_S160409/${ARRAY_B[$SGE_TASK_ID]}_R# -r $DIR/tmp_data
