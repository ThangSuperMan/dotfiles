#!/bin/bash

# Variables
# mysqlPassword="chaungoanbacho"
mariaPassword="1"

# Read the content of the file (sql file)
sqlFile=$(<main.sql)

# Login to mysql passing the query with it
# mysql -u root "-p$mysqlPassword" -e "
mysql --host 127.0.0.1 -P 3003 -u root "-p$mariaPassword" -e "
system echo '';
system echo '--*-- SQl result --*--'
system echo '';

$sqlFile" 
