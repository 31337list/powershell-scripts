# MP4 TO MP3
# this is a simple powershell script to convert mp4 files to mp3 files
#Make sure to have the NAudio library installed on your system for this 
#script to work. You can install it using the following command:
# Install-Package NAudio -ProviderName NuGet

# Prompt the user for the source and destination file paths
$sourceFilePath = Read-Host -Prompt "Enter the path to the source file"
$destinationFilePath = Read-Host -Prompt "Enter the path to the destination file"

# Load the required assembly
Add-Type -AssemblyName System.Windows.Media

# Create a media element
$mediaElement = New-Object System.Windows.Controls.MediaElement

# Set the source of the media element to the source file
$mediaElement.Source = New-Object System.Uri($sourceFilePath)

# Wait for the media to load
while ($mediaElement.NaturalDuration.TimeSpan -eq [System.TimeSpan]::Zero) {
    Start-Sleep -Milliseconds 100
}

# Get the audio stream from the media element
$audioStream = $mediaElement.AudioStream

# Create a wave stream from the audio stream
$waveStream = New-Object NAudio.Wave.WaveChannel32($audioStream)

# Create an MP3 file writer
$mp3FileWriter = New-Object NAudio.Lame.LameMP3FileWriter($destinationFilePath, $waveStream.WaveFormat, 128)

# Write the wave stream to the MP3 file writer
[NAudio.Wave.WaveFileWriter]::WriteWavFileToStream($mp3FileWriter, $waveStream)

# Close the MP3 file writer
$mp3FileWriter.Close()
