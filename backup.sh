#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [STEP 1]
targetDirectory=$1
destinationDirectory=$2

# [STEP 2]
echo "targetDirectory is $1"
echo "destinationDirectory is $2"

# [STEP 3]
currentTS=`$(date +%s)`

# [STEP 4]
backupFileName="backup-[$currentTS].tar.gz"

# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# [STEP 5]
origAbsPath=$(pwd)

# [STEP 6]
cd $destinationDirectory
destDirAbsPath=$destinationDirectory

# [STEP 7]
cd $origAbsPath
cd $targetDirectory

# [STEP 8]
yesterdayTS=$($currentTS-86400)

declare -a toBackup

for file in $(ls) # [STEP 9]
do
  # [STEP 10]
  if (('date -r $file +%s' >$yesterdayTS))
  then
    # [STEP 11]
	toBackup+=$(file)
  fi
done

# [STEP 12]
tar -czvf $backupFileName ${toBackup[@]}

# [STEP 13]
mv $backupFileName $destinationDirectory

