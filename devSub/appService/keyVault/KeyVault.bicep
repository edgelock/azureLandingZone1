// Creates a KeyVault with Private Link Endpoint
@description('The Azure Region to deploy the resources into')
param location string = resourceGroup().location

@description('Tags to apply to the Key Vault Instance')
param tags object = {}

@description('The name of the Key Vault')
param keyvaultName string = 'devcaeakv01'

// @description('The name of the Key Vault private link endpoint')
// param keyvaultPleName string

// @description('The Subnet ID where the Key Vault Private Link is to be created')
// param subnetId string

// @description('The VNet ID where the Key Vault Private Link is to be created')
// param virtualNetworkId string

// var privateDnsZoneName = 'privatelink${environment().suffixes.keyvaultDns}'

resource LifeSpeakVideoProcessingUtilityKeyVault 'Microsoft.KeyVault/vaults@2021-10-01' = {
  name: keyvaultName
  location: location
  tags: tags
  properties: {
    createMode: 'default'
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    enableRbacAuthorization: true
    enablePurgeProtection: true
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
    }
    sku: {
      family: 'A'
      name: 'standard'
    }
    softDeleteRetentionInDays: 7
    tenantId: subscription().tenantId
    accessPolicies: [
      {
        objectId: 'cad32714-e2c7-4bbb-a7d4-a135e8e9b217'
        permissions: {
          keys: [
            'get'
            'create'
            'list'
          ]
        }
        tenantId: subscription().tenantId
      }
    ]
  }
}
