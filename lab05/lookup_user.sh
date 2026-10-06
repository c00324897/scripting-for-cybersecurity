 #!/bin/bash

read -p "Enter a username to look up: " TARGET_USER
read -p "Enter a department to look up: " DEPARTMENT
echo "Searching the account list for: $TARGET_USER in department $DEPARTMENT"
grep "$TARGET_USER" intel/users.csv | grep "$DEPARTMENT" | awk -F ',' '{print "username: " $1;  print "Role: " $2; print "Status: " $3}'
