$rgName = "myResourceGroup"
$vmName = "myVM"
Stop-AzureRmVM -ResourceGroupName $rgName -Name $vmName
ConvertTo-AzureRmVMManagedDisk -ResourceGroupName $rgName -VMName $vmName