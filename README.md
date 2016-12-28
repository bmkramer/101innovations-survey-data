![Stringing beads](Stringing_beads_cropped.jpg)

# Stringing beads - identifying research workflows from tool usage data (clustering)
- using data from our recent [global survey on Innovations in Scholarly Communication] (http://101innovations.wordpress.com)
- this is a subbranch from master repo [101innovations-survey-data] (https://github.com/bmkramer/101innovations-survey-data)

## About

The results of our 2015-2016 survey on research tool usage can provide insights into current practices across various fields, research roles, countries and career stages, and can be useful for researchers interested in changing research workflows. 

Based on co-occurrences of tools/platforms, we aim to identify typical research workflows. Previously, we identified tool combinations (from the 119 preset tools/platforms in our survey) that are used together more or less often than expected by chance (for details see our blogpost [Tools that love to be together](https://101innovations.wordpress.com/2016/11/06/tools-that-love-to-be-together/)).

To extend this analysis from separate tool combinations into groups of tools typifying full research workflows, one of the possibilities is looking at cliques.

## Cliques: tools that are linked together as a group
Based on our co-occurrence data, we can identify groups of tools that are all specifically used with *all* other tools in that group. In network theory, such groups are called 'cliques'. 

To identify cliques in our dataset, we made use of the R package [igraph](http://igraph.org/r/). Information on importing graph data and analyzing cliques was obtained from the following websites:
- [http://www.shizukalab.com/toolkits/sna/sna_data] (http://www.shizukalab.com/toolkits/sna/sna_data)
- [http://finzi.psych.upenn.edu/library/igraph/html/cliques.html] (http://finzi.psych.upenn.edu/library/igraph/html/cliques.html)

The source data ([values_survey_hypergeometric_1s.csv] (values_survey_hypergeometric_1s.csv)) is a matrix of assigned values (1, 0 or NA) for all tool combinations, indicating significant p-values for the 2-tailed cumulative hypergeometric test used to determine whether tool combinations occur more or less often together than expected by chance. For identifying cliques, only those tools combinations occurring together more often than expected by chance were assigned a value of 1. 

When running the clique analysis script ([igraph_cliques.R] (igraph_cliques.R)) on our hypergeometric test data, we found that the largest cliques in our set of tools consist of 17 tools. We identified 8 of these cliques, which are partially overlapping. In total, there are over 3000 'maximal cliques' (cliques that cannot be enlarged) in our dataset of 119 preset tools, varying in size from 3 tot 17 tools. 

![cluster results preset tools 101 innovations survey] (survey_heatmap_p-values_2-tailed_coded_RG_white.png)

For more information and interpretation of the results, see our blogpost [Stringing beads: from tool combinations to workflows] [add link when published]

## Further Information

- The project [Innovations in Scholarly Communication] (https://101innovations.wordpress.com/about-1/)
- The survey dataset on [Kaggle] (https://www.kaggle.com/bmkramer/101-innovations-research-tools-survey) where scripts can be written, executed and shared

![101 Innovations in Scholarly Communication](InnoScholComm_figure_jan2015_rising_sun_compressed.png)
