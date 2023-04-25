# PDF TO TEXT #
# This script uses the iTextSharp library to extract text from a PDF file and save it to a text file. 
# You’ll need to have the iTextSharp library installed on your system and update the path to the itextsharp.dll
# file in the script

# Prompt the user for the source and destination file paths
$sourceFilePath = Read-Host -Prompt "Enter the path to the source file"
$destinationFilePath = Read-Host -Prompt "Enter the path to the destination file"

# Load the required assembly
Add-Type -Path "C:\path\to\itextsharp.dll"

# Create a PDF reader object
$pdfReader = New-Object iTextSharp.text.pdf.PdfReader($sourceFilePath)

# Create a string builder to hold the extracted text
$stringBuilder = New-Object System.Text.StringBuilder

# Loop through each page in the PDF
for ($page = 1; $page -le $pdfReader.NumberOfPages; $page++) {
    # Extract the text from the current page
    $text = [iTextSharp.text.pdf.parser.PdfTextExtractor]::GetTextFromPage($pdfReader, $page)

    # Append the extracted text to the string builder
    $stringBuilder.AppendLine($text)
}

# Write the extracted text to the destination file
[System.IO.File]::WriteAllText($destinationFilePath, $stringBuilder.ToString())

# Close the PDF reader
$pdfReader.Close()
