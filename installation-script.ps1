# Set the destination folder for downloading files
$downloadFolder = "C:\sysmon\"

# Create the folder if it doesn't exist
if (-not (Test-Path -Path $downloadFolder -PathType Container)) {
    New-Item -Path $downloadFolder -ItemType Directory | Out-Null
}

# Define the URLs of the files to download
$sysmonUrl = "https://github.com/hyasarsoy/wazuh-sysmon/raw/main/Sysmon64.exe"
$configUrl = "https://github.com/hyasarsoy/wazuh-sysmon/raw/main/sysmonconfig-export.xml"

# Download files
Invoke-WebRequest -Uri $sysmonUrl -OutFile "$downloadFolder\Sysmon64.exe"
Invoke-WebRequest -Uri $configUrl -OutFile "$downloadFolder\sysmonconfig-export.xml"

# Run Sysmon installation command
Start-Process -FilePath "$downloadFolder\Sysmon64.exe" -ArgumentList "-accepteula -i $downloadFolder\sysmonconfig-export.xml" -Wait
