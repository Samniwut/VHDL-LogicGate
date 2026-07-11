#!/bin/bash

# Script to commit changes with a message prompt
read -p "Enter commit message: " message

if [ -z "$message" ]; then
  echo "Commit message cannot be empty!"
  exit 1
fi

git add .
git commit -m "$message"

echo "Commit successful!"
