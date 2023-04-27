# ask the user for an input file, then determine the media filetype of that input file, then ask them what media type they want to convert it to, 
# and then convert it to that file format after asking them for an output filename:
$InputFile = Read-Host "Enter input file path"
$FileType = (Get-Item $InputFile).Extension
$OutputType = Read-Host "Enter output file type"
$OutputFile = Read-Host "Enter output file path"

ffmpeg -i $InputFile $OutputFile.$OutputType

# This script uses ffmpeg to convert media files. 

#   https://ffmpeg.org/
