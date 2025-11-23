#!/bin/bash

personal_gihub_username="501urchin"
personal_gihub_email="jaychhitu@gmail.com"
 
school_gihub_email="jaychhitu@gmail.com"
school_gihub_email="gopher93185789"

if [ -z "$1" ]; then
    echo "No argument provided"
    exit
fi

if [ "$1" = "personal" ]; then
    echo "switched to personal github"
    git config user.name $personal_gihub_username
    git config user.email $personal_gihub_email
fi

if [ "$1" = "school" ]; then
    echo "switched to school github"
    git config user.name $school_gihub_email
    git config user.email $school_gihub_email
fi

git config --get user.email
git config --get user.name
