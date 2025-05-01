### Script to compute Alzheimer's disease-signature cortical thickness (ADSCT)

# Inputs:
# lhct -- data.frame containing freesurfer's aparcstats2table cortical thickness output for the LEFT hemisphere.
# rhct -- data.frame containing freesurfer's aparcstats2table cortical thickness output for the RIGHT hemisphere.
# group -- research group that proposed an AD-signature index; one of c("jack", "schwarz", "dickerson")

# Description of ADSCT variations
# Jack: Original version using entorhinal cortex, fusiform gyrus, and inferior and middle temporal gyri.
# Schwarz: Updated version including entorhinal cortex, inferior temporal, mid-temporal, inferior parietal, fusiform, and precuneus regions.
# Dickerson: Alternative version
# “AD signature index” measure by first performing a linear regression in the amyloid-negative control group with the Aging signature as the independent variable and the AD signature as the dependent variable. We then used this equation to calculate the “AD signature index values for each MCI patient.” Thus, an individual with a lower AD signature index value has cortical thickness within the AD signature ROIs that is disproportionately smaller than the thickness of the Aging signature ROIs, likely reflecting more specific AD-related neurodegeneration. Alternatively, an individual with a higher AD signature index value has cortical thickness within the AD signature ROIs that is of similar relative magnitude to Aging signature ROIs, possibly reflecting more diffuse effects.

# cortical thickness files should be for the same timepoint.

# Output:
# data.frame containing subjbect id and adsct.

# unweighted mean cortical thickness
calc_adsct <- function(lhct, rhct, type = NULL) {
  # required libraries
  require(dplyr)
  require(magrittr)

  # rename aparc.thickness to ID
  lhct <- lhct %>%
    rename(ID = lh.aparc.thickness)

  rhct <- rhct %>%
    rename(ID = rh.aparc.thickness)

  # merge hemispheres
  ct <- inner_join(lhct, rhct, by = "ID")

  # helper function to calculate ADSCT from Jack et all., 2015
  # calculate adsct. ROIs (8 bilateral) are taken from Jack et al., 2017.
  if (type == "jack") {
    adsct <- ct %>%
      mutate(adsct = rowMeans(dplyr::select(., contains(
        c(
          "middletemporal",
          "inferiortemporal",
          "entorhinal",
          "fusiform"
        )
      )), na.rm = TRUE))
  } else if (type == "schwarz") {
    adsct <- ct %>%
      mutate(adsct = rowMeans(dplyr::select(., contains(
        c(
          "entorhinal",
          "inferiortemporal",
          "middletemporal",
          "inferiorparietal",
          "fusiform",
          "precuneus"
        )
      )), na.rm = TRUE))
  } else if (type == "dickerson") {
    adsct <- ct %>%
      mutate(adsct = rowMeans(dplyr::select(., contains(
        c(
          "inferiortemporal",
          "middletemporal",
          "temporalpole",
          "inferiorparietal",
          "superiorparietal",
          "superiorfrontal",
          "inferiorfrontal",
          "precuneus"
        )
      )), na.rm = TRUE))
  }

  #     #regress with the Aging signature (excluding regions overlapping with AD signature regions
  #     rois_ad = ct %>%
  #       dplyr::select(c(

  #         middletemporal,
  #             temporalpole,
  #             inferiortemporal,
  #             angular,
  #             supramarginal,
  #             superiorparietal,
  #             precuneus,
  #             middlefrontal,
  #             superiorfrontal
  #       ))

  #       ct %>%
  #         mutate(adsct = rowMeans(dplyr::select(., contains(
  #           c(
  #             "middletemporal",
  #             "temporalpole",
  #             "inferiortemporal",
  #             "angular",
  #             "supramarginal",
  #             "superiorparietal",
  #             "precuneus",
  #             "middlefrontal",
  #             "superiorfrontal"
  #           )
  #         )), na.rm = TRUE))


  #  A: medial temporal, B: inferior temporal, C: temporal pole, D: Angular, E: superior frontal, F: superior parietal, G: supramarginal, H: precuneus, I: middle frontal, J: calcarine, K: caudal insula, L: cuneus, M: caudal fusiform, N: dorsomedial frontal, O: lateral occipital, P: precentral, Q: inferior frontal.

  #   } else if (type == "dickerson") {

  #   }

  #    %>%
  #      dplyr::select(ID, adsct)
  adsct %>%
    dplyr::select(ID, adsct) %>%
    return()
}
