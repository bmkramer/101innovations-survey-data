# Description of workflow to create network visualization of tools used together
- taking on [issue #11] (https://github.com/bmkramer/101innovations-survey-data/issues/11)
- using [Gephi] (https://gephi.org/) (version 0.9.1) as visualization tool
- for preset answer options only

## Source files
- co-occurrence matrix (created with [frequencies_of_bivariate_tool_use.R] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/frequencies_of_bivariate_tool_use.R)): [survey_presets_frequencies.csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/survey_presets_frequencies.csv)
- tool variables coupled with GEO and TMIE classification (to be used as modularities in network viz): [coupling_variables_toolID_TMIE_GEO.csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/coupling_variables_toolID_TMIE_GEO.csv)

## Step 1: Convert co-occurrence matrix for import in Gephi
Convert co-occurrence matrix for import in Gephi as described here: https://github.com/gephi/gephi/issues/1143.

This will require some permutations in the original co-occurence matrix ([survey_presets_frequencies.csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/survey_presets_frequencies.csv))

It would be great to have this step coded in R (but I'll probably do it in Calc for now):

- Replace numbers in first column with column headers transposed (as in last column)
- Remove last column
- Field separator: semicolon 

This resulting csv can be imported in Gephi and will be automatically processed into a node and edge table.

Resulting file: [survey_presets_frequencies_edgematrix.csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/survey_presets_frequencies_edgematrix.csv)

## Step 2: Upload converted co-occurrence matrix into Gephi

- In Gephi, use File > Open to import converted co-occurrence matrix
