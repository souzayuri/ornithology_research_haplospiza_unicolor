#######################################
## DOWNLOAD DATA FROM GBIF ##
#######################################

if(!require(tidyverse)) install.packages("tidyverse")
if(!require(rgbif)) install.packages("rgbif")
if(!require(rnaturalearth)) install.packages("rnaturalearth")
if(!require(rnaturalearthdata)) install.packages("rnaturalearthdata")
if(!require(sf)) install.packages("sf")
if(!require(nngeo)) install.packages("nngeo")
if(!require(tmap)) install.packages("tmap")
if(!require(spocc)) install.packages("spocc")


occ_spocc <- spocc::occ(query = "Haplospiza unicolor",
                        from = c("gbif", "ebird"),
                        has_coords = TRUE,
                        limit = 1e5,
                        ebirdopts = list(key = "mf46dnkqr7jt"))

# Step 1: Filter the data from gbif
filtered_data_gbif <- occ_spocc$gbif$data$Haplospiza_unicolor[
  occ_spocc$gbif$data$Haplospiza_unicolor$basisOfRecord %in% c("HUMAN_OBSERVATION", "OCCURRENCE"), ]


occ_spocc$idigbio$data$Haplospiza_unicolor$

occ_spocc$gbif$data$Haplospiza_unicolor <- filtered_data_gbif



df_occ_spocc <- spocc::occ2df(occ_spocc, what = "data")

write_csv(filtered_data, "00_data/haplospiza_unicolor_occurrence.csv")


x <- occ_spocc$gbif$data$Haplospiza_unicolor |> 
  filter(key == "684427881")
