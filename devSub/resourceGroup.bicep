targetScope = 'subscription'
param location string = 'canadaeast'

resource devcaearg01 'Microsoft.Resources/resourceGroups@2021-04-01' = {

  name: 'devcaearg01'
  location: location
}
