	# PREVENT QC Pipeline
	# Author: Elijah Mak
	# Date: 17th September 2020

	# Module
	module unload fsl/5.0.10
	module unload fsl/6.0.1
	module load fsl/6.0.3

	# Subject
	subject="${1}"
	input=${2}

	# Directory
	dir="/lustre/archive/p00423/PREVENT_Elijah/CAT12"
	outputdir="/lustre/archive/p00423/QualityControl"
	fa_fmrib="/lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/${subject}/dti_FA_fnirt_FMRIB58.nii"
	fmrib="/lustre/archive/p00423/PREVENT_Elijah/FAST/FMRIB58_FA_1mm.nii.gz"
	b0="/lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/${subject}/b0.nii.gz"
	b0mask="/lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/${subject}/b0_brain_mask.nii.gz"
	fa_fmrib_mask="/lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/${subject}/dti_FA_fnirt_FMRIB58_mask.nii"
	myelin_gm="/lustre/archive/p00423/PREVENT_Elijah/myelin/${subject}/${subject}_myelin_brain.nii.gz"

	# inputs
	# cat12
  # dwi_fmrib, fa_tensor, all, dwi_flirt
	# dwi_brainmask
	# myelin_flirt


	if [ $input = cat12 ]; then

	# GM Axial
	pkill Xvfb
	xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.gm.axial.png --scene lightbox --hideCursor  --worldLoc -25.040941687671577 -37.32170315056568 -22.79834519205592 --displaySpace ${dir}/T1w_${subject}.nii --zaxis 2 --sliceSpacing 6 --zrange 68.22089955694904 194.9572843305086 --ncols 7 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/T1w_${subject}.nii --name "T1w_${subject}" --overlayType volume --alpha 100.0 --brightness 60.63218390804598 --contrast 71.26436781609196 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 800.0 --clippingRange 0.0 1405.92 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 ${dir}/mri/p1T1w_${subject}.nii --name "p1T1w_${subject}" --overlayType volume --alpha 48.28306686791663 --brightness 50.0 --contrast 50.0 --cmap red-yellow --negativeCmap greyscale --displayRange 0.0 1.0 --clippingRange 0.0 1.01 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

	# GM Coronal
	pkill Xvfb
	xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.gm.coronal.png  --scene lightbox --hideCursor  --worldLoc -25.040941687671577 -37.32170315056568 -22.79834519205592 --displaySpace ${dir}/T1w_${subject}.nii --zaxis 1 --sliceSpacing 6 --zrange 68.22089955694904 194.9572843305086 --ncols 7 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/T1w_${subject}.nii --name "T1w_${subject}" --overlayType volume --alpha 100.0 --brightness 60.63218390804598 --contrast 71.26436781609196 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 800.0 --clippingRange 0.0 1405.92 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 ${dir}/mri/p1T1w_${subject}.nii --name "p1T1w_${subject}" --overlayType volume --alpha 48.28306686791663 --brightness 50.0 --contrast 50.0 --cmap red-yellow --negativeCmap greyscale --displayRange 0.0 1.0 --clippingRange 0.0 1.01 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

	# GM Sag
	pkill Xvfb
	xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.gm.sag.png  --scene lightbox --hideCursor --worldLoc -25.040941687671577 -37.32170315056568 -22.79834519205592 --displaySpace  ${dir}/T1w_${subject}.nii --zaxis 0 --sliceSpacing 4 --zrange 68.22089955694904 194.9572843305086 --ncols 7 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/T1w_${subject}.nii --name "T1w_${subject}" --overlayType volume --alpha 100.0 --brightness 60.63218390804598 --contrast 71.26436781609196 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 800.0 --clippingRange 0.0 1405.92 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 ${dir}/mri/p1T1w_${subject}.nii --name "p1T1w_${subject}" --overlayType volume --alpha 48.28306686791663 --brightness 50.0 --contrast 50.0 --cmap red-yellow --negativeCmap greyscale --displayRange 0.0 1.0 --clippingRange 0.0 1.01 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

	# WM
	pkill Xvfb
	xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.wm.png  --scene lightbox --hideCursor  --worldLoc -25.040941687671577 -37.32170315056568 -22.79834519205592 --displaySpace ${dir}/T1w_${subject}.nii --zaxis 1 --sliceSpacing 6 --zrange 68.22089955694904 194.9572843305086 --ncols 7 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/T1w_${subject}.nii --name "T1w_${subject}" --overlayType volume --alpha 100.0 --brightness 60.63218390804598 --contrast 71.26436781609196 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 800.0 --clippingRange 0.0 1405.92 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 ${dir}/mri/p2T1w_${subject}.nii --name "p2T1w_${subject}" --overlayType volume --alpha 48.28306686791663 --brightness 50.0 --contrast 50.0 --cmap blue-lightblue --negativeCmap greyscale --displayRange 0.0 1.0 --clippingRange 0.0 1.01 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0


	## CAT12 normalisation

	# GM
	pkill Xvfb
	xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.gm.mni152.png  --scene lightbox --hideCursor --worldLoc 51.881539367386516 91.3974919323673 -51.81227616006569 --displaySpace ${dir}/MNI152_T1_1mm_brain.nii.gz --zaxis 2 --sliceSpacing 4.77867613448265 --zrange 17.798385772692978 162.01332661970616 --ncols 9 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/MNI152_T1_1mm_brain.nii.gz --name "MNI152_T1_1mm_brain" --overlayType volume --alpha 100.0 --brightness 50.0 --contrast 50.0 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 8364.0 --clippingRange 0.0 8447.64 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /${dir}/mri/mwp1T1w_${subject}.nii --name "mwp1T1w_${subject}" --overlayType volume --alpha 81.52252905571892 --brightness 61.21621728204645 --contrast 81.6216230427286 --cmap red-yellow --negativeCmap greyscale --displayRange 0.2 1.0 --clippingRange 0.2 1 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

	# WM
	pkill Xvfb
	xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.wm.mni152.png  --scene lightbox --hideCursor --worldLoc 51.881539367386516 91.3974919323673 -51.81227616006569 --displaySpace ${dir}/MNI152_T1_1mm_brain.nii.gz --zaxis 2 --sliceSpacing 4.77867613448265 --zrange 17.798385772692978 162.01332661970616 --ncols 9 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/MNI152_T1_1mm_brain.nii.gz --name "MNI152_T1_1mm_brain" --overlayType volume --alpha 100.0 --brightness 50.0 --contrast 50.0 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 8364.0 --clippingRange 0.0 8447.64 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /${dir}/mri/mwp2T1w_${subject}.nii --name "mwp2T1w_${subject}" --overlayType volume --alpha 81.52252905571892 --brightness 61.21621728204645 --contrast 81.6216230427286 --cmap blue-lightblue --negativeCmap greyscale --displayRange 0.2 1.0 --clippingRange 0.2 2.1982354640960695 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0


