Add-AzureAccount

Get-AzureRmSubscription

Select-AzureRmSubscription -SubscriptionId 'xxxxxxxxxxxxxxxx’

New-AzureReservedIP –ReservedIPName MyReservedIP1 –Location "West Europe" -ServiceName 651pm -Slot "Staging"

New-AzureReservedIP –ReservedIPName MyReservedIP2 –Location "West Europe" -ServiceName 651pm

Get-AzureReservedIP

Remove-AzureReservedIPAssociation -ReservedIPName MyReservedIP2 -ServiceName 651pm

Remove-AzureReservedIPAssociation -ReservedIPName MyReservedIP1 -ServiceName 651pm -Slot Staging

Set-AzureReservedIPAssociation -ReservedIPName MyReservedIP -ServiceName pm917

Set-ExecutionPolicy Unrestricted


