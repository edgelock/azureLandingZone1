//az deployment sub create -l canadaeast -f .\resourceGroup.bicep

targetScope = 'subscription'
param location string = 'canadaeast'

resource qacaearg01 'Microsoft.Resources/resourceGroups@2021-04-01' = {

  name: 'qacaearg01'
  location: location
}
