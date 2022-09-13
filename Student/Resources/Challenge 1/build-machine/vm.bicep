@description('Username for the Virtual Machine.')
param adminUsername string

@description('Password for the Virtual Machine.')
@minLength(12)
@secure()
param adminPassword string

@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
param dnsLabelPrefix string = toLower('${vmName}-${uniqueString(resourceGroup().id, vmName)}')

@description('Name for the Public IP used to access the Virtual Machine.')
param publicIpName string = '${adminUsername}PublicIp'

@description('Allocation method for the Public IP used to access the Virtual Machine.')
@allowed([
  'Dynamic'
  'Static'
])
param publicIPAllocationMethod string = 'Dynamic'

@description('SKU for the Public IP used to access the Virtual Machine.')
@allowed([
  'Basic'
  'Standard'
])
param publicIpSku string = 'Basic'

param subnetName string
param vnetName string

@description('Size of the virtual machine.')
param vmSize string = 'Standard_D2S_v4'

param location string = 'West Europe'

@description('Name of the virtual machine.')
param vmName string = '${adminUsername}vm'

var nicName = '${adminUsername}VMNic'

param storageUri string

resource nic 'Microsoft.Network/networkInterfaces@2021-02-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)
          }
        }
      }
    ]
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2021-03-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'microsoftwindowsdesktop'
        offer: 'windows-11'
        sku: 'win11-21h2-pro'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: storageUri
      }
    }
  }
}



resource vmExtension 'Microsoft.Compute/virtualMachines/extensions@2022-03-01' = {
  name: '${vmName}/config-app'
  location: location
  dependsOn: [vm]
  properties: {
    publisher: 'Microsoft.Compute'
    type: 'CustomScriptExtension'
    typeHandlerVersion: '1.10'
    protectedSettings:{
      commandToExecute: 'powershell -ExecutionPolicy Unrestricted -File install.ps1'
      storageAccountName: 'sncfpv'
      storageAccountKey: 'AA6sj+C5Jt6DF9RQgQLqtC0PtR3roj2pM7aWUlb/keQ1CMfxXcqSXGra7oAK+45ROhlFJJyjTM7A+AStGd8iIQ=='
      fileUris: [ 'https://sncfpv.blob.core.windows.net/deployment/docker.exe', 'https://sncfpv.blob.core.windows.net/deployment/git.exe','https://sncfpv.blob.core.windows.net/deployment/wsl_update_x64.msi', 'https://sncfpv.blob.core.windows.net/deployment/Install.ps1', 'https://sncfpv.blob.core.windows.net/deployment/node.msi', 'https://sncfpv.blob.core.windows.net/deployment/vscode.exe']
    }
  }
}
