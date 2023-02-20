#!/bin/bash

# Variables
mysqlPassword="chaungoanbacho"

# Read the content of the file (sql file)
sqlFile=$(<main.sql)

# Login to mysql passing the query with it
# mysql -u root -pchaungoanbacho -e "$sqlFile" 
mysql -u root "-p$mysqlPassword" -e "$sqlFile" 
