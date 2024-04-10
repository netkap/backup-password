# backup-password-shell
 <h2>This creates  a script called backup.sh which runs every day and automatically backs up any encrypted password files that have been updated in the past 24 hours.</h2>
 <h3>Step 1</h3>
 <p>Set two variables equal to the values of the first and second command line arguments, as follows:
Set targetDirectory to the first command line argument
Set destinationDirectory to the second command line argument
This Step is meant to help with code readability
</p>
 <h3>Step 2</h3>
 <p>Display the values of the two command line arguments in the terminal.</p>
  <h3>Step 3</h3>
  <p>Define a variable called currentTS as the current timestamp, expressed in seconds.</p>
    <h3>Step 4</h3>
    <p>Define a variable called backupFileName to store the name of the archived and compressed backup file that the script will create.</p>
    <h3>Step 4</h3>
    <p>Define a variable called backupFileName to store the name of the archived and compressed backup file that the script will create.</p>
    <h3>Step 5</h3>
    <p>Define a variable called origAbsPath with the absolute path of the current directory as the variable's value.</p>
    <h3>Step 6</h3>
    <p>Define a variable called destAbsPath whose value equals the absolute path of the destination directory.</p>
    <h3>Step 7</h3>
    <p>Change directories from the current working directory to the target directory targetDirectory.</p>
    <h3>Step 8</h3>
    <p>Find all files whose last-modified date was 24 hours ago or less.  
    Define a numerical variable called yesterdayTS as the timestamp (in seconds) 24 hours prior to the current timestamp, currentTS</p>
    <h3>Step 9</h3>
    <p>Within the $() expression inside the for loop, write a command that will return all files and directories in the current folder.</p>
    <h3>Step 10</h3>
    <p>Inside the for loop, check whether the $file was modified within the last 24 hours.</p>
    <h3>Step 11</h3>
    <p>In the if-then statement, add the $file that was updated in the past 24-hours to the toBackup array.</p>
    <h3>Step 12</h3>
    <p>After the for loop, compress and archive the files, using the $toBackup array of filenames, to a file with the name backupFileName.</p>
    <h3>Step 13</h3>
    <p>Now the file $backupFileName is created in the current working directory.</p>
    


