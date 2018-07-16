set-location $env:src

$Shell = $Host.UI.RawUI


# Get username:
[System.Security.Principal.WindowsPrincipal]$global:currentUser =
New-Object System.Security.Principal.WindowsPrincipal(
[System.Security.Principal.WindowsIdentity]::GetCurrent()
)
if($global:currentUser.IsInRole(
[System.Security.Principal.WindowsBuiltInRole]::Administrator)
) {
  $user = $global:currentUser.Identities.Name + " (Administrator)";
} else {
  $user = $global:currentUser.Identities.Name
}
$Shell.WindowTitle =  $user + " on " + [System.Net.Dns]::GetHostName() + " (v" + (Get-Host).Version + ")";


$size = $Shell.WindowSize
$size.width=70
$size.height=25
$Shell.WindowSize = $size
$size = $Shell.BufferSize
$size.width=70
$size.height=5000
$Shell.BufferSize = $size


function prompt {
  $p = Split-Path -leaf -path (Get-Location)
  "$p> "
}

function Diff-WorkTree {
  $pf = $env:ProgramFiles;
  $profile = $env:UserProfile;

  & "$pf\Git\bin\git" --git-dir=$profile\.myconf\ --work-tree=$profile $args
}

Set-Alias -Name config -Value Diff-WorkTree -Description "Allows config files to stay home"
# this gives me the bash command history keys
Set-PSReadLineOption -EditMode Emacs

#Clear-Host

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
