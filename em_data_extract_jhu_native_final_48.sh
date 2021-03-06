cd /lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/

subject=${1}

cd $subject

for dti in FA MD RD; do

  file="/lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/${subject}/dti_${dti}.nii"

  if [ -f ${file} ]; then

  roinum="48"

      padroi=`$FSLDIR/bin/zeropad $roinum 3`

      if [ -f ${subject}_${dti}_jhu_native_roi${padroi}.txt ]; then
         rm ${subject}_${dti}_jhu_native_roi${padroi}.txt; fi

          #echo $(sed "${roinum}q;d" /lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/list_jhu) >> ${subject}_${dti}_jhu_native_roi${padroi}.txt

          #echo ${roinum} >> ${subject}_${dti}_jhu_native_roi${padroi}.txt

          fslmeants -i ${file} -m warped_jhu/${roinum} >> ${subject}_${dti}_jhu_native_roi${padroi}.txt

        else

          roinum="48"


            padroi=`$FSLDIR/bin/zeropad $roinum 3`

            if [ -f ${subject}_${dti}_jhu_native_roi${padroi}.txt ]; then
               rm ${subject}_${dti}_jhu_native_roi${padroi}.txt; fi

          echo "NA" >> ${subject}_${dti}_jhu_native_roi${padroi}.txt
      fi
      done
