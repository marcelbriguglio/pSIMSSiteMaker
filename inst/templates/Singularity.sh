#!/bin/sh

singularity exec -B /projects/aces/mkivi2/psims/:/pysims/data /projects/aces/mkivi2/psims/Bash/apsim_psims_image/custom_psims_full.img python /pysims/data/pysims/pysims.py --param /pysims/data/pSIMS_Output/APSIM/energyFarm/open_loop/params.apsim.sample --campaign /pysims/data/pSIMS_Output/APSIM/energyFarm/campaign_apsim --tlatidx @in_tlatidx --tlonidx  @in_tlonidx --latidx @in_latidx --lonidx @in_lonidx
