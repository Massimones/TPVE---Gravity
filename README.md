# TPVE---Gravity
Matlab scripts to compute gravity residuals induced by TPVE inclusions

Instructions.

1) Run "Call_disk.m". 
   It computes the mechanical effects of a TPE inclusion with a given potency and geometry.
   Results will be saved in "CaseTEST.mat"
   This script needs to call the function "TPE_SOLUTIONS_TOTAL_new2.m".
2) Run "COMPUTEG_VISCOELASTIC" 
   It computes gravity changes due to the TPVE inclusion and plots them.
   The script needs to load "CaseTEST.mat", generated in the previous step.

All input parameters are in S.I. units

System requirements:  The scripts were tested with a i7 processor with 32 GB of RAM.
                      MATLAB 2024b.
                      
Massimo Nespoli, March 2025

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Notice: To speed up the computation and reduce RAM usage, you can increase two parameters in the file "Call_disk.m", k and Zstep. For example, you may set:

k = 25; % Step for plot in x axis
Zstep = 25; % Step for plot in z

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
