locals {
  instance-userdata = <<EOF
# Install Firefox, Putty, VSCode
#
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.1
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process?view=powershell-7.1
# https://leanpub.com/thebigbookofpowershellerrorhandling/read

try {
  Write-Host "Downloading Putty"
  Invoke-WebRequest -Uri "https://the.earth.li/~sgtatham/putty/0.74/w64/putty-64bit-0.74-installer.msi" -OutFile putty-installer.msi

  Write-Host "Installing Putty"
  $putty = (Start-Process msiexec.exe -ArgumentList "/i","putty-installer.msi","/passive" -NoNewWindow -Wait -PassThru)
  if ($putty.ExitCode -ne 0) {
    Write-Error "Error installing Putty"
    exit 1
  }
}
catch
{
  Write-Error $_.Exception
  exit 1
}
EOF
}