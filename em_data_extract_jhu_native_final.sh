cd /lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/

subject=${1}

cd $subject

for dti in FA MD RD; do
  for roinum in {1..47} ; do

    file="/lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/${subject}/dti_${dti}.nii"

     padroi=`$FSLDIR/bin/zeropad $roinum 3`

    if [ -f ${subject}_${dti}_jhu_native_roi${padroi}.txt ]

    then
         rm ${subject}_${dti}_jhu_native_roi${padroi}.txt
    fi

     sed "${roinum}q;d" /lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/list_jhu >> ${subject}_${dti}_jhu_native_roi${padroi}.txt

     fslmeants -i ${file} -m warped_jhu/${roinum} >> ${subject}_${dti}_jhu_native_roi${padroi}.txt

     paste *${dti}_jhu_native*.txt > all_${dti}_jhu.txt

  done

  rm *${dti}_jhu_native_roi*.txt

done
