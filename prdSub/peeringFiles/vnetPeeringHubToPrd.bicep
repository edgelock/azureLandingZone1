//Peer from prd to dev
param vNetName string = 'hubcaeanet01'
param remoteVNetName string = 'prdcaeanet01'
param remoteVNetID string = '/subscriptions/d8b855c8-2412-4cab-9ce3-927c4dab5523/resourceGroups/prdcaearg01/providers/Microsoft.Network/virtualNetworks/prdcaeanet01'
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
