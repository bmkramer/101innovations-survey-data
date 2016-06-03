# clustering van tools vraag bianca
# 
# mvp:
# alleen presets 
# search en acces alleen
# 
survey_cleaned <- readr::read_csv("datafiles/survey_cleaned.csv") # I love the 
# readr package, but you could also use read.csv("datafiles/survey_cleaned.csv",stringsAsFactors = FALSE)

#### The following script creates a seperate dataframe with the length and width
#### of the number of variables you select. So if we select 15 variables, the frequencies
#### table will have 15 rows and 15 columns.
#### 
#### it worked relatively fast with 30 variables, but the full set will
#### take some time probably. I have tried to comment extensively so that
#### non-r users can understand every step. 
#### 
#### Roel M. Hogervorst { 2016-06-03}
###### contact me at:    ###############
#### https://github.com/RMHogervorst
#### hogervorst.rm@gmail.com
#### ###################################
#### There are three scripts here, one that creates a seperate dataset with 
#### 1 and 0s.
#### 
#### one that creates an empty frequency table 
#### 
#### 
#### I created a seperate data frame with 1 and zero's first. This is not 
#### entirely necessary, but would require a bit more work.
#### 
# First we select the columns 13 till 164. those contain the tools
# but I don't want the free text variables. So the function grep
# searches for "SPECCL", which is in every variablename that has freetext.
# it searches within the names of the colomns 13 till 164 and returns the numbers
# of the columns that do NOT (invert= TRUE) contain "SPECCL". 
# Those numbers are assigned to colnumbers.
colnumbers <-c(13:164)[grep("SPECCL", names(survey_cleaned)[13:164], invert = TRUE)]
variable_vector <- colnumbers

## Then a transformation  ###############################################
## we asssign to `test` the end result of the entire chain.
## starting with survey_cleaned, 
## then 
## selecting the columns we defined in colnumbers
## then
## apply a function to columns (e.g. 2), that is a custom function:
## if the item in the column is missing put a zero, else put a one.
## This results in a smaller data frame with 1 and 0s.
library(dplyr)#but selection of columns is also possible without this package
# with apply(survey_cleaned[,colnumbers], 2, function(x)ifelse(is.na(x), 0,1))
test <-survey_cleaned %>%
    select(colnumbers)%>%  # only colnumbers
    apply(2, function(x)ifelse(is.na(x), 0,1))


# this function creates a frequency data frame.  ###############################
# valid inputs for the first argument are names of data frames
# valid inputs for the second argument are vectors such as:
# c(1:30) # which is a list of numbers from 1 till 30
# or simply a range of numbers e.g.
# 1:30
# 
create_frequenciestable<- function(data.frame.name, variable_vector){
    rows <- length(variable_vector)              #assign to rows the length of variable vector
    varnames <-colnames(data.frame.name[,variable_vector])   # put the columnnames in varnames
    frequencies <- data.frame(matrix(NA, ncol = length(varnames), nrow = rows)  ) #create matrix
    # with NA (missing) everywhere, varnames long and wide could have use rows on both columns
    # and rows because the matrix will always be a square with equal sides. 
    # Turn that matrix into a data frame
    names(frequencies) <- varnames   # name the data frame columns after varnames
    frequencies$NAME <- varnames     # add a new column with varnames 
    frequencies                     # return the resulting object frequencies.
}

# creating a frequencies table  ##############################
# We now use the previously defined function to create a new data frame called frequencies
frequencies <- create_frequenciestable(test, 1:30)

# a function to place the frequency into a cell    #####################
place_frequency <- function( dataframe, i, j){
    result <- sum(dataframe[,i][dataframe[,j]==1])     
    result
}
# frequencies[1,"GSCHOLSEARCH"] <- place_frequency(test, 1, "GSCHOLSEARCH")
# frequencies[i,j] <- sum(dataframe[,i][dataframe[,i]==1]) 
# 
# place_frequency(test, 1, "WOSSEARCH")

vars <- names(frequencies)[-length(names(frequencies))] # een beetje ingewikkelde manier om de laatste variable
# er uit te gooien, een andere (iets veiligere manier is met behulp van grep): 
# names(frequencies)[grep("NAME", names(frequencies),invert = TRUE)]

#### this loop will fill the frequency table.
for (i in 1:nrow(frequencies)) {
    for (j in vars) {
        frequencies[i,j] <- place_frequency(dataframe =  test, i, j)
    }
}

#### This should fill al the cells with frequency counts. (you should probably spot check 
#### if the numbers are indeed correct)
