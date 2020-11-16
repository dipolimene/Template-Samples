_______________________________________________________________________________________________________________________________________________________________

#LOGIN TO AZURE SUBSCRIPTION

Login-AzureRmAccount

#GET THE VARIOUS AZURE SUBSCRIPTION

Get-AzureRmSubscription
 
#SELECTS THE SUBSCRIPTION
 
Select-AzureRmSubscription -SubscriptionId 'xxxxxxxxxxxxxxxxxxx’

_______________________________________________________________________________________________________________________________________________________________

#CONVERTING MANAGED DISK TO UNMANAGED DISK

$sas = Grant-AzureRmDiskAccess -ResourceGroupName "dipo" -DiskName "csslabdipo1disk" -DurationInSecond 3600 -Access Read

#A SAS TOKEN IS GENERATED FROM THE MANAGED DISK TO BE CONVERTED AFTER STOPPING/DEALLOCATING THE MACHINE IT'S ATTACHED
#A STORAGE ACCOUNT IS CREATED, A CONTAINER IS CREATED IN ITS BLOB, THE PARAMETERS REQUIRED ARE THEN FILLED IN ACCORDINGLY

$sas = "https://md-mndlcszlh5gx.blob.core.windows.net/g5kzpq2rsz0d/abcd?sv=2017-04-17&sr=b&si=143d4808-14be-4993-852e-24ad0453bbb8&sig=47fL96qsNaZqzftwjS9LoWQ3jbAbt6eUeyx%2F1jy%2BIGM%3D" 
 
$destContext = New-AzureStorageContext –StorageAccountName "300pm" -StorageAccountKey "mnbxrxWfAOm+WGBucDlhlkyeqptkUdNPC4M0QZE9+hvnzUBlxM4IJKzEVa5dzO0GW2BjCU4ETQn0hjls7XGP2g=="

$blobcopy = Start-AzureStorageBlobCopy -AbsoluteUri $sas -DestContainer "300pm" -DestContext $destContext -DestBlob "300pm.vhd"
 
while(($blobCopy | Get-AzureStorageBlobCopyState).Status -eq "Pending")
{
    $blobCopy | Get-AzureStorageBlobCopyState
}

_______________________________________________________________________________________________________________________________________________________________

#CREATING AN UNMANAGED VM FROM AN UNMANAGED DISK.
#GET THE URI TO THE VHD TO BE USED FROM THE STORAGE ACCOUNT.

$nicname = "csslabdiponic1"

$subnet1Name = "default"

$vnetName = "csslabdiponet"
 

$pip = New-AzureRmPublicIpAddress -Name $nicname -ResourceGroupName "dipo" -Location "westus" -AllocationMethod Dynamic

$vnet = get-AzureRmVirtualNetwork -Name $vnetName -ResourceGroupName "dipo" 

$nic = New-AzureRmNetworkInterface -Name $nicname -ResourceGroupName "dipo" -Location "westus" -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $pip.Id

$vm = New-AzureRmVMConfig -VMName "csslabdipo" -VMSize "Standard_A2_v2"

$vm = Add-AzureRmVMNetworkInterface -VM $vm -Id $nic.Id 

$osDiskUri = "https://csslabdipostore.blob.core.windows.net/vhds/csslabdipo20180716112037.vhd"

$vm = Set-AzureRmVMOSDisk -VM $vm -Name "csslabdipo20180716112037" -VhdUri $osDiskUri -CreateOption attach -windows
New-AzureRmVM -ResourceGroupName "dipo" -Location "westus" -VM $vm

_______________________________________________________________________________________________________________________________________________________________

#PUTTING AN EXISTING UNMANGED MACHINE IN AVAILABILITY SET.
#THIS REQUIRES RECREATING THE MACHINE AFTER DELETING IT.
#GET THE AVAILABILITY SET AND ADD THE MACHINE TO IT.
#GET THE URI TO THE VHD TO BE USED FROM THE STORAGE ACCOUNT.

$resourceGroup = "dipo"
$vmName = "csslabdipo"
  
#DELETES THE MACHINE

Remove-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName 

$nicname = "csslabdiponic1"

$subnet1Name = "default"

$vnetName = "csslabdiponet"
 

$pip = New-AzureRmPublicIpAddress -Name $nicname -ResourceGroupName "dipo" -Location "westus" -AllocationMethod Dynamic

$vnet = get-AzureRmVirtualNetwork -Name $vnetName -ResourceGroupName "dipo" 

$nic = New-AzureRmNetworkInterface -Name $nicname -ResourceGroupName "dipo" -Location "westus" -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $pip.Id

$avset = Get-AzureRmAvailabilitySet -ResourceGroupName "dipo" -Name "csslabdipoas" 


$vm = New-AzureRmVMConfig -VMName "csslabdipo" -VMSize "Standard_A2_v2" -AvailabilitySetId $avset.Id

$vm = Add-AzureRmVMNetworkInterface -VM $vm -Id $nic.Id 



$osDiskUri = "https://csslabdipostore.blob.core.windows.net/vhds/csslabdipo20180716112037.vhd"

$vm = Set-AzureRmVMOSDisk -VM $vm -Name "csslabdipo20180716112037" -VhdUri $osDiskUri -CreateOption attach -windows
New-AzureRmVM -ResourceGroupName "dipo" -Location "westus" -VM $vm

_______________________________________________________________________________________________________________________________________________________________

#CREATING AN UNMANAGED GENERALIZED MACHINE
#STOPS THE MACHINE

Stop-AzureRmVM -ResourceGroupName em20 -Name unmanageddemovm

$vm = Get-AzureRmVM -ResourceGroupName dipo -Name css-lab-dipo -Status
$vm.Statuses

Set-AzureRmVm -ResourceGroupName em20 -Name unmanageddemovm -Generalized

