#!/bin/bash
read -p "enter username: " USERNAME
read -s -p "enter password: " PASSWORD
echo "Credentials captured for $USERNAME (password length: ${#PASSWORD})"

