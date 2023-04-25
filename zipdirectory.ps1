$sourceFolder = Read-Host "Enter the source folder path: "
$destinationFile = Read-Host "Enter the destination zip file name: "
Compress-Archive -Path $sourceFolder -DestinationPath $destinationFile

# The first line asks the user to enter the source folder path using the Read-Host cmdlet and saves it in the $sourceFolder variable.

# The second line asks the user to enter the destination zip file name using the Read-Host cmdlet and saves it in the $destinationFile variable.

# The third line uses the Compress-Archive cmdlet to create a zip file containing the contents of the source folder specified by $sourceFolder. 
# The -DestinationPath parameter specifies the path and name of the zip file to be created, which is specified by the $destinationFile variable.
