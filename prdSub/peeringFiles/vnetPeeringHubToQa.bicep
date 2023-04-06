//Peer from prd to dev
param vNetName string = 'hubcaeanet01'
param remoteVNetName string = 'qacaeanet01'
param remoteVNetID string = '/subscriptions/e821185b-e514-41aa-97b4-08efa5e61151/resourceGroups/qacaearg01/providers/Microsoft.Network/virtualNetworks/qacaeanet01'
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
