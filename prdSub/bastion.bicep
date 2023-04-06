@description('The Azure region where the Bastion should be deployed')
param location string = resourceGroup().location
param virtualNetworkId string = '/subscriptions/d8b855c8-2412-4cab-9ce3-927c4dab5523/resourceGroups/prdcaearg01/providers/Microsoft.Network/virtualNetworks/hubcaeanet01'
param subnetName string = 'AzureBastionSubnet'
// @description('Virtual network name')
// param vnetName string = 'hubcaeanet01'

// @description('The address prefix to use for the Bastion subnet')
// param addressPrefix string = '192.168.250.0/27'

@description('The name of the Bastion public IP address')
param publicIpName string = 'devcaeabastionpip'

// @description('The name of the Bastion host')
// param bastionHostName string = 'bastion-jumpbox'




resource publicIpAddressForBastion 'Microsoft.Network/publicIPAddresses@2022-01-01' = {
  name: publicIpName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource bastionHost 'Microsoft.Network/bastionHosts@2021-05-01' = {
  name: 'BastionHost'
  location: location
  properties: {
    ipConfigurations: [
      {
      name: 'IpConfig1'
      properties: {
        publicIPAddress: {
          id: publicIpAddressForBastion.id
        }
        subnet: {
          id: '${virtualNetworkId}/subnets/${subnetName}'
        }
      }
      }
    ]
  }
}
