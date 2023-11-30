if not exist "C:\Windows\Temp\7z2301-x64.msi" (
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://www.7-zip.org/a/7z2301-x64.msi', 'C:\Windows\Temp\7z2301-x64.msi')" <NUL
)
msiexec /qb /i C:\Windows\Temp\7z2301-x64.msi


powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://packages.vmware.com/tools/esx/8.0u2/windows/VMware-tools-windows-12.3.0-22234872.iso', 'C:\Windows\Temp\windows.iso')" <NUL

cmd /c ""C:\Program Files\7-Zip\7z.exe" x "C:\Windows\Temp\windows.iso" -oC:\Windows\Temp\VMWare"
cmd /c C:\Windows\Temp\VMWare\setup64.exe /S /v"/qn REBOOT=R\"

msiexec /qb /x C:\Windows\Temp\7z2301-x64.msi