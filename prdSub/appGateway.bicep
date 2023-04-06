param location string = resourceGroup().location

resource AppGateway 'Microsoft.Network/applicationGateways@2022-09-01'= {
  location: location
  name: 'AppGateway'

}
 