elif [ "$input" = all ]; then

# GM Axial
pkill Xvfb
xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.gm.axial.png --scene lightbox --hideCursor  --worldLoc -25.040941687671577 -37.32170315056568 -22.79834519205592 --displaySpace ${dir}/T1w_${subject}.nii --zaxis 2 --sliceSpacing 6 --zrange 68.22089955694904 194.9572843305086 --ncols 7 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/T1w_${subject}.nii --name "T1w_${subject}" --overlayType volume --alpha 100.0 --brightness 60.63218390804598 --contrast 71.26436781609196 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 800.0 --clippingRange 0.0 1405.92 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 ${dir}/mri/p1T1w_${subject}.nii --name "p1T1w_${subject}" --overlayType volume --alpha 48.28306686791663 --brightness 50.0 --contrast 50.0 --cmap red-yellow --negativeCmap greyscale --displayRange 0.0 1.0 --clippingRange 0.0 1.01 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

# GM Coronal
pkill Xvfb
xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.gm.coronal.png  --scene lightbox --hideCursor  --worldLoc -25.040941687671577 -37.32170315056568 -22.79834519205592 --displaySpace ${dir}/T1w_${subject}.nii --zaxis 1 --sliceSpacing 6 --zrange 68.22089955694904 194.9572843305086 --ncols 7 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/T1w_${subject}.nii --name "T1w_${subject}" --overlayType volume --alpha 100.0 --brightness 60.63218390804598 --contrast 71.26436781609196 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 800.0 --clippingRange 0.0 1405.92 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 ${dir}/mri/p1T1w_${subject}.nii --name "p1T1w_${subject}" --overlayType volume --alpha 48.28306686791663 --brightness 50.0 --contrast 50.0 --cmap red-yellow --negativeCmap greyscale --displayRange 0.0 1.0 --clippingRange 0.0 1.01 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

