#! /usr/bin/python

##
# Cleans the database.
#
#
## Chris van Run, Mozilla sprint, 2 juni 2016

import csv


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
	    for collumn_name, tool_name in csvreader:
	        dict[tool_name] = collumn_name
	return dict

toolDB = read_tool_db()
variableDB = read_variable_db()

print toolDB
print variableDB
