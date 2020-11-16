Get-AzureReservedIP

New-AzureReservedIP –ReservedIPName MyReservedIP –Location "West Europe" -ServiceName 651pm -Slot Production

Remove-AzureReservedIPAssociation -ReservedIPName MyReservedIP -ServiceName 651pm -Slot Production

Remove-AzureReservedIPAssociation -ReservedIPName MyReservedIPStage -ServiceName 651pm -Slot Staging

Set-AzureReservedIPAssociation -ReservedIPName MyReservedIPStage -ServiceName 651pm -Slot Production

Set-AzureReservedIPAssociation -ReservedIPName MyReservedIP -ServiceName 651pm -Slot Staging

Remove-AzureReservedIPAssociation -ReservedIPName MyReservedIPStage -ServiceName 651pm -Slot Production

Remove-AzureReservedIPAssociation -ReservedIPName MyReservedIP -ServiceName 651pm -Slot Staging