# GM Sag
pkill Xvfb
xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.gm.sag.png  --scene lightbox --hideCursor --worldLoc -25.040941687671577 -37.32170315056568 -22.79834519205592 --displaySpace  ${dir}/T1w_${subject}.nii --zaxis 0 --sliceSpacing 4 --zrange 68.22089955694904 194.9572843305086 --ncols 7 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/T1w_${subject}.nii --name "T1w_${subject}" --overlayType volume --alpha 100.0 --brightness 60.63218390804598 --contrast 71.26436781609196 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 800.0 --clippingRange 0.0 1405.92 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 ${dir}/mri/p1T1w_${subject}.nii --name "p1T1w_${subject}" --overlayType volume --alpha 48.28306686791663 --brightness 50.0 --contrast 50.0 --cmap red-yellow --negativeCmap greyscale --displayRange 0.0 1.0 --clippingRange 0.0 1.01 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

# WM
pkill Xvfb
xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.wm.png  --scene lightbox --hideCursor  --worldLoc -25.040941687671577 -37.32170315056568 -22.79834519205592 --displaySpace ${dir}/T1w_${subject}.nii --zaxis 1 --sliceSpacing 6 --zrange 68.22089955694904 194.9572843305086 --ncols 7 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/T1w_${subject}.nii --name "T1w_${subject}" --overlayType volume --alpha 100.0 --brightness 60.63218390804598 --contrast 71.26436781609196 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 800.0 --clippingRange 0.0 1405.92 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 ${dir}/mri/p2T1w_${subject}.nii --name "p2T1w_${subject}" --overlayType volume --alpha 48.28306686791663 --brightness 50.0 --contrast 50.0 --cmap blue-lightblue --negativeCmap greyscale --displayRange 0.0 1.0 --clippingRange 0.0 1.01 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0


## CAT12 normalisation

# GM
pkill Xvfb
xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.gm.mni152.png  --scene lightbox --hideCursor --worldLoc 51.881539367386516 91.3974919323673 -51.81227616006569 --displaySpace ${dir}/MNI152_T1_1mm_brain.nii.gz --zaxis 2 --sliceSpacing 4.77867613448265 --zrange 17.798385772692978 162.01332661970616 --ncols 9 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/MNI152_T1_1mm_brain.nii.gz --name "MNI152_T1_1mm_brain" --overlayType volume --alpha 100.0 --brightness 50.0 --contrast 50.0 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 8364.0 --clippingRange 0.0 8447.64 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /${dir}/mri/mwp1T1w_${subject}.nii --name "mwp1T1w_${subject}" --overlayType volume --alpha 81.52252905571892 --brightness 61.21621728204645 --contrast 81.6216230427286 --cmap red-yellow --negativeCmap greyscale --displayRange 0.2 1.0 --clippingRange 0.2 1 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

# WM
pkill Xvfb
xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.wm.mni152.png  --scene lightbox --hideCursor --worldLoc 51.881539367386516 91.3974919323673 -51.81227616006569 --displaySpace ${dir}/MNI152_T1_1mm_brain.nii.gz --zaxis 2 --sliceSpacing 4.77867613448265 --zrange 17.798385772692978 162.01332661970616 --ncols 9 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/MNI152_T1_1mm_brain.nii.gz --name "MNI152_T1_1mm_brain" --overlayType volume --alpha 100.0 --brightness 50.0 --contrast 50.0 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 8364.0 --clippingRange 0.0 8447.64 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /${dir}/mri/mwp2T1w_${subject}.nii --name "mwp2T1w_${subject}" --overlayType volume --alpha 81.52252905571892 --brightness 61.21621728204645 --contrast 81.6216230427286 --cmap blue-lightblue --negativeCmap greyscale --displayRange 0.2 1.0 --clippingRange 0.2 2.1982354640960695 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

