#!/bin/bash

echo '===================================================================================='
echo 'Lets check MySQL conneciton works..'
echo 'If the following variables are NOT populated it means you need to import the .env where you should have all your VARs and local secrets'.
echo '===================================================================================='
echo "DB_HOST: '$DB_HOST'"
echo "DB_NAME: '$DB_NAME'"
echo "DB_USER: '$DB_USER'"
echo "DB_PASS: '$DB_PASS'"
echo '===================================================================================='
echo Command:
echo mysql -u "$DB_USER" "-p$DB_PASS" $DB_NAME -h "$DB_HOST"

# todo set -x like echodo
echodo mysql -u "$DB_USER" "-p$DB_PASS" $DB_NAME -h "$DB_HOST"
yellow "mysql -u $DB_USER -p'$DB_PASS' $DB_NAME -h $DB_HOST"
echo 'Show tables;' | mysql -u "$DB_USER" "-p$DB_PASS" -h "$DB_HOST"
