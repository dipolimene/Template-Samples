#ATTACHING A NEW DATA DISK TO A MANAGED Vm

$vmName = "labday3"
$rgName = "dipo"
$location = 'West US' 
$storageType = 'Standard_LRS'
$dataDiskName = 'diskname'

$diskConfig = New-AzureRmDiskConfig -SkuName $storageType -Location $location -CreateOption Empty -DiskSizeGB 30
$dataDisk1 = New-AzureRmDisk -DiskName $dataDiskName -Disk $diskConfig -ResourceGroupName $rgName

$vm = Get-AzureRmVM -Name $vmName -ResourceGroupName $rgName 
$vm = Add-AzureRmVMDataDisk -VM $vm -Name $dataDiskName -CreateOption Attach -ManagedDiskId $dataDisk1.Id -Lun 1
Update-AzureRmVM -VM $vm -ResourceGroupName $rgName






#ATTACHING A NEW DATA DISK TO AN UNMANAGED VM 

$vmName = "labday3"
$rgName = "dipo"

$vm = Get-AzureRmVM -Name $vmName -ResourceGroupName $rgName 
$vm = Add-AzureRmVMDataDisk -VM $vm -Name "day3" -VhdUri "https://day3labstorage.blob.core.windows.net/create/day3.vhd" -LUN 1 -Caching ReadWrite -DiskSizeinGB 30 -CreateOption Empty
Update-AzureRmVM -ResourceGroupName $rgName -VM $vm



#STOP AND DEALLOCATE

Stop-AzureRmVM -Name day3labunman -ResourceGroupName dipo



#RESIZING UNMANAGED DATA DISK AFTER DEALLOCATING

$VM = Get-AzureRMVM -ResourceGroupName "dipo" -VMName "day3labunman"
Set-AzureRmVMDataDisk -VM $VM -Name "day3" -Caching ReadWrite -DiskSizeInGB 40 | Update-AzureRmVM




#RESIZING MANAGED OS DISK

$VM = Get-AzureRMVM -ResourceGroupName "xd" -VMName "xd-pro"
$disk = Get-AzureRmDisk -ResourceGroupName "xd" -DiskName "xd-pro_OsDisk_1_4c352224a88b44b99b318c36ff2f091f"
$disk.DiskSizeGB = 600
Update-AzureRmDisk -ResourceGroupName "xd" -Disk $disk -DiskName "xd-pro_OsDisk_1_4c352224a88b44b99b318c36ff2f091f"





#REMOVE/DETACH A DATADISK

$VirtualMachine = Get-AzureRmVM -ResourceGroupName "dipo" -Name "day3labunman"
Remove-AzureRmVMDataDisk -VM $VirtualMachine -Name "day3"
Update-AzureRmVM -ResourceGroupName "dipo" -VM $VirtualMachine



#RESIZING A CLASSIC DATA DISK

Login-AzAccount
Select-AzureSubscription -Default -SubscriptionId '838bdb2a-12e0-4a05-bb4a-3e53c8098760'
$dataDisk = Get-AzureVM -ServiceName "day3classic" -Name "day3classic" | Get-AzureDataDisk
Update-AzureDisk -DiskName $datadisk.DiskName -Label ResizeDataDisk -ResizedSizeInGB 150


