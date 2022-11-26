$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. $toolsDir\helpers.ps1

Close-SignalBeta

# $pp = Get-PackageParameters
function Get-InstallArgs {
  $t = "/S "
  $t
}

$packageArgs = @{
  packageName    = "$Env:ChocolateyPackageName"
  fileType       = 'exe'
  url            = 'https://updates.signal.org/desktop/signal-desktop-beta-win-6.0.0-beta.2.exe'

  softwareName   = 'Signal Beta Desktop'

  checksum       = 'c0505de25f881a0d9af717c68a72406f8b8a38b29c65a5e441f0e29b0fe0143953c6a60647ad8cc8fd81058c2a3c93fa4dafd2b5d638e400530ed96df5fac050'
  checksumType   = 'sha512'

  silentArgs     = '{0} /log="{1}\install.log"' -f (Get-InstallArgs), (Get-PackageCacheLocation)
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs