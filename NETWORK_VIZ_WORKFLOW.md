# Description of workflow to create network visualization of tools used together
- taking on [issue #11] (https://github.com/bmkramer/101innovations-survey-data/issues/11)
- using [Gephi] (https://gephi.org/) as visualization tool
- for preset answer options only

## Source files
- co-occurrence matrix (created with [frequencies_of_bivariate_tool_use.R] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/frequencies_of_bivariate_tool_use.R)): [survey_presets_frequencies.csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/survey_presets_frequencies.csv)
- tool variables coupled with GEO and TMIE classification (to be used as modularities in network viz): [coupling_variables_toolID_TMIE_GEO.csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/coupling_variables_toolID_TMIE_GEO.csv)

## Step 1: Convert co-occurrence matrix for import in Gephi
Convert co-occurrence matrix for import in Gephi as described here: https://github.com/gephi/gephi/issues/1143.

This will require creating two copies of the co-occurrence matrix (see 'source files' above), with some permutations.  It would be great to have this step coded in R (but I'll probably do it in Calc for now):

A) Replace column names in first row with sequential numbers (as in first column), remove last column (with names)
This will create a csv that can be imported in Gephi and will be automatically processed into an edge table.

Resulting file: 

B) Only keep first and last column (sequential numbers, names). Replace names with unique tool names (e.g. Scopus (search), Scopus (impact)). Add columns for research activity, research phase, TMIE en GEO classification. 
This csv can be imported into Gephi as node table. 

Resulting file: 

