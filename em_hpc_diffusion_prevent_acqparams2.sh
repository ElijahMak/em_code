#!/bin/bash

# Diffusion Imaging Preprocessing of PREVENT
# Author: Elijah Mak
# Date: 16th September 2020

# Objectives
# Perform brain extraction
# Eddy current correction using eddy_cuda
# DTI fitting

# Update
# Added function to accept edited b0 masks. ${2} = 1 or 0.

# Load modules

module load cuda/8.0
module load fsl/6.0.1

# Parameters
subject="${1}"
BET=${2}
raw_dwi="${subject}.dwi.nii"
bval="bval"
bvec="bvec"
json="json"
mask="b0_brain_mask.nii.gz"

# Initialising Text
echo "Initialising diffusion preprocessing for ${subject}"

# Switch to subject directory
cd ${subject}v1

# Perform brain extraction
if [ "${BET}" = "0" ]; then
echo "Running BET [1/3]"
echo "fslroi $raw_dwi b0 0 1"
fslroi $raw_dwi b0 0 1
echo "bet b0 b0_brain -m -f 0.2"
bet b0 b0_brain -m -f 0.2
else
echo "Using edited BET [1/3]"
mask="b0_brain_mask.nii.gz"
fi 

# Perform eddy cuda with s2v correction
output_edc="edc.repol.s2v.acq2"
input_dti="edc.repol.s2v.acq2.nii"
output_dti="dti.acq2"
rotated_bvecs="edc.repol.s2v.acq2.eddy_rotated_bvecs"

echo "Running EDC CUDA with s2v on ACQ2[2/3]"
echo "eddy_cuda8.0 --imain=$raw_dwi --acqp=acqparams2.txt --index=index.txt \
--mask=$mask --bvals=$bval --bvecs=$bvec \
--out=$output_edc --niter=8 --fwhm=10,6,4,2,0,0,0,0 --repol --ol_type=both --mporder=8 --s2v_niter=8 --json=$json --cnr_maps"

eddy_cuda8.0 --imain=$raw_dwi --acqp=/home/fkm24/rds/hpc-work/prevent_700/acqparams2.txt \
--index=/home/fkm24/rds/hpc-work/prevent_700/index.txt \
--mask=$mask \
--bvals=$bval \
--bvecs=$bvec \
--out=$output_edc \
--niter=8 --fwhm=10,6,4,2,0,0,0,0 --repol --ol_type=both --mporder=8 --s2v_niter=8 --json=$json --cnr_maps

# DTIFIT
echo "Running DTIFIT [3/3]"
echo "dtifit --data=$input_dti  --mask=$mask --bvecs=$rotated_bvecs --bvals=$bval --out=$output_dti"
dtifit --data=$input_dti  --mask=$mask --bvecs=$rotated_bvecs --bvals=$bval --out=$output_dti

echo "DWI preprocessing and DTIFIT completed for ${subject}"
