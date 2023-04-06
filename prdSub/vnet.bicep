// //Logged in to account
// Connect-AzAccount
// // Set Proper Sub
// Set-AzContext d8b855c8-2412-4cab-9ce3-927c4dab5523 
// // Deployment Command:
// New-AzResourceGroupDeployment -ResourceGroupName prdcaearg01 -TemplateFile .\vnet.bicep -Mode Incremental -verbose

//TODO GatewaySubnet Subnet


param location string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: 'prdcaeanet01'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.140.8.0/21'
      ]
    }
  }
}

resource SharedServicesHub 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: 'hubcaeanet01'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.140.0.0/21'
      ]
    }
  }
}

resource SharedServices 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: SharedServicesHub
  name: 'SharedServices'
  properties: {
    addressPrefix: '10.140.2.0/24'
    networkSecurityGroup: {
      id: SharedServicesNSG.id
    }
  }
}

resource Mgmt 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' = {
  parent: SharedServicesHub
  name: 'Mgmt'
  dependsOn: [
    SharedServices
  ]
  properties: {
    addressPrefix: '10.140.0.32/27'
    networkSecurityGroup: {
      id: MgmtNSG.id
    }
  }
}

resource BastionSubnet 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' = {
  parent: SharedServicesHub
  name: 'AzureBastionSubnet'
  dependsOn: [
    Mgmt
  ]
  properties: {
    addressPrefix: '10.140.0.64/26'
  }
}

resource AzureFireWallSubnet 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' = {
  parent: SharedServicesHub
  name: 'AzureFirewallSubnet'
  dependsOn: [
    BastionSubnet
  ]
  properties: {
    addressPrefix:'10.140.0.128/26'
  }
}

resource AppGW 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' = {
  parent: SharedServicesHub
  name: 'AppGW'
  dependsOn: [
    AzureFireWallSubnet
  ]
  properties: {
    addressPrefix: '10.140.1.0/24'
    networkSecurityGroup: {
      id: AppGWNSG.id
    }
  }
}


resource dmz 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'dmz'
  properties: {
    addressPrefix: '10.140.8.0/24'
    networkSecurityGroup: {
      id: nsg1.id
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
    addressPrefix: '10.140.9.0/24'
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
    addressPrefix: '10.140.10.0/24'
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
    addressPrefix: '10.140.11.0/24'
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
    addressPrefix: '10.140.12.0/24'
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
    addressPrefix: '10.140.13.0/24'
    networkSecurityGroup: {
      id: nsg6.id
    }
  }

}

resource gatewaySubnet 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'GatewaySubnet'
  dependsOn: [
    AppServices
  ]
  properties: {
    addressPrefix: '10.140.0.0/27'
    networkSecurityGroup: {
      id: AppGWNSG.id
    }
  }

}

resource nsg1 'Microsoft.Network/networkSecurityGroups@2021-08-01' = {
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


resource SharedServicesNSG 'Microsoft.Network/networkSecurityGroups@2022-09-01' = {
  location: location
  name: 'SharedServicesnsg'
}

resource MgmtNSG 'Microsoft.Network/networkSecurityGroups@2022-09-01' = {
  location: location
  name: 'Mgmtnsg'
}

resource AppGWNSG 'Microsoft.Network/networkSecurityGroups@2022-09-01' = {
  location: location
  name: 'AppGWnsg'
}
