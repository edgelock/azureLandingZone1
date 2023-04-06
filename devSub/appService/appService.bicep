param appName string = 'devcaeaase01'
param location string = resourceGroup().location
param appServicePlanName string = 'devcaeaplan01'
param runtimeStack string = 'DOTNET'

resource LifeSpeakWeb 'Microsoft.Web/sites@2021-02-01' = {
  name: appName
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights01.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights01 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}

//Log Analytics Workspace
@description('Tags to add to the resources')
param tags object = {}

@description('Application Insights resource name')
param applicationInsightsName string = 'devcaeaappi01'

@description('Log Analytics resource name')
param logAnalyticsWorkspaceName string = 'devcaealaw01'

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: logAnalyticsWorkspaceName
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 90
    publicNetworkAccessForIngestion: 'Disabled'
    publicNetworkAccessForQuery: 'Disabled'
  }
}

output applicationInsightsId string = applicationInsights01.id

resource LifeSpeakVideoProcessingUtility 'Microsoft.Web/sites@2021-02-01' = {
  name: 'devcaeaase02'
  location: location
  kind: 'app'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights02.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights02 'Microsoft.Insights/components@2020-02-02' = {
  name: 'devcaeaappi02'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}

resource LifeSpeakSuccessFactors 'Microsoft.Web/sites@2021-02-01' = {
  name: 'devcaeaase03'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights03.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights03 'Microsoft.Insights/components@2020-02-02' = {
  name: 'devcaeaappi03'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}

resource LifespeakSSOGateway 'Microsoft.Web/sites@2021-02-01' = {
  name: 'devcaeaase04'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights03.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights04 'Microsoft.Insights/components@2020-02-02' = {
  name: 'devcaeaappi04'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}

resource LifeSpeakSendATEEmailNotification 'Microsoft.Web/sites@2021-02-01' = {
  name: 'devcaeaase05'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights03.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights05 'Microsoft.Insights/components@2020-02-02' = {
  name: 'devcaeaappi05'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}

resource LifeSpeakSearchUtility 'Microsoft.Web/sites@2021-02-01' = {
  name: 'devcaeaase06'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights03.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights06 'Microsoft.Insights/components@2020-02-02' = {
  name: 'devcaeaappi06'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}

resource ExampleIdentityProvider 'Microsoft.Web/sites@2021-02-01' = {
  name: 'devcaeaase07'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights03.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights07 'Microsoft.Insights/components@2020-02-02' = {
  name: 'devcaeaappi07'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}

resource LifespeakMessages 'Microsoft.Web/sites@2021-02-01' = {
  name: 'devcaeaase08'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights03.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights08 'Microsoft.Insights/components@2020-02-02' = {
  name: 'devcaeaappi08'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}

resource LifespeakMessageBuilder 'Microsoft.Web/sites@2021-02-01' = {
  name: 'devcaeaase09'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights03.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights09 'Microsoft.Insights/components@2020-02-02' = {
  name: 'devcaeaappi09'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}

resource LifespeakExpertReviewUtility 'Microsoft.Web/sites@2021-02-01' = {
  name: 'devcaeaase10'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights03.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights10 'Microsoft.Insights/components@2020-02-02' = {
  name: 'devcaeaappi10'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}

resource LifeSpeakExportPipeline 'Microsoft.Web/sites@2021-02-01' = {
  name: 'devcaeaase11'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights03.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights11 'Microsoft.Insights/components@2020-02-02' = {
  name: 'devcaeaappi11'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}

resource LifeSpeakDailyOperationsUtility 'Microsoft.Web/sites@2021-02-01' = {
  name: 'devcaeaase12'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights03.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights12 'Microsoft.Insights/components@2020-02-02' = {
  name: 'devcaeaappi12'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}

resource LifespeakCaptionsAPI 'Microsoft.Web/sites@2021-02-01' = {
  name: 'devcaeaase13'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName
    siteConfig: {
      publicNetworkAccess: 'Disabled'
      appSettings: [
        {
          name: 'WEBSITE_LOAD_USER_PROFILE'
          value: '1'
        },{
          name: 'ASPNETCORE_RUNTIME_VERSION'
          value: '6.0'
        },{
          name: 'WEBSITE_RUN_FROM_PACKAGE'
          value: '1'
        },{
          name:'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights03.properties.InstrumentationKey
        }
      ]
      windowsFxVersion: runtimeStack
    }
  }
}

resource applicationInsights13 'Microsoft.Insights/components@2020-02-02' = {
  name: 'devcaeaappi13'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    Flow_Type: 'Bluefield'
  }
}
