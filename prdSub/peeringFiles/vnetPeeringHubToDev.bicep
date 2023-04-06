//Peer from prd to dev
param vNetName string = 'hubcaeanet01'
param remoteVNetName string = 'devcaeanet01'
param remoteVNetID string = '/subscriptions/b4cce3de-40d0-4810-a7af-62faa3c54d59/resourceGroups/devcaearg01/providers/Microsoft.Network/virtualNetworks/devcaeanet01'
param allowGatewayTransit bool = false
param useRemoteGateways bool = false
param allowForwardedTraffic bool = true
param allowVirtualNetworkAccess bool = true

resource vnetPeeringResource 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-08-01' = {
  name: '${vNetName}/${vNetName}-to-${remoteVNetName}'

  properties: {
    remoteVirtualNetwork: {
      id: remoteVNetID
    }
    allowGatewayTransit: allowGatewayTransit
    useRemoteGateways: useRemoteGateways
    allowForwardedTraffic: allowForwardedTraffic
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
  }
}

output id string = vnetPeeringResource.id
