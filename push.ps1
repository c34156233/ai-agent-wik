# 一鍵推送到 GitHub 腳本 (One-click Git Push Script)
param (
    [string]$msg = "update: sync wiki notes and presentation"
)

Write-Host ">>> 正在檢查 Git 狀態..." -ForegroundColor Cyan
git status

Write-Host ">>> 正在暫存變更 (git add .)..." -ForegroundColor Cyan
git add .

Write-Host ">>> 正在提交變更: $msg" -ForegroundColor Cyan
git commit -m "$msg"

Write-Host ">>> 正在推送至 GitHub (git push origin main)..." -ForegroundColor Cyan
git push origin main

Write-Host ">>> 完成推送！" -ForegroundColor Green
