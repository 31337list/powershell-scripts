# Prompt user for input
$searchTerm = Read-Host "Enter a search term"

# Build search URL
$searchUrl = "https://www.bing.com/search?q=$searchTerm"

# Invoke web request to search URL and get HTML content
$searchHtml = Invoke-WebRequest -Uri $searchUrl

# Parse HTML content to extract search results
$searchResults = $searchHtml.ParsedHtml.GetElementsByClassName("b_algo")

# Loop through search results and display title, URL, and description for each
for ($i = 0; $i -lt 25; $i++) {
    $result = $searchResults[$i]
    $title = $result.GetElementsByTagName("a")[0].InnerText
    $url = $result.GetElementsByTagName("a")[0].href
    $description = $result.GetElementsByClassName("b_caption")[0].GetElementsByClassName("b_snippet")[0].InnerText
    Write-Host "`nTitle: $title"
    Write-Host "URL: $url"
    Write-Host "Description: $description"
}
