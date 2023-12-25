# wazuh-sysmon


$url = "https://github.com/hyasarsoy/wazuh-sysmon/raw/main/"; $dest = "C:\sysmon\"; New-Item -ItemType Directory -Force -Path $dest; Invoke-WebRequest -Uri ($url + "Sysmon64.exe") -OutFile ($dest + "Sysmon64.exe"); Invoke-WebRequest -Uri ($url + "sysmonconfig-export.xml") -OutFile ($dest + "sysmonconfig-export.xml"); Start-Process -FilePath ($dest + "Sysmon64.exe") -ArgumentList "-accepteula -i $dest\sysmonconfig-export.xml" -Wait
