# Check if OS version is supported, enable containers, download Moby
. {Invoke-WebRequest -useb aka.ms/iotedge-win} | Invoke-Expression; `
Deploy-IoTEdge -ContainerOs Windows

# Configure/Initialize IoT Edge Runtime
. {Invoke-WebRequest -useb aka.ms/iotedge-win} | Invoke-Expression; `
Initialize-IoTEdge -ContainerOs Windows
