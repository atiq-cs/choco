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
  url            = 'https://updates.signal.org/desktop/signal-desktop-beta-win-5.0.0-beta.0.exe'

  softwareName   = 'Signal Beta Desktop'

  checksum       = '0e22d1c2ae80e2032b9472ace7a001bac3530105b240c6d081cbfe8e2eb72df396445772a459010759c909a7fb2a367c58255e5598746ecbedd8409e9992d31a'
  checksumType   = 'sha512'

  silentArgs     = '{0} /log="{1}\install.log"' -f (Get-InstallArgs), (Get-PackageCacheLocation)
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs