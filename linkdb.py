#! /usr/bin/python

##
# Cleans the database.
#
#
# Note: requires the fuzzywuzzy python library
## Chris van Run, Mozilla sprint, 2 juni 2016

import csv
import re

from fuzzywuzzy import fuzz
from fuzzywuzzy import process

def read_tool_db():
	dict = {}
	with open('tool_db.csv', 'rt') as csvfile:
	    csvreader = csv.reader(csvfile, delimiter=';', quotechar='"')
	    next(csvreader, None)  # skip the headers
	    for id, tool_name in csvreader:
	        dict[tool_name] = id
	return dict

def read_variable_db():
	dict = {}
	with open('variable_db.csv', 'rt') as csvfile:
	    csvreader = csv.reader(csvfile, delimiter=';', quotechar='"')
	    next(csvreader, None)  # skip the headers
	    for column_name, tool_name in csvreader:
	    	tool_name = tool_name[tool_name.find('-')+1:]
	        dict[tool_name] = column_name
	return dict

def clean_db(database):
	new_database = {}
	for key in database.keys():
		new_database[clean_key(key)] = database[key]
	return new_database;

def clean_key(key):
	new_key = key.strip()
	new_key = new_key.lower()
	new_key = new_key.replace(' ','')
	return new_key

toolDB = read_tool_db()
variableDB = read_variable_db()

cleaned_variableDB = clean_db(variableDB)
cleaned_toolDB = clean_db(toolDB)

index = 1
for key_toolDB in cleaned_toolDB.keys():
	for key_varDB in cleaned_variableDB:
		match_ratio = fuzz.ratio(key_varDB, key_toolDB)
		if match_ratio> 70:
			print index,": [",match_ratio,"  ]","\t\t",key_varDB,"\t<=>\t",key_toolDB
			index = index+1


