**Description of files content :** 

1/ Aspat_fragment_sizes.csv > Estimation of individual fragments sizes using number of pixels on 2D images
ID : Fragment ID
Npixel : 2D Fragment size (in number of pixels)

2/ Aspath_chla.csv > Individual fragments chlorophyll a content (see 'Validation of chlorophyll measurements from hyperspectral imaging' in supplementary materials)
Chla_per_dw : Fragment chla content standardized to dry weight (g/g dw) 
MeanNDVI : Fragment mean NDVI value computed from hyperspectral measurements 

3/ Aspath_tanks_temperature_adj.csv > Temperature summary for each tank and each experiment run at the 14 different reef sites
  -maxTemp : Maximum temperature reached during the run
  -minTemp : Minimum temperature reached during the run
  -meanTemp_run : Mean temperature during the run
  -meanTemp_hold : Mean temperature during the 3h-hold period (see Mat & Met section for details on temperature profiles)
  -sdTemp_hold : Standard deviation of temperature during the 3h-hold period
  -Source : Source of temperature data for that tank (HOBO logger or resistance probe)
  -meanTemp_hold.adj : Mean temperature during the 3h-hold period adjusted to account for calibration differences between HOBO and probes
  -maxTemp.adj : Maximum temperature during the run adjusted to account for calibration differences between HOBO and probes

4/ ECT1_Aspat_FvFm.csv > Raw FvFm measurements for individual coral fragments

5/ ECT1_Aspat_Hyperspec_NDVI.csv> Raw NDVI measurements for individual coral fragments

6/ ECT1_Aspat_colonies_environmental_data_24metrics.csv > Colony-level environmental predictors preliminary considered in the analyses

7/ ECT1_Aspat_colonies_environmental_data_uncor_v3_0.7.csv > 12 Colony-level environmental predictors with low to moderate pairwise correlation (R<0.7) used in Phenotype x Env analyses

8/ GBR_Aspat_sites_data.csv > Summary of GBR 14 reef sites conditions (including coordinates and MMM)

9/ Phenotypic_trait_per_genotype.csv > Summary of thermal tolerance metrics (Fv/Fm and NDVi ED50 and performance retention) for all colonies. 

10/ ECT1_Aspat_field_data.csv > Individual colony metadata for the 767 A.spathulata colonies samples on the GBR (including lon, lat, health.score, depth, corrected depth)

11 / tide_data_ECT1_v3.csv > BOM tide data extracted using https://www.willyweather.com.au/ for the 14 GBR reef sites at the time of collection to standardized colonies depths to LAT
