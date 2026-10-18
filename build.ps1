$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ScssDir = Join-Path $ScriptDir "scss/source"
$DistDir = Join-Path $ScriptDir "dist"

New-Item -ItemType Directory -Force -Path $DistDir | Out-Null

Write-Host "Building reveal.js themes..."

npx sass `
  "$ScssDir/ersione-dark.scss:$DistDir/ersione-dark.css" `
  "$ScssDir/ersione-light.scss:$DistDir/ersione-light.css" `
  "$ScssDir/ersione-mint.scss:$DistDir/ersione-mint.css" `
  --no-source-map `
  --style=expanded

if ($LASTEXITCODE -ne 0) {
  throw "Sass build failed with exit code $LASTEXITCODE"
}

Write-Host ""
Write-Host "Built:"
Get-ChildItem -Path $DistDir -Filter "*.css" |
  Sort-Object Name |
  Select-Object Name, Length, LastWriteTime |
  Format-Table -AutoSize

Write-Host ""
Write-Host "Copy the CSS you need into your presentation's vendor/theme/ folder."
