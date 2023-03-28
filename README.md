# Bicep LandingZone Deployment

## A fully functional example landingzone you can deploy with Bicep

This project is an example landingzone that was deployed at the subscription level for demo purposes. This project should have a rundown of how to run the code used to deploy the various pieces underneath the subscriptions of the architecture diagram.

![Copy DiagragmLZ - Core with AzFW](https://user-images.githubusercontent.com/44417754/228345712-755beebd-3e7e-4a6f-bd0b-13c391b7bae7.jpg)


## Steps To Execute Bicep Files

1. Connect Account
>Connect-AzAccount

2. Set Proper Sub
>Set-AzContext b4cce3de-40d0-4810-a7af-62faa3c54d59

3. Execute Deployment Command 
>New-AzResourceGroupDeployment -ResourceGroupName devcaearg01 -TemplateFile .\vnet.bicep -Mode Incremental -verbose