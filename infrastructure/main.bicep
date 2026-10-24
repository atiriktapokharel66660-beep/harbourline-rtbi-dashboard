// Core Azure resources for the real-time analytics platform.
// Planning-stage template: deployed to dev/test/prod by GitHub Actions in activity 3.1.

@description('Environment name: dev, test or prod')
@allowed(['dev', 'test', 'prod'])
param env string = 'dev'

@description('Australian region only (data residency requirement)')
@allowed(['australiaeast', 'australiasoutheast'])
param location string = 'australiaeast'

var prefix = 'hrg-rtbi-${env}'

resource eventHubNs 'Microsoft.EventHub/namespaces@2024-01-01' = {
  name: '${prefix}-ehns'
  location: location
  sku: { name: 'Standard', tier: 'Standard', capacity: 1 }
}

resource posSalesHub 'Microsoft.EventHub/namespaces/eventhubs@2024-01-01' = {
  parent: eventHubNs
  name: 'pos-sales'
  properties: { partitionCount: 4, messageRetentionInDays: 1 }
}

resource dataLake 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: replace('${prefix}dl', '-', '')
  location: location
  sku: { name: 'Standard_LRS' }
  kind: 'StorageV2'
  properties: { isHnsEnabled: true, minimumTlsVersion: 'TLS1_2', allowBlobPublicAccess: false }
}

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: '${prefix}-adf'
  location: location
  identity: { type: 'SystemAssigned' }
}

resource streamJob 'Microsoft.StreamAnalytics/streamingjobs@2021-10-01-preview' = {
  name: '${prefix}-asa'
  location: location
  properties: {
    sku: { name: 'StandardV2' }
    eventsOutOfOrderPolicy: 'Adjust'
    outputErrorPolicy: 'Stop'
  }
}

output eventHubNamespace string = eventHubNs.name
output dataLakeAccount string = dataLake.name