# DWI FMRIB normalisation

# FA
pkill Xvfb
xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.fa.fmrib.png  --scene lightbox --hideCursor --worldLoc 51.881539367386516 91.3974919323673 -51.81227616006569 --displaySpace /lustre/archive/p00423/PREVENT_Elijah/FAST/FMRIB58_FA_1mm.nii.gz --zaxis 2 --sliceSpacing 4.77867613448265 --zrange 17.798385772692978 162.01332661970616 --ncols 9 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync /lustre/archive/p00423/PREVENT_Elijah/FAST/FMRIB58_FA_1mm.nii.gz --name "FMRIB" --overlayType volume --alpha 100.0 --brightness 50.0 --contrast 50.0 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 8364.0 --clippingRange 0.0 8447.64 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/${subject}/${fa_fmrib} --name "FA" --overlayType volume --alpha 81.52252905571892 --brightness 61.21621728204645 --contrast 81.6216230427286 --cmap red-yellow --negativeCmap greyscale --displayRange 0 0.7 --clippingRange 0 0.7 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection

# FA
pkill Xvfb
xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.fa.fmrib.png  --scene lightbox --hideCursor --worldLoc 51.881539367386516 91.3974919323673 -51.81227616006569 --displaySpace /lustre/archive/p00423/PREVENT_Elijah/FAST/FMRIB58_FA_1mm.nii.gz --zaxis 2 --sliceSpacing 4.77867613448265 --zrange 17.798385772692978 162.01332661970616 --ncols 9 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync /lustre/archive/p00423/PREVENT_Elijah/FAST/FMRIB58_FA_1mm.nii.gz --name "FMRIB" --overlayType volume --alpha 100.0 --brightness 50.0 --contrast 50.0 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 8364.0 --clippingRange 0.0 8447.64 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/${subject}/${fa_fmrib} --name "FA" --overlayType volume --alpha 81.52252905571892 --brightness 61.21621728204645 --contrast 81.6216230427286 --cmap red-yellow --negativeCmap greyscale --displayRange 0 0.7 --clippingRange 0 0.7 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection

elif [ "$input" = fa_tensor ]; then
pkill Xvfb
xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.fa.tensor.png --hideCursor --scene ortho --worldLoc 4.730075084169755 -1.9461487140778786 56.261993285775134 --displaySpace /lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/${subject}/dti_V1.nii --xcentre -0.01637  0.48866 --ycentre  0.06170  0.48866 --zcentre  0.06170 -0.01637 --xzoom 1667.0088434980737 --yzoom 1667.0088434980737 --zzoom 1667.0088434980737 --hideLabels --labelSize 14 --layout horizontal --hidez --hideCursor --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync /lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/${subject}/dti_FA.nii --name "dti_FA" --overlayType volume --alpha 100.0 --brightness 50.0 --contrast 50.0 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 1.2247447967529297 --clippingRange 0.0 1.2369922447204589 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/${subject}/dti_V1 --name "dti_V1" --overlayType linevector --alpha 100.0 --brightness 50.0 --contrast 50.0 --cmap greyscale --lineWidth 3.8377115005715083 --lengthScale 100.0 --xColour 1.0 0.0 0.0 --yColour 0.0 1.0 0.0 --zColour 0.0 0.0 1.0 --suppressMode white --modulateRange 0.0 1.0 --clippingRange 0.0 1.0

elif [ "$input" = dwi_brainmask ]; then

	pkill Xvfb
xvfb-run -s "-screen 0, 1024x768x24" fsleyes render --scene lightbox --outfile ${outputdir}/dwi/${subject}.b0.mask.png --worldLoc 108.2101927736983 124.64060310792524 -42.83765119809547 --displaySpace ${b0} --zaxis 2 --sliceSpacing 2.0 --zrange -1.0 124.99980163574219 --ncols 10 --nrows 10 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --hideCursor --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${b0} --name "b0" --overlayType volume --alpha 100.0 --brightness 67.02551834130782 --contrast 84.05103668261563 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 800.0 --clippingRange 0.0 2533.08 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 ${b0mask} --name "b0_brain_mask" --overlayType volume --alpha 47.76828976994573 --brightness 50.0 --contrast 50.0 --cmap blue-lightblue --negativeCmap greyscale --displayRange 0.0 1.0 --clippingRange 0.0 1.01 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

