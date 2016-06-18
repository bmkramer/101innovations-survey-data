# Description of workflow used to create network visualization of tools used together (preset answer options only)
- taking on [issue #11] (https://github.com/bmkramer/101innovations-survey-data/issues/11)
- using [Gephi] (https://gephi.org/) as visualization tool
- for preset answer options only

## Source files
- co-occurrence matrix (created with [frequencies_of_bivariate_tool_use.R] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/frequencies_of_bivariate_tool_use.R)): [survey_presets_frequencies.csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/survey_presets_frequencies.csv)
- tool variables coupled with GEO and TMIE classification (to be used as modularities in network viz): [coupling_variables_toolID_TMIE_GEO.csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/coupling_variables_toolID_TMIE_GEO.csv)

## Step 1: Convert co-occurrence matrix for import in Gephi
I hope to start with the adjacency matrix of co-occurrence frequencies and load that into Gephi as per here: gephi/gephi#1143.

This will require some permutations that would be great if coded into R (but I'll probably do them in Calc for now):

replace column names in first row with sequential numbers (as in first column), remove last column (with names)
create separate csv with two columns: sequential numbers and names (e.g. current first and last column

The first permutation is necessary to import the csv into Gephi and have it processed properly into an edge table
The second permutation enables import in Gephi as node table.
