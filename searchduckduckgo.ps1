# Prompt user for input
$searchTerm = Read-Host "Enter a search term"

# Build search URL
$searchUrl = "https://duckduckgo.com/html/?q=$searchTerm"

# Invoke web request to search URL and get HTML content
$searchHtml = Invoke-WebRequest -Uri $searchUrl

# Parse HTML content to extract search results
$searchResults = $searchHtml.ParsedHtml.GetElementsByClassName("result")

# Loop through search results and display title, URL, and description for each
for ($i = 0; $i -lt 25; $i++) {
    $result = $searchResults[$i]
    $title = $result.GetElementsByClassName("result__title")[0].InnerText
    $url = $result.GetElementsByClassName("result__url")[0].InnerText
    $description = $result.GetElementsByClassName("result__snippet")[0].InnerText
    Write-Host "`nTitle: $title"
    Write-Host "URL: $url"
    Write-Host "Description: $description"
}
