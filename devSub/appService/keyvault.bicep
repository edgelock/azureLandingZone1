param name string
param location string
param sku string
param accessPolicies array
param tenant string
param enabledForDeployment bool
param enabledForTemplateDeployment bool
param enabledForDiskEncryption bool
param enableRbacAuthorization bool
param publicNetworkAccess string
param enableSoftDelete bool
param softDeleteRetentionInDays int
param networkAcls object

resource name_resource 'Microsoft.KeyVault/vaults@2021-10-01' = {
  name: name
  location: location
  properties: {
    enabledForDeployment: enabledForDeployment
    enabledForTemplateDeployment: enabledForTemplateDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enableRbacAuthorization: enableRbacAuthorization
    accessPolicies: accessPolicies
    tenantId: tenant
    sku: {
      name: sku
      family: 'A'
    }
    publicNetworkAccess: publicNetworkAccess
    enableSoftDelete: enableSoftDelete
    softDeleteRetentionInDays: softDeleteRetentionInDays
    networkAcls: networkAcls
  }
  tags: {
    App: 'LifeSpeakWeb'
  }
  dependsOn: []
}

module devcaease01_72f64827_8776_4433_bbd2_76d53dab8030 '?' /*TODO: replace with correct path to https://keyvault.hosting.portal.azure.net/keyvault/Content/1.2.188.0.230313-0453/DeploymentTemplates/PrivateEndpointForKeyVault.json*/ = {
  name: 'devcaease01_72f64827-8776-4433-bbd2-76d53dab8030'
  scope: resourceGroup('b4cce3de-40d0-4810-a7af-62faa3c54d59', 'devcaearg01')
  params: {
    privateEndpointName: 'devcaease01'
    privateEndpointConnectionId: '/subscriptions/b4cce3de-40d0-4810-a7af-62faa3c54d59/resourceGroups/devcaearg01/providers/Microsoft.Network/privateEndpoints/privateLinkServiceConnections/devcaease01_ebf5316e-d9bb-4c2b-ba0c-73aceae74019'
    privateEndpointConnectionName: 'devcaease01_ebf5316e-d9bb-4c2b-ba0c-73aceae74019'
    privateEndpointId: '/subscriptions/b4cce3de-40d0-4810-a7af-62faa3c54d59/resourceGroups/devcaearg01/providers/Microsoft.Network/privateEndpoints/devcaease01'
    privateEndpointApiVersion: '2019-04-01'
    privateLinkServiceId: '/subscriptions/b4cce3de-40d0-4810-a7af-62faa3c54d59/resourceGroups/devcaearg01/providers/Microsoft.KeyVault/vaults/alksdmlaksnd'
    groupId: 'vault'
    subnetId: '/subscriptions/b4cce3de-40d0-4810-a7af-62faa3c54d59/resourceGroups/devcaearg01/providers/Microsoft.Network/virtualNetworks/devcaeanet01/subnets/PrivateEndpoint'
    location: 'canadaeast'
    tags: {
      App: 'LifeSpeakWeb'
    }
  }
  dependsOn: [
    'Microsoft.KeyVault/vaults/alksdmlaksnd'
  ]
}

module PrivateDns_72f6482787764433bbd276d53dab8031 './nested_PrivateDns_72f6482787764433bbd276d53dab8031.bicep' = {
  name: 'PrivateDns-72f6482787764433bbd276d53dab8031'
  scope: resourceGroup(string('b4cce3de-40d0-4810-a7af-62faa3c54d59'), string('devcaearg01'))
  params: {
    reference_devcaease01_72f64827_8776_4433_bbd2_76d53dab8030_outputs_networkinterfaceid_value: devcaease01_72f64827_8776_4433_bbd2_76d53dab8030.properties
  }
  dependsOn: [
    string('devcaease01_72f64827-8776-4433-bbd2-76d53dab8030')
  ]
}
