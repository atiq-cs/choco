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
  url            = 'https://updates.signal.org/desktop/signal-desktop-beta-win-1.40.1-beta.1.exe'

  softwareName   = 'Signal Beta Desktop'

  checksum       = 'bd867ffb7a2447eb986738d2b88ded377ab3044e5ea86dfa7e2503e250469caeaa343393b8055422b7791254f9973ede6191a6d556141067eec3feb99686ddba'
  checksumType   = 'sha512'

  silentArgs     = '{0} /log="{1}\install.log"' -f (Get-InstallArgs), (Get-PackageCacheLocation)
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs