#!/bin/bash

## Variables
## mysqlPassword="chaungoanbacho"
#mariaPassword="1"

## Read the content of the file (sql file)
## sqlFile=$(<main.sql)
## $1 is the filename just passed from the watch script
#sqlFile=$(<$1)

## Login to mysql passing the query with it
## mysql -u root "-p$mysqlPassword" -e "
#mysql --host 127.0.0.1 -P 3306 -u root "-p$mariaPassword" -e "
#system echo '';
#system echo '--*-- SQl result --*--'
#system echo '';

#$sqlFile" 

# Variables
# mysqlPassword="chaungoanbacho"
# mariaPassword="1"

# Read the content of the file (sql file)
# sqlFile=$(<main.sql)
# $1 is the filename just passed from the watch script
sqlFile=$(<$1)

# Format: postgresql://<username>:<password>@<host>:<port>/<database_name>?sslmode=require
psql postgresql://root:1@localhost:5432/shop_pet -f Execute.sql