elif [ $input = cat12_brainmask ]; then

		pkill Xvfb
		xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.cat12.brainmask.axial.png --scene lightbox --hideCursor  --worldLoc -25.040941687671577 -37.32170315056568 -22.79834519205592 --displaySpace ${dir}/T1w_${subject}.nii --zaxis 2 --sliceSpacing 6 --zrange 68.22089955694904 194.9572843305086 --ncols 7 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/T1w_${subject}.nii --name "T1w_${subject}" --overlayType volume --alpha 100.0 --brightness 60.63218390804598 --contrast 71.26436781609196 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 800.0 --clippingRange 0.0 1405.92 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 ${dir}/mri/T1w_${subject}_cat12_brain.nii.gz --name "brainmask_${subject}" --overlayType volume --alpha 40 --brightness 50.0 --contrast 50.0 --cmap green --negativeCmap greyscale  --displayRange 0.0 800.0 --clippingRange 0.0 1405.92 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

elif [ $input = dwi_flirt ]; then
	pkill Xvfb
	xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/${subject}.fa.flirt.axial.png --scene lightbox --hideCursor  --worldLoc -25.040941687671577 -37.32170315056568 -22.79834519205592 --displaySpace ${dir}/T1w_${subject}.nii --zaxis 2 --sliceSpacing 6 --zrange 68.22089955694904 194.9572843305086 --ncols 7 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/T1w_${subject}.nii --name "T1w_${subject}" --overlayType volume --alpha 100.0 --brightness 60.63218390804598 --contrast 71.26436781609196 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 800.0 --clippingRange 0.0 1405.92 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /lustre/archive/p00423/PREVENT_Elijah/dwi_denoised/${subject}/fa_flirt_cat12brain --name "FA_flirt" --overlayType volume --alpha 70 --brightness 50 --contrast 50.0 --cmap blue --negativeCmap greyscale  --displayRange 0.2 0.7 --clippingRange 0.2 0.7 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

elif [ $input = dwi_fmrib ]; then

pkill Xvfb
 xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/dwi/${subject}.fa.jhu.png --scene ortho --worldLoc -17.675695754542488 -14.857630458022612 7.469650037360893 --displaySpace ${fa_fmrib} --xcentre  0.00000 -0.00000 --ycentre  0.00000  0.00000 --zcentre  0.00000  0.00000 --xzoom 100.0 --yzoom 100.0 --zzoom 100.0 --hideLabels --labelSize 14 --layout horizontal --hideCursor --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${fa_fmrib} --name "dti_FA_fnirt_FMRIB58" --overlayType volume --alpha 100.0 --brightness 50.0 --contrast 50.0 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 1.1835488080978394 --clippingRange 0.0 1.1953842961788177 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /lustre/archive/p00423/QualityControl/templates/JHU-ICBM-labels-1mm.nii.gz --name "JHU-ICBM-labels-1mm" --overlayType label --alpha 100.0 --brightness 50.0 --contrast 50.0 --lut harvard-oxford-cortical --outlineWidth 1 --volume 0

elif [ $input = dwi_fov ]; then

pkill Xvfb
xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/dwi/${subject}.dwi.fov.png --scene lightbox --hideCursor --worldLoc 74.16673546158638 -124.73660349291424 108.75978727118911 --displaySpace ${fa_fmrib_mask} --zaxis 0 --sliceSpacing 4.526647301513387 --zrange 13.569940887656918 163.50602044529867 --ncols 8 --nrows 4 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/MNI152_T1_1mm_brain.nii.gz --name "MNI152_T1_1mm_brain" --overlayType volume --alpha 100.0 --brightness 50.0 --contrast 50.0 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 8364.0 --clippingRange 0.0 8447.64 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 ${fa_fmrib_mask} --name "dti_FA_fnirt_FMRIB58_mask" --overlayType volume --alpha 51.55644378428265 --brightness 50.0 --contrast 50.0 --cmap cool --negativeCmap greyscale --displayRange 0.0 1.0 --clippingRange 0.0 1.01 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0

