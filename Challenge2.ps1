# Get the current VM's resource group and name
$vmResourceGroupName = (Get-AzVM -ResourceGroupName "<challenge_1>" -Name "<cvm1>").ResourceGroupName
$vmName = (Get-AzVM -ResourceGroupName $challenge_1 -Name "<cvm1>").Name

# Query the instance# Authenticate to Azure (you can use other authentication methods as well)
 metadata using the Azure REST API
$metadataUri = "http://169.254.169.254/metadata/instance?api-version=2021-02-01"

$metadata = Invoke-RestMethod -Uri $metadataUri -Headers @{ Metadata = "true" }

# Convert the metadata to JSON
$metadataJson = $metadata | ConvertTo-Json

# Print the JSON-formatted metadata
Write-Host $metadataJson