Save-AzureRmVMImage -ResourceGroupName em20 -Name unmanageddemovm
    -DestinationContainerName unmanagedcontainer -VHDNamePrefix unmanageddiskimage

$imageURI = "https://unmanageddemovm.blob.core.windows.net/system/Microsoft.Compute/Images/unmanagedcontainer/unmanageddiskimage-osDisk.c7477590-0237-4b40-b511-1162d5cf0da0.vhd"

$rgName = "em20"
$subnetName = "unmanagedsubnet"
$singleSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix 10.0.0.0/24

$location = "West Europe"
$vnetName = "unmanagedvnet"
$vnet = New-AzureRmVirtualNetwork -Name $vnetName -ResourceGroupName $rgName -Location $location `
    -AddressPrefix 10.0.0.0/16 -Subnet $singleSubnet

$ipName = "unmanagedpip"
$pip = New-AzureRmPublicIpAddress -Name $ipName -ResourceGroupName $rgName -Location $location `
    -AllocationMethod Dynamic

$nicName = "unmanagednic"
$nic = New-AzureRmNetworkInterface -Name $nicName -ResourceGroupName $rgName -Location $location `
    -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $pip.Id

$nsgName = "unmanagednsg"

$rdpRule = New-AzureRmNetworkSecurityRuleConfig -Name myRdpRule -Description "Allow RDP" `
    -Access Allow -Protocol Tcp -Direction Inbound -Priority 110 `
    -SourceAddressPrefix Internet -SourcePortRange * `
    -DestinationAddressPrefix * -DestinationPortRange 3389

$nsg = New-AzureRmNetworkSecurityGroup -ResourceGroupName $rgName -Location $location `
    -Name $nsgName -SecurityRules $rdpRule

$vnet = Get-AzureRmVirtualNetwork -ResourceGroupName $rgName -Name $vnetName

# Enter a new user name and password to use as the local administrator account 
    # for remotely accessing the VM.
    $cred = Get-Credential

    # Name of the storage account where the VHD is located. This example sets the 
    # storage account name as "myStorageAccount"
    $storageAccName = "unmanageddemovm"

    # Name of the virtual machine. This example sets the VM name as "myVM".
    $vmName = "powershellvmd"

    # Size of the virtual machine. This example creates "Standard_D2_v2" sized VM. 
    # See the VM sizes documentation for more information: 
    # https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/
    $vmSize = "Standard_DS11_v2"

    # Computer name for the VM. This examples sets the computer name as "myComputer".
    $computerName = "unmanagedcp"

    # Name of the disk that holds the OS. This example sets the 
    # OS disk name as "myOsDisk"
    $osDiskName = "unmanagedpowershelldisk"

    # Assign a SKU name. This example sets the SKU name as "Standard_LRS"
    # Valid values for -SkuName are: Standard_LRS - locally redundant storage, Standard_ZRS - zone redundant
    # storage, Standard_GRS - geo redundant storage, Standard_RAGRS - read access geo redundant storage,
    # Premium_LRS - premium locally redundant storage. 
    $skuName = "Standard_LRS"

    # Get the storage account where the uploaded image is stored
    $storageAcc = Get-AzureRmStorageAccount -ResourceGroupName $rgName -AccountName $storageAccName

    # Set the VM name and size
    $vmConfig = New-AzureRmVMConfig -VMName $vmName -VMSize $vmSize

    #Set the Windows operating system configuration and add the NIC
    $vm = Set-AzureRmVMOperatingSystem -VM $vmConfig -Windows -ComputerName $computerName `
        -Credential $cred -ProvisionVMAgent -EnableAutoUpdate
    $vm = Add-AzureRmVMNetworkInterface -VM $vm -Id $nic.Id

    # Create the OS disk URI
    $osDiskUri = '{0}vhds/{1}-{2}.vhd' `
        -f $storageAcc.PrimaryEndpoints.Blob.ToString(), $vmName.ToLower(), $osDiskName

    # Configure the OS disk to be created from the existing VHD image (-CreateOption fromImage).
    $vm = Set-AzureRmVMOSDisk -VM $vm -Name $osDiskName -VhdUri $osDiskUri `
        -CreateOption fromImage -SourceImageUri $imageURI -Windows

    # Create the new VM
    New-AzureRmVM -ResourceGroupName $rgName -Location $location -VM $vm

    $vmList = Get-AzureRmVM -ResourceGroupName $rgName
    $vmList.Name

    _______________________________________________________________________________________________________________________________________________________________

    #AZ COPY SCRIPT TO COPY FROM ONE BLOB TO ANOTHER

    AzCopy /Source:https://csslabdipostore.blob.core.windows.net/vhds /Dest:https://cssdipolabstore2.blob.core.windows.net/cssdipolabcontainer /SourceKey:wECovfwmyHxLcX/8/QiDKpPo0WJpAwkrdeFZpjnq1rkMGYHErXh0VmnprqUQTOr2m/oxCgSO27uJhlhOlXtFNw== /DestKey:V2azHWrgE7elUdz7680BquGEdPpf0vKjYrVwukXxBu3zt/PgJw+CK55TPXUAwh8AT/y4GGFIxhzx/wwxQL+iOw== /Pattern:csslabdipo20180716112037.vhd

    _______________________________________________________________________________________________________________________________________________________________

    #SCRIPT TO CREATE A MANGED VM

    New-AzureRmVm `
    -ResourceGroupName "dipo" `
    -Name "labdemoday2-vm2" `
    -Location "eastus" `
    -VirtualNetworkName "labdemoday2-vnet" `
    -SubnetName "labdemoday2-Subnet" `
    -SecurityGroupName "labdemoday2-nsg" `
    -PublicIpAddressName "labdemoday2-pip" `
    -Credential $cred