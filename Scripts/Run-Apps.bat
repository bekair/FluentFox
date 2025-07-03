@echo off
chcp 65001 >nul
title FluentFox - Run Applications
cd /d "%~dp0.."
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "Scripts\Start-Menu.ps1"
pause
