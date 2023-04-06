// //Logged in to account
// Connect-AzAccount
// // Set Proper Sub
// Set-AzContext e821185b-e514-41aa-97b4-08efa5e61151 
// // Deployment Command:
// New-AzResourceGroupDeployment -ResourceGroupName qacaearg01 -TemplateFile .\vnet.bicep -Mode Incremental -verbose

param location string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: 'qacaeanet01'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.140.32.0/21'
      ]
    }
  }
}

resource subnet1 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'dmz'
  properties: {
    addressPrefix: '10.140.32.0/24'
    networkSecurityGroup: {
      id: nsg1.id
    }
  }

}

resource subnet2 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'app'
  dependsOn: [
    subnet1
  ]
  properties: {
    addressPrefix: '10.140.33.0/24'
    networkSecurityGroup: {
      id: nsg2.id
    }
  }

}

resource subnet3 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'sql'
  dependsOn: [
    subnet2
  ]
  properties: {
    addressPrefix: '10.140.34.0/24'
    networkSecurityGroup: {
      id: nsg3.id
    }
  }

}

resource subnet4 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'sqlmi'
  dependsOn: [
    subnet3
  ]
  properties: {
    addressPrefix: '10.140.35.0/24'
    networkSecurityGroup:{
      id: nsg4.id
    }
  }

}

resource subnet5 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'PrivateEndpoint'
  dependsOn: [
    subnet4
  ]
  properties: {
    addressPrefix: '10.140.36.0/24'
    networkSecurityGroup: {
      id: nsg5.id
    }
  }

}
resource subnet6 'Microsoft.Network/virtualNetworks/subnets@2021-08-01' = {
  parent: vnet
  name: 'AppServices'
  dependsOn: [
    subnet5
  ]
  properties: {
    addressPrefix: '10.140.37.0/24'
    networkSecurityGroup: {
      id: nsg6.id
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


