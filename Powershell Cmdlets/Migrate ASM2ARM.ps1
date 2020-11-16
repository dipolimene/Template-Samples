Get-AzureVnetSite | Select -Property Name

$vnetName = "Group dipo dipo"

Move-AzureVirtualNetwork -Validate -VirtualNetworkName $vnetName

Move-AzureVirtualNetwork -Prepare -VirtualNetworkName $vnetName

Move-AzureVirtualNetwork -Commit -VirtualNetworkName $vnetName


$storageAccountName = "labdemostore"

Move-AzureStorageAccount -Validate -StorageAccountName $storageAccountName

Move-AzureStorageAccount -Prepare -StorageAccountName $storageAccountName

Move-AzureStorageAccount -Commit -StorageAccountName $storageAccountName

