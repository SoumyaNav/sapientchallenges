# Create a Resource Group

$resourceGroupName = "challenge_1"
$location = "East US"  

New-AzResourceGroup -Name $challenge_1 -Location $East US

#Create Virtual Networks

$frontendVnet = "chfrontendvnet"
$middleTierVnet = "chmvnet"
$backendVnet = "chbackendvnet"

# Create virtual networks
New-AzVirtualNetwork -Name $chfrontendvnet -ResourceGroupName $challenge_1 -Location $East US -AddressPrefix "10.0.1.0/24"
New-AzVirtualNetwork -Name $chmvnet -ResourceGroupName $challenge_1 -Location $East US -AddressPrefix "10.0.2.0/24"
New-AzVirtualNetwork -Name $chbackendvnet -ResourceGroupName $challenge_1 -Location $East US -AddressPrefix "10.0.3.0/24"
#Create Virtual Machines
$vmConfig = @{
ResourceGroupName = $challenge_1
Location = $East US
NetworkProfileName = "cvm1-vnet / default" 
SubnetId = "cvm1813_z1" 
VMSize = "Standard_DS2_v2"
AdminUsername = "Soumya"
AdminPassword = "Ridhi@1234567890" | ConvertTo-SecureString -AsPlainText -Force
}
# Create the frontend VM
New-AzVM @vmConfig -Name "FrontendVM" -Image "Windows Server 2019 Datacenter - x64 Gen2"
# Create the middle tier VM
New-AzVM @vmConfig -Name "MiddleTierVM" -Image "Windows Server 2019 Datacenter - x64 Gen2"
# Create the backend VM
New-AzVM @vmConfig -Name "BackendVM" -Image "Windows Server 2019 Datacenter - x64 Gen2"