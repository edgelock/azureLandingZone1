##Logged in to account
Connect-AzAccount
##Set Proper Sub
Set-AzContext b4cce3de-40d0-4810-a7af-62faa3c54d59 
##Deployment Command:
New-AzResourceGroupDeployment -ResourceGroupName devcaearg01 -TemplateFile .\vnet.bicep -Mode Incremental -verbose