$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repoRoot

function Get-Python2Runtime {
    $localRuntime = Get-ChildItem -Path (Join-Path $repoRoot '.python2') -Recurse -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -in @('pypy.exe', 'python.exe', 'pypy', 'python2') } |
        Select-Object -First 1

    if ($localRuntime) {
        return $localRuntime.FullName
    }

    $python2 = Get-Command python2 -ErrorAction SilentlyContinue
    if ($python2) {
        return $python2.Source
    }

    throw 'Python 2 runtime not found. Install a repo-local runtime under .python2/ or add python2 to PATH.'
}

$python2 = Get-Python2Runtime
$dependencies = @(
    (Join-Path $repoRoot 'MENU'),
    (Join-Path $repoRoot 'jemdoc.py'),
    (Join-Path $repoRoot 'jemdoc.css')
)

$compiled = @()

Get-ChildItem -Path $repoRoot -Filter '*.jemdoc' | Sort-Object Name | ForEach-Object {
    $source = $_.FullName
    $target = [System.IO.Path]::ChangeExtension($source, '.html')
    $needsBuild = -not (Test-Path $target)

    if (-not $needsBuild) {
        foreach ($dependency in @($source) + $dependencies) {
            if ((Get-Item $dependency).LastWriteTime -gt (Get-Item $target).LastWriteTime) {
                $needsBuild = $true
                break
            }
        }
    }

    if ($needsBuild) {
        & $python2 (Join-Path $repoRoot 'jemdoc.py') $source
        Write-Host "Compiled $($_.Name)"
        $compiled += $_.Name
    }
}

if ($compiled.Count -eq 0) {
    Write-Host 'No pages needed recompilation.'
} else {
    Write-Host ('Updated files: ' + ($compiled -join ', '))
}
