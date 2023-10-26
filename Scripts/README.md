**This repository contains python and R scripts used for data extraction, curation and analyses :**

Order of scripts usage : 

1/ IPAM_ImagingWin_semi_auto_data_extraction_english_version.py > custom python script to extract IPAM fluorometry measurements from a large number of xpim files using ImaginWin software semi-manually.
Using this script, users still select areas of interest in the images to extract measurements from but file opening, closing and data saving are automatized. It generally decreases by x2-X5 the amount of time needed to process a large number of files. 

2/NDVI_Chla_correlation.Rmd > R script to validate NDVI measurements using spectrophotometric measurements of chlorophyll a on a subset of samples 

3/ FvFm_ED50.Rmd & NDVI_ED50.Rmd > R scripts to run Weibull type 2 models on raw FvFm and NDVI measurements to extract ED50 (absoltue thresholds) and performance retention (relative threshold) metrics for both traits. 

4/ Phenotypic_traits_filtration_and_merging.Rmd > R script to perform quality filtering of thermal thresholds metrics and bind all data together for further analyses

5/ Phenotypic_trait_variation_v2.Rmd > R script to perform  'Heat tolerance variation analysis' presented in the paper. 

6/ Correct_colony_depth_v2.Rmd > R script to standardized colonies depth (measured using dive computers) to tide-level at the time of collection using BOM data (see Methods section)

7/ Env_data_analyses_v4 > R script to perform 'Environmental data analysis' presented in the paper. Scripts for extraction of environmental data are not available in the folder but can be requested to authors. 

8/ Random_fores_analysis_v3.Rmd & Ridge_regression_v2.Rmd > R scripts to peform 'Phenotype by environment analysis' presented in the paper. 

9/ Global_figure_phenoxenv_analyses.Rmd > To reproduce Figure 5 from the paper. 


