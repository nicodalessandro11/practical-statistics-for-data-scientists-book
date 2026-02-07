<#
Downloads Git LFS objects after cloning/pulling the repo.

Usage (from repo root):
  .\scripts\pull-lfs.ps1

If you see tiny text files where you expect videos/audio, you likely have LFS pointer files.
This script installs/configures LFS for the repo and pulls the real binary content.
#>

$ErrorActionPreference = 'Stop'

Write-Host "1) Ensure git LFS is installed/configured"
& git lfs install | Out-Host

Write-Host "2) Pull LFS objects for current checkout"
& git lfs pull | Out-Host

Write-Host "3) Checkout LFS files into working tree (usually no-op, but safe)"
& git lfs checkout | Out-Host

Write-Host "4) Show LFS-tracked files"
& git lfs ls-files | Out-Host

Write-Host "Done." -ForegroundColor Green
