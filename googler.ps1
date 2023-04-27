#googler

# Prompt user for input
$searchTerm = Read-Host "Enter a search term"

# Build search URL
$searchUrl = "https://www.google.com/search?q=$searchTerm"

# Invoke web request to search URL and get HTML content
$searchHtml = Invoke-WebRequest -Uri $searchUrl -UseBasicParsing

# Parse HTML content to extract search results
$searchResults = $searchHtml.ParsedHtml.GetElementsByClassName("g")

# Loop through search results and display title, URL, and description for each
for ($i = 0; $i -lt 25; $i++) {
    $result = $searchResults[$i]
    $title = $result.GetElementsByClassName("LC20lb DKV0Md")[0].InnerText
    $url = $result.GetElementsByClassName("TbwUpd NJjxre")[0].GetElementsByTagName("a")[0].href
    $description = $result.GetElementsByClassName("aCOpRe")[0].InnerText
    Write-Host "`nTitle: $title"
    Write-Host "URL: $url"
    Write-Host "Description: $description"
}


# The script prompts the user for a search term, constructs the search URL, and then uses PowerShell's Invoke-WebRequest cmdlet to retrieve the HTML content of the search results page. It then uses the HTML Agility Pack library to parse the HTML content and extract the search results.

# The script loops through the first 25 search results and displays the title, URL, and description for each result in the PowerShell window.

# Note that this script relies on Google's HTML structure for search results, so if Google changes their HTML structure in the future, this script may no longer work as expected.
