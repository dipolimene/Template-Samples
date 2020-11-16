$resourceGroup = "dipo"

$vmName = "labdemoday2vm"

Remove-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName 

$nicname = "labdemoday2nic"

$subnet1Name = "default"

$vnetName = "dipo-vnet"
 

$pip = New-AzureRmPublicIpAddress -Name $nicname -ResourceGroupName "dipo" -Location "canadaeast" -AllocationMethod Dynamic

$vnet = get-AzureRmVirtualNetwork -Name $vnetName -ResourceGroupName "dipo" 

$nic = New-AzureRmNetworkInterface -Name $nicname -ResourceGroupName "dipo" -Location "canadaeast" -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $pip.Id

$vm = New-AzureRmVMConfig -VMName "labdemoday2vm" -VMSize "Standard_A1_v2"



Set-AzureRmVMPlan -VM $vm -Publisher cloudera -Product "cloudera-centos-os" -Name "7_4"




$vm = Add-AzureRmVMNetworkInterface -VM $vm -Id $nic.Id 

$osDiskUri = "https://labdemoday2storage.blob.core.windows.net/vhds/labdemoday2vm20180717143250.vhd"

$vm = Set-AzureRmVMOSDisk -VM $vm -Name "labdemoday2vm20180717143250" -VhdUri $osDiskUri -CreateOption attach -linux -verbose
New-AzureRmVM -ResourceGroupName "dipo" -Location "canadaeast" -VM $vm




