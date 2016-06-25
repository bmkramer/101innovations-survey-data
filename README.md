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
- Field separator: **semicolon** 
- NB Column headers should not contain spaces

This resulting csv can be imported in Gephi and will be automatically processed into a node and edge table.

Resulting file: [survey_presets_frequencies_edgematrix.csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/survey_presets_frequencies_edgematrix.csv)

## Step 2: Import converted co-occurrence matrix into Gephi

- In Gephi, use File > Open to import converted co-occurrence matrix
- In the dialog screen that appears, choose 'undirected' as graph type and click OK
- The matrix will be imported, and the network will be shown in random layout. 

To assign colors, node size etc, information on node attributes will have to be added. In the next step, we will export the node and edge tables from Gephi and enhance the node table with information on attributes.

## Step 3: Export node and edge tables from Gephi
- In the tab Data Laboratory, select 'Nodes' in the menu bar and choose the option 'Export table'
- Choose the following settings:
  - Separator: Comma
  - Charset: UTF-8
  - Columns: Id, Label
- Click OK to start export; save the resulting csv file

- Next, select 'Edges' in the menu bar and choose the option 'Export table'  
- Choose the following settings:
  - Separator: Comma
  - Charset: UTF-8
  - Columns: Source, Target, Type, Id, Weight
- Click OK to start export; save the resulting csv file

Resulting files:
- [survey_presets_frequencies_edgematrix [Nodes].csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/survey_presets_frequencies_edgematrix%20%5BNodes%5D.csv)
- [survey_presets_frequencies_edgematrix [Edges].csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/survey_presets_frequencies_edgematrix%20%5BEdges%5D.csv)

## Step 4: Enhance node table with attributes 
Attributes to add:
- Label
- Weight
- Activity
- Phase
- TMIE
- GEO

- Take node table exported from Gephi ([survey_presets_frequencies_edgematrix [Nodes].csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/survey_presets_frequencies_edgematrix%20%5BNodes%5D.csv)) and modify/add columns as follows:
  - Replace names in column **Label** with unique tool names (e.g. Scopus (search); Scopus (impact); etc)
  - Add column **Weight** with frequency data for each tool (format: 18800)
  - Add column **Activity** with research activity as mentioned in the survey (Search, Access, Alerts, etc)
  - Add column **Phase** with research phase as mentioned in the survey (Discovery, Analysis, Writing, Publication, Outreach, Assessment)
  - Add column **TMIE** with TMIE-classification of each tool (Traditional, Modern, Innovative, Experimental)
  - Add column **GEO** with GEO-classification of each tool (Good, Efficient, Open, or a combination of two of these)

This step should really be coded in R as well (anyone?), but for now, I did it in Calc with VLOOKUP and some manual adjustments for unique tool names. 

Attributes can be retrieved from:
- survey data (cleaned) (**Weight**) (from [Zenodo] (http://dx.doi.org/10.5281/zenodo.49583) or [Kaggle] (https://www.kaggle.com/bmkramer/101-innovations-research-tools-survey))
- survey variable list (**Label**, **Activity**) (from [Zenodo] (http://dx.doi.org/10.5281/zenodo.49583) or [Kaggle] (https://www.kaggle.com/bmkramer/101-innovations-research-tools-survey))
- [tools database] (http://bit.ly/innoscholcomm-list) (**Phase**, linked to Activity)
- [coupling_variables_toolID_TMIE_GEO.csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/coupling_variables_toolID_TMIE_GEO.csv) (**Label**, **TMIE**, **GEO**)

Resulting file: [survey_presets_frequencies_edgematrix_[Nodes]_attributes.csv] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/survey_presets_frequencies_edgematrix_%5BNodes%5D_attributes.csv)

## Step 5: Import enhanced node table into Gephi
- In Gephi, select the tab Data Laboratory and choose 'Import spreadsheet'
- In the first dialog screen (**General options**), select the csv to upload, choose the following settings and click Next:
  - Separator: Comma
  - As table: Nodes table
  - Charset: UTF-8
- In the next dialog screen (**Import settings**), choose the following settings and click Finish:
  - All columns should be checked to idicate they are to be imported (default setting)
  - All columns except **Weight** should be of the type **String** (default setting)
  - Set type of column **Weight** to **Double**
  - Option 'Force nodes to be created as new ones' should be unchecked (default setting)

The node table will now be imported and all existing nodes will be updated with the new information. 

## Step 6: Create network visualization in Gephi
- In Gephi (with the data imported as described in step 5 above), select the tab 'Overview'. The network will be shown as an angry black spider web. We'll use various options in Gephi to make it look better. 
- *Node size* (use weight as attribute)
  - Appearance > Nodes > Size (circle-diameter icon)
  - Attributes > Weight
  - Min size: 10, Max size: 100, Spline: linear (default) (example values)
- *Node color* (use TMIE-classification as attribute)
  - Appearance > Nodes > Color (painter's palette icon)
  - Attributes > TMIE
  - Right click color squares to set colors (e.g. dark-light gradient of one color, with grey for #N/A)
- *Layout* (use Force Atlas 2 algorithm) 
  - Layout >  Force Atlas 2
  - Tick Prevent Overlap,Dissuade Hubs
  - Scaling 400
  - Tick Stronger Gravity
  - Gravity 0.25
  - Additional layout options: Expand, Label adjust
- *Labels*
  - In dropdown menu under graph display, choose Labels
  - Tick Node
  - Size: Node size
  - Font Arial Bold 32, use slider to adjust label size
  
  To see a preview of the graph, select the tab Layout. Adjust settings and click 'Refresh' to see the effect.
From here, you can also export the graph here as SVG/PDF/PNG

## Step 7: Clustering
- In Gephi (with the data imported as described in step 5a, optionally prettified using settings in step 6), go to tab Overview
- Select Statistics > Modularity > Run
- Tick Randomize > Use weights (default)
- Resolution: try various resolutions to see the effect on the number of clusters generated (e.g. resolution 0.9 gives 7 communities)

To filter for different clusters:
- Select Filters > Attributes > Partition > Modularity class (Nodes)
- In Queries, select cluster you want to filter on, click Filter

## Step 8 Save/export
- File > Export 
- Choose Graph file to export as .gephi file (to work on in Gephi) or .gexf to use in other programs 
- Choose SVG/PDF/PNG to export as... those. 

## Resulting files 
- Graph files:
  -  [Survey_network_test1.gephi] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/Survey_network_test1.gephi)
  -  [Survey_network_test1.gexf] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/Survey_network_test1.gexf)
- Images
  - [Complete network] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/Survey_network_test1.png)
  - Clusters: [0] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/Survey_network_test1_cluster0.png), [1] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/Survey_network_test1_cluster1.png), [2] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/Survey_network_test1_cluster2.png), [3] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/Survey_network_test1_cluster3.png), [4] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/Survey_network_test1_cluster4.png), [5] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/Survey_network_test1_cluster5.png), [6] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/Survey_network_test1_cluster6.png)

## Some remarks
- Because in this case, basically all nodes are connected to all other nodes (only differing in edge weight), there are no separate clusters in the overall network view. Cluster detection (step 7) is thus done solely based on edge weight. The cluster detection algorithm Gephi uses is the [Louvain method for community detection] (https://en.wikipedia.org/wiki/Louvain_Modularity)
- In the default image export, nodes at the edges often have their labels cut off. To fix this, in the graph display in the Overview tab, drag the respective nodes to a slightly more central position. 

![Complete network](https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/Survey_network_test1.png)

![Cluster examples] (https://github.com/bmkramer/101innovations-survey-data/blob/network_viz/Cluster%20examples.png)
