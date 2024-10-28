#!/bin/bash

TOKEN="your token"

# Get all project IDs
projects=$(curl -s -H "Authorization: Bearer $TOKEN" "https://api.vercel.com/v1/projects" | jq -r '.[].id')

# Loop through and delete each project
for project in $projects; do
    echo "Deleting project: $project"
    curl -X DELETE -H "Authorization: Bearer $TOKEN" "https://api.vercel.com/v1/projects/$project"
done
