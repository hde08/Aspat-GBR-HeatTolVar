**Description of files content :** 

1/ __Aspat_fragment_sizes.csv__ > Estimation of individual fragments sizes using number of pixels on 2D images  
  -ID : Fragment ID    
  -Npixel : 2D Fragment size (number of pixels)  

2/ __Aspath_chla.csv__ > Individual fragments chlorophyll a content (see 'Validation of chlorophyll measurements from hyperspectral imaging' in supplementary materials)  
  -Chla_per_dw : Fragment chla content standardized to dry weight (g/g dw)     
  -MeanNDVI : Fragment mean NDVI value computed from hyperspectral measurements     

3/ __Aspath_tanks_temperature_adj.csv__ > Temperature summary for each assay and experimental tank at the 14 different reef sites  
  -maxTemp : Maximum temperature reached during the run  
  -minTemp : Minimum temperature reached during the run  
  -meanTemp_run : Mean temperature during the run  
  -meanTemp_hold : Mean temperature during the 3h-hold period (see Mat & Met section for details on temperature profiles)  
  -sdTemp_hold : Standard deviation of temperature during the 3h-hold period  
  -Source : Source of temperature data for that tank (HOBO logger or resistance probe)  
  -meanTemp_hold.adj : Mean temperature during the 3h-hold period adjusted to account for calibration differences between HOBO and probes  
  -maxTemp.adj : Maximum temperature during the run adjusted to account for calibration differences between HOBO and probes  

4/ __ECT1_Aspat_FvFm.csv__ > Raw FvFm measurements for individual coral fragments   
  -F1-F3 : F0 measurements across 3 fragment areas  
  -Fm1-3 : Fm measurements across 3 fragment areas  
  -Fv/Fm1-3 : Fv/Fm measurements across 3 fragment areas  
  -mFvFm : Fragment mean Fv/Fm
  
5/ __ECT1_Aspat_Hyperspec_NDVI.csv__ > Raw NDVI measurements for individual coral fragments  
  -MeanNDVI : Fragment mean NDVI  
  -StdNDVI : Fragment NDVI standard deviation

6/ __ECT1_Aspat_colonies_environmental_data_24metrics.csv__ > Colony-level environmental predictors preliminary considered in the analyses    
  -LMM	:	Minimum monthly mean   
  -OM	:	Overall mean  
  -OMsd	:	Overall standard deviation  
  -AR	:	Average Annual range  
  -ROTC_ss	:	Average Rate of temperature change (spring-summer)  
  -MMM	:	Maximum monthly mean (adjusted to historical baseline)  
  -TSA_DHW_stdev	:	Degree Heating weeks standard deviation   
  -DHW_freq_sup4	:	Average frequency of Degree Heating weeks above 4  
  -DHW_freq_sup8	:	Average frequency of Degree Heating weeks above 8  
  -DHW_max	:	Maximum Degree Heating weeks  
  -DHW_freq_sup4_1year	:	Frequency of Degree Heating weeks above 4 during the year prior to collection  
  -DHW_freq_sup4_6year	:	Frequency of Degree Heating weeks above 4 since 2016  
  -DHW_collection	:	Degree Heating weeks at the time of collection (2022 Field Trip)  
  -Depth	:	Colonies depth (adjusted to LAT using BOM tides data)  
  -Health.score	:	https://coralwatch.org/product/coral-health-chart/  
  -CF_OM	:	Cloud Fraction overall mean (% of pixel covered by clouds)  
  -CF_ss	:	Cloud Fraction summer-spring mean (% of pixel covered by clouds)  
  -CF30a	:	Cloud Fraction anomaly for the 30 days prior to collection  
  -Chl_a_OM	:	Chlorophylle A Overall Mean  
  -Kd_490_OM	:	Vertical attenuation at 490nm Overall Mean  
  -Oxygen_OM	:	Dissolved Oxygen Overall Mean  
  -PIP_OM	:	Particulate Inorganic Phosphorus Overall Mean  
  -TOTAL_N_OM	:	Total Nitrogen Overall Mean  
  -Velocity_OM	:	Total current Overall Mean  

7/ __ECT1_Aspat_colonies_environmental_data_uncor_v3_0.7.csv__ > 12 Colony-level environmental predictors with low to moderate pairwise correlation (R<0.7) used in Phenotype x Env analyses  

8/ __GBR_Aspat_sites_data.csv__ > Summary of GBR 14 reef sites conditions (including coordinates and MMM)      
  -GBRMPA.zoning : Reef zoning retrieved from Great Barrier Reef Marine Park Authority https://www2.gbrmpa.gov.au/access/zoning/eye-on-the-reef-app  
  -Km_to_coastline : Shortest distance to shore (km, haversine distance)

9/ __Phenotypic_trait_per_genotype.csv__ > Summary of thermal tolerance metrics (Fv/Fm and NDVi ED50 and performance retention) for all colonies  
  -Metric : Heat tolerance metric (ED50 or performance retention)  
  -Trait : Phenotypic trait (Fv/Fm or NDVI)  
  -Value : Estimate   
  -CI : Confidence intervall width (95%)  

10/ __ECT1_Aspat_field_data.csv__ > Individual colony metadata for the 767 A.spathulata colonies samples on the GBR  
  -Lat : Latitude  
  -Lon : Longitude  
  -Depth : Colony depth (measured using dive computer)  
  -Tide_adjust : Tide level at the time of collection  
  -Depth_corrected : Depth standardized to LAT  
  -Health chart : Pigmentation at the time of collection measured using Coral health chart   

11 / __tide_data_ECT1_v3.csv__ > BOM tide data extracted using https://www.willyweather.com.au/ for the 14 GBR reef sites at the time of collection to standardized colonies depths to LAT    
  -Collection date : Date and time of collection  
  -Closest tide station : Closest BOM station  
  -Time1-4 : Time of high/low tides  
  -Level1-4 : Tide levels at high/low tides   
