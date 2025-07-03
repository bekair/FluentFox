# ============================================================================
# FluentFox Server Startup Script
# This script starts only the .NET API server
# ============================================================================

# Set console encoding for proper character display
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "FluentFox - Server Application"

Write-Host ""
Write-Host "  ========================================" -ForegroundColor Cyan
Write-Host "    Starting FluentFox Server" -ForegroundColor Cyan
Write-Host "  ========================================" -ForegroundColor Cyan
Write-Host ""

# Check if .NET is installed and version is 8 or above
try {
    $dotnetVersion = dotnet --version
    $versionNumber = [Version]($dotnetVersion -replace '-.*', '')
    $minimumVersion = [Version]"8.0.0"
    
    if ($versionNumber -ge $minimumVersion) {
        Write-Host "  [OK] .NET found: $dotnetVersion (meets minimum requirement)" -ForegroundColor Green
    } else {
        Write-Host "  [ERROR] .NET version $dotnetVersion found, but .NET 8.0 or higher is required." -ForegroundColor Red
        Write-Host "  [ERROR] Please install .NET 8 SDK or higher." -ForegroundColor Red
        Write-Host ""
        Read-Host "Press Enter to exit"
        exit 1
    }
} catch {
    Write-Host "  [ERROR] .NET not found. Please install .NET 8 SDK or higher first." -ForegroundColor Red
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "  [INFO] Restoring dependencies..." -ForegroundColor Yellow
Set-Location "FluentFox"
dotnet restore
if ($LASTEXITCODE -ne 0) {
    Write-Host "  [ERROR] Failed to restore dependencies" -ForegroundColor Red
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "  [INFO] Starting .NET API server..." -ForegroundColor Green
Write-Host "  [INFO] Server will be available at: https://localhost:7093" -ForegroundColor Cyan
Write-Host "  [INFO] HTTP endpoint at: http://localhost:5076" -ForegroundColor Cyan
Write-Host "  [INFO] Swagger UI at: https://localhost:7093/swagger" -ForegroundColor Cyan
Write-Host "  [INFO] OpenAPI JSON at: https://localhost:7093/swagger/v1/swagger.json" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Press Ctrl+C to stop the application" -ForegroundColor Yellow
Write-Host ""
Write-Host "  ========================================" -ForegroundColor Cyan
Write-Host ""

dotnet run --project FluentFoxApi.csproj
