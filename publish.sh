#!/bin/sh

if ! hugo_loc="$(type -p "hugo")" || [[ -z $hugo_loc ]]; then
		brew install hugo;
fi

if ! git_loc="$(type -p "git")" || [[ -z $git_loc ]]; then
		brew install git;
fi

# Generate the newly created/changed content and place the output on
#    the docs directory
hugo -d docs;

# Add all of the changes to git
git add .;

# Commit the changes to the branch
git commit -m 'New Changes $(date)';

# Push the changes onto the latest master branch
git push -f origin master;
