param location string = resourceGroup().location

resource AzureFirewall 'Microsoft.Network/azureFirewalls@2020-03-01' = {
  name: 'AzureFirewall'
  location: location
}
