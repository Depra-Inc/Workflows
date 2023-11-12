#!/bin/bash

package_name=$(jq -r '.name' package.json)
echo "Package name: $package_name"

commit_version=$(jq -r '.version' package.json)
echo "Commit version: $commit_version"

latest_version=$(npm info ${package_name} version)
echo "Latest version: $latest_version"

if [ "$latest_version" \> "$commit_version" ] || [ "$latest_version" = "$commit_version" ]; then
  echo "Version must be greater than ${latest_version}! Stopping job."
  echo "status=failure" >> $GITHUB_OUTPUT
else
  echo "status=success" >> $GITHUB_OUTPUT
  echo "name=${package_name}" >> $GITHUB_OUTPUT
  echo "version=${commit_version}" >> $GITHUB_OUTPUT
fi