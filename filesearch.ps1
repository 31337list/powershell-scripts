
$searchTerm = Read-Host -Prompt 'Enter search term: '

$results = Get-ChildItem -Path $env:USERPROFILE -Recurse -Include "$searchTerm.*" | Select-Object FullName

if ($results) {
    Write-Host "Matches found:"
    Write-Output $results

    $openFolder = Read-Host -Prompt "Do you want to open the folder containing each file? (Y/N)"

    if ($openFolder.ToLower() -eq "y") {
        $results | ForEach-Object { Invoke-Item (Split-Path $_.FullName) }
    }
} else {
    Write-Host "No matches found."
}


# Explanation:

#  The script prompts the user to enter a search term using the `Read-Host` cmdlet and stores the input in the `$searchTerm` variable.
#  The `Get-ChildItem` cmdlet is used to search for files with the specified name (including any extension) in the user's profile directory and all of its subdirectories (`-Recurse` flag).
#  The `-Include` parameter is used to specify the search term as a wildcard pattern (`$searchTerm.*`) to include any file with a matching name, regardless of its extension.
#  The `Select-Object FullName` cmdlet is used to output the full file path of each matching file.
#  If any matches are found, the script displays a message and the list of matches using the `Write-Host` and `Write-Output` cmdlets. If no matches are found, a message is displayed indicating this.
#  The script then prompts the user with a question using the `Read-Host` cmdlet, asking if they want to open the folder containing each file.
#  If the user answers "yes" (by typing "y" or "Y"), the script uses a `ForEach-Object` loop to iterate through the list of matching files and call the `Invoke-Item` cmdlet with the folder path for each file (`Split-Path $_.FullName`). This will open each folder in Windows Explorer.
