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
  $user = "root";
} else {
  $user = $global:currentUser.Identities.Name
}
$Shell.WindowTitle =  $user + "@" + [System.Net.Dns]::GetHostName() + " (v" + (Get-Host).Version + ")";

$size = $Shell.WindowSize
$size.width=70
$size.height=25
$Shell.WindowSize = $size
$size = $Shell.BufferSize
$size.width=70
$size.height=5000
$Shell.BufferSize = $size

function Diff-WorkTree {
  $pf = $env:ProgramFiles;
  $profile = $env:UserProfile;

  & "$pf\Git\bin\git" --git-dir=$profile\.myconf\ --work-tree=$profile $args
}

function Linux-Touch {
  [cmdletbinding()]
  Param (
    [string]$file
  )
  "" | out-file $file
}
function Linux-Head {
  [cmdletbinding()]
  Param (
    [int]$lines = 10
  )
  $input | select -first $lines
}
function Linux-Less {
  $input | out-host -paging
}
function Linux-Open {
  [cmdletbinding()]
  Param (
    [string]$path
  )
  (New-Object -Com Shell.Application).Open($path)
}

Set-Alias -Name config -Value Diff-WorkTree -Description "Allows config files to stay home"
# this gives me the bash command history keys
Set-PSReadLineOption -EditMode Emacs
Set-Alias -Name touch -Value Linux-Touch -Description "creates an empty file"
Set-Alias -Name less -Value Linux-Less -Description "paginates long input"
Set-Alias -Name head -Value Linux-Head -Description "truncates the results by number of lines"
Set-Alias -Name open -Value Linux-Open -Description "opens the input"

#Clear-Host

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function Is-GitDir () {
  try {
    $gitrepo = git rev-parse --abbrev-ref HEAD

    if ($gitrepo) {
      return $true
    }
  } catch {
    # let it fall through
  }
  return $false
}

function Write-BranchName () {
  try {
    $branch = git rev-parse --abbrev-ref HEAD

    if ($branch -eq "HEAD") {
        # we're probably in detached HEAD state, so print the SHA
        $branch = git rev-parse --short HEAD
        Write-Host " ($branch)" -ForegroundColor "red"
    }
    elseif ($branch) {
        # we're on an actual branch, so print it
        Write-Host " ($branch)" -ForegroundColor "blue"
    }
  } catch {
    # we'll end up here if we're in a newly initiated git repo
    Write-Host " (no branches yet)" -ForegroundColor "yellow"
  }
}

function prompt {
  #$p = Split-Path -leaf -path (Get-Location)
  #"$p> "
  $base = "PS "
  $path = "$($executionContext.SessionState.Path.CurrentLocation)"
  $prefix = if ($user -eq "root") { "#" } else { "$" }
  $userPrompt = "$($prefix * ($nestedPromptLevel + 1)) "

  Write-Host "`n$base" -NoNewline

  if (Is-GitDir) {
    Write-Host $path -NoNewline -ForegroundColor "green"
    Write-BranchName
  }
  else {
    # we're not in a repo so don't bother displaying branch name/sha
    Write-Host $path -ForegroundColor "green"
  }

  return $userPrompt
}
