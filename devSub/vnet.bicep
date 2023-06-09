// //Logged in to account
// Connect-AzAccount
// // Set Proper Sub
// Set-AzContext b4cce3de-40d0-4810-a7af-62faa3c54d59 
// // Deployment Command:
// New-AzResourceGroupDeployment -ResourceGroupName devcaearg01 -TemplateFile C:\bicepStuff\LifeSpeakLZ\devSub\vnet.bicep -Mode Incremental -verbose

param location string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: 'devcaeanet01'
  location: location
  properties: {
    virtualNetworkPeerings: [
      
    ]
    addressSpace: {
      addressPrefixes: [
        '10.140.96.0/21'
      ]
    }
  }
}

resource dmz 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'dmz'
  properties: {
    addressPrefix: '10.140.96.0/24'
    networkSecurityGroup: {
      id: dmznsg.id
    }
  }

}

resource app 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'app'
  dependsOn: [
    dmz
  ]
  properties: {
    addressPrefix: '10.140.97.0/24'
    networkSecurityGroup: {
      id: nsg2.id
    }
  }

}

resource sql 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'sql'
  dependsOn: [
    app
  ]
  properties: {
    addressPrefix: '10.140.98.0/24'
    networkSecurityGroup: {
      id: nsg3.id
    }
  }

}

resource sqlmi 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'sqlmi'
  dependsOn: [
    sql
  ]
  properties: {
    addressPrefix: '10.140.99.0/24'
    networkSecurityGroup:{
      id: nsg4.id
    }
  }

}

resource PrivateEndpoint 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'PrivateEndpoint'
  dependsOn: [
    sqlmi
  ]
  properties: {
    addressPrefix: '10.140.100.0/24'
    networkSecurityGroup: {
      id: nsg5.id
    }
  }

}
resource AppServices 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'AppServices'
  dependsOn: [
    PrivateEndpoint
  ]
  properties: {
    addressPrefix: '10.140.101.0/24'
    networkSecurityGroup: {
      id: nsg6.id
    }
  }

}

resource dmznsg 'Microsoft.Network/networkSecurityGroups@2021-08-01' = {
  location: location
  name: 'dmznsg'
  
}

resource nsg2 'Microsoft.Network/networkSecurityGroups@2021-08-01' = {
  location: location
  name: 'appnsg'
  
}

resource nsg3 'Microsoft.Network/networkSecurityGroups@2021-08-01' = {
  location: location
  name: 'sqlnsg'
  
}

resource nsg4 'Microsoft.Network/networkSecurityGroups@2021-08-01' = {
  location: location
  name: 'sqlminsg'
  
}

resource nsg5 'Microsoft.Network/networkSecurityGroups@2021-08-01' = {
  location: location
  name: 'PrivateEndpointnsg'
  
}

resource nsg6 'Microsoft.Network/networkSecurityGroups@2021-08-01' = {
  location: location
  name: 'AppServicesnsg'
  
}


