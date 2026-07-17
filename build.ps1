$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ScssDir = Join-Path $ScriptDir "scss/source"
$DistDir = Join-Path $ScriptDir "dist"

New-Item -ItemType Directory -Force -Path $DistDir | Out-Null

Write-Host "Building reveal.js themes..."

npx sass `
  "$ScssDir/obsidian-wave.scss:$DistDir/obsidian-wave.css" `
  "$ScssDir/atlas-blue.scss:$DistDir/atlas-blue.css" `
  "$ScssDir/mint-pop.scss:$DistDir/mint-pop.css" `
  --no-source-map `
  --style=expanded

Write-Host ""
Write-Host "Built:"
Get-ChildItem -Path $DistDir -Filter "*.css" |
  Sort-Object Name |
  Select-Object Name, Length, LastWriteTime |
  Format-Table -AutoSize

Write-Host ""
Write-Host "Copy the CSS you need into your presentation's vendor/theme/ folder."
