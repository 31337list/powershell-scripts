$source = Read-Host "Enter the path of the mp3 file"
$destination = Read-Host "Enter the path where you want to save your flac file"

ffmpeg -i $source -c:a flac $destination\$((Get-Item $source).BaseName).flac

# This script uses FFmpeg which is a free and open-source software project that produces libraries and programs for handling multimedia data. 
# FFmpeg is a command-line tool that can convert audio and video files from one format to another.
# When you run this script, it will prompt you to enter the path of your mp3 file and the path where you want to save your flac file.
