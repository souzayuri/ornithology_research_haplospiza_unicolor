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
                        from = c("inat", "idigbio", "vertnet", "gbif"),
                        has_coords = TRUE,
                        limit = 1e5)

df_occ_spocc <- spocc::occ2df(occ_spocc)

write_csv(df_occ_spocc, "00_data/haplospiza_unicolor_occurrence.csv")


x <- occ_spocc$gbif$data$Haplospiza_unicolor |> 
  filter(key == "684427881")
