# ============================================================================
# FluentFox Client Startup Script
# This script starts only the Next.js client application
# ============================================================================

# Set console encoding for proper character display
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "FluentFox - Client Application"

Write-Host ""
Write-Host "  ========================================" -ForegroundColor Cyan
Write-Host "    Starting FluentFox Client" -ForegroundColor Cyan
Write-Host "  ========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Node.js is installed
try {
    $nodeVersion = node --version
    Write-Host "  [OK] Node.js found: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "  [ERROR] Node.js not found. Please install Node.js first." -ForegroundColor Red
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "  [INFO] Installing/updating dependencies..." -ForegroundColor Yellow
Set-Location "client-app"
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "  [ERROR] Failed to install dependencies" -ForegroundColor Red
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "  [INFO] Starting Next.js development server..." -ForegroundColor Green
Write-Host "  [INFO] Client will be available at: http://localhost:3000" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Press Ctrl+C to stop the application" -ForegroundColor Yellow
Write-Host ""
Write-Host "  ========================================" -ForegroundColor Cyan
Write-Host ""

npm run dev
