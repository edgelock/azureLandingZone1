# Bicep LandingZone Deployment

## A fully functional example landingzone you can deploy with Bicep
Connect-AzAccount
##Set Proper Sub
Set-AzContext b4cce3de-40d0-4810-a7af-62faa3c54d59 
##Deployment Command:
New-AzResourceGroupDeployment -ResourceGroupName devcaearg01 -TemplateFile .\vnet.bicep -Mode Incremental -verbose