elif [ $input = myelin_flirt ]; then

pkill Xvfb
xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/myelin/${subject}.myelin.axial.png --scene lightbox --hideCursor  --worldLoc -25.040941687671577 -37.32170315056568 -22.79834519205592 --displaySpace ${dir}/T1w_${subject}.nii --zaxis 2 --sliceSpacing 6 --zrange 68.22089955694904 194.9572843305086 --ncols 7 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync ${dir}/T1w_${subject}.nii --name "T1w_${subject}" --overlayType volume --alpha 100.0 --brightness 60.63218390804598 --contrast 71.26436781609196 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 800.0 --clippingRange 0.0 1405.92 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 ${myelin_gm} --name "myelin" --overlayType volume --alpha 48.28306686791663 --brightness 50.0 --contrast 50.0 --cmap blue-lightblue --negativeCmap greyscale --displayRange 0.0 0.5 --clippingRange 0.0 0.5 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0


elif [ $input = freesurfer ]; then

module load freesurfer/7.1.0
module unload fsl/5.0.10
module load fsl/6.0.3

pkill Xvfb

mri_convert /lustre/archive/p00423/PREVENT_Elijah/Freesurfer7_T1FLAIR/${subject}/mri/brainmask.mgz /lustre/archive/p00423/PREVENT_Elijah/Freesurfer7_T1FLAIR/${subject}/mri/brainmask.nii.gz

mri_convert /lustre/archive/p00423/PREVENT_Elijah/Freesurfer7_T1FLAIR/${subject}/mri/aparc+aseg.mgz /lustre/archive/p00423/PREVENT_Elijah/Freesurfer7_T1FLAIR/${subject}/mri/aparc+aseg.nii.gz

#fslreorient2std /lustre/archive/p00423/PREVENT_Elijah/Freesurfer7_T1FLAIR/${subject}/mri/aparc+aseg.nii.gz /lustre/archive/p00423/PREVENT_Elijah/Freesurfer7_T1FLAIR/${subject}/mri/aparc+aseg.nii.gz

#fslreorient2std /lustre/archive/p00423/PREVENT_Elijah/Freesurfer7_T1FLAIR/${subject}/mri/brainmask.nii.gz /lustre/archive/p00423/PREVENT_Elijah/Freesurfer7_T1FLAIR/${subject}/mri/brainmask.nii.gz

xvfb-run -s "-screen 0, 640x480x24" fsleyes render --outfile ${outputdir}/Freesurfer7_T1FLAIR/${subject}.aparcaseg.png --scene lightbox --worldLoc -56.7121864827474 120.40696828206364 -61.52223391754892 --displaySpace /lustre/archive/p00423/PREVENT_Elijah/Freesurfer7_T1FLAIR/${subject}/mri/brainmask.nii.gz --zaxis 2 --sliceSpacing 6.926629123260879 --zrange 74.78679038800814 215.64719640095944  --ncols 5 --nrows 3 --bgColour 0.0 0.0 0.0 --fgColour 1.0 1.0 1.0 --cursorColour 0.0 1.0 0.0 --colourBarLocation top --colourBarLabelSide top-left --performance 3 --movieSync /lustre/archive/p00423/PREVENT_Elijah/Freesurfer7_T1FLAIR/${subject}/mri/brainmask.nii.gz --name "brainmask" --overlayType volume --alpha 100.0 --brightness 50.0 --contrast 50.0 --cmap greyscale --negativeCmap greyscale --displayRange 0.0 178.0 --clippingRange 0.0 179.78 --gamma 0.0 --cmapResolution 256 --interpolation none --numSteps 100 --blendFactor 0.1 --smoothing 0 --resolution 100 --numInnerSteps 10 --clipMode intersection --volume 0 /lustre/archive/p00423/PREVENT_Elijah/Freesurfer7_T1FLAIR/${subject}/mri/aparc+aseg.nii.gz --name "aparc+aseg" --overlayType label --alpha 45.342759705461276 --brightness 50.0 --contrast 50.0 --lut freesurfercolorlut --outlineWidth 0 --volume 0


fi
