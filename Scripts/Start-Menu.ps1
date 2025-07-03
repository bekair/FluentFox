# ============================================================================
# FluentFox Development Menu
# Select which application(s) to start
# ============================================================================

# Set console encoding for proper character display
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "FluentFox - Development Environment"

# Change to project root directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Split-Path -Parent $scriptPath
Set-Location $projectRoot

function Show-Menu {
    Clear-Host
    Write-Host ""
    Write-Host "  ========================================" -ForegroundColor Cyan
    Write-Host "    FluentFox Development Environment" -ForegroundColor Cyan
    Write-Host "  ========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  Please select an option:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  [1] Start Both Applications (Client + Server)" -ForegroundColor Green
    Write-Host "  [2] Start Client Only (Next.js)" -ForegroundColor Blue
    Write-Host "  [3] Start Server Only (.NET API)" -ForegroundColor Magenta
    Write-Host "  [4] Exit" -ForegroundColor Red
    Write-Host ""
    Write-Host "  ========================================" -ForegroundColor Cyan
    Write-Host ""
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice (1-4)"
    
    switch ($choice) {
        "1" {
            Write-Host ""
            Write-Host ">> Starting both applications..." -ForegroundColor Green
            & "Scripts\start-both.ps1"
            break
        }
        "2" {
            Write-Host ""
            Write-Host ">> Starting client application..." -ForegroundColor Blue
            & "Scripts\start-client.ps1"
            break
        }
        "3" {
            Write-Host ""
            Write-Host ">> Starting server application..." -ForegroundColor Magenta
            & "Scripts\start-server.ps1"
            break
        }
        "4" {
            Write-Host ""
            Write-Host ">> Goodbye!" -ForegroundColor Yellow
            exit 0
        }
        default {
            Write-Host ""
            Write-Host "  [ERROR] Invalid choice. Please enter 1, 2, 3, or 4." -ForegroundColor Red
            Read-Host "Press Enter to continue"
        }
    }
} while ($choice -notin @("1", "2", "3", "4"))

Read-Host "`nPress Enter to exit"
