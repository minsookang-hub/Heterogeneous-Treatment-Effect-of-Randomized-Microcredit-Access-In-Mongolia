# --- Load packages ---
library(haven)   # read_dta
library(dplyr)   # wrangling

# --- Read in both files ---
master <- read_dta("~/Downloads/Attanasio et al/Master.dta")
outcomes <- read_dta("~/Downloads/Attanasio et al/all_outcomes_controls.dta")

# --- Check keys exist in both ---
# Should both have hhid + followup
names(master)[1:20]
names(outcomes)[1:20]

# --- Merge on hhid and followup ---
merged_full <- inner_join(master, outcomes, by = c("hhid", "followup"))

# --- Inspect results ---
dim(master)       # original size
dim(outcomes)
dim(merged_full)  # after merge

# --- Save for Python ---
write.csv(merged_full, "merged_full.csv", row.names = FALSE)


view(merged_full)
view(merged_full$totalexp)
