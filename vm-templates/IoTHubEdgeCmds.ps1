Login-AzAccount
Select-AzSubscription -Subscription d7d3afe2-7897-46f4-aa62-70ab279dcc3e
Import-Module Az.Compute
(Get-AzVM -ResourceGroupName iotdemos -Name w10test).StorageProfile.ImageReference
 
Login-AzureRmAccount
Select-AzureRmSubscription -Subscription d7d3afe2-7897-46f4-aa62-70ab279dcc3e
Import-Module AzureRM.Resources
Install-Module AzureRM.Resources
Uninstall-Module AzureRM.Resources
Logout-AzureRmAccount

az vm create `
    --resource-group iotdemos `
    --name EdgeVMW10 `
    --image MicrosoftWindowsDesktop:Windows-10:rs5-pro:latest `
    --admin-username msadmin `
    --admin-password P@ssw0rd1234 `
    --size Standard_DS1_v2

az iot hub device-identity show-connection-string --device-id Edge4W10 --hub-name iothub47

$params = @{
dnsLabelPrefix = "edgevm-w10"
adminUsername = "msadmin"
deviceConnectionString = "HostName=iothub47.azure-devices.net;DeviceId=Edge4W10;SharedAccessKey=MEyQuz1qHSpkmmL5McfGtvwMR82gYkwSbjpWXL/Wgo8="
authenticationType = "password"
adminPasswordOrKey = "P@ssw0rd1234"
}
New-AzResourceGroupDeployment `
    -ResourceGroupName iotdemos `
    -TemplateUri "https://raw.githubusercontent.com/jimlane/IoT-Demos/master/vm-templates/iot-edge-template2.json" `
    -TemplateParameterObject $params
