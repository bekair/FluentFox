# ============================================================================
# FluentFox Development Startup Script
# This script starts both the Next.js client and .NET API server
# ============================================================================

# Set console encoding for proper character display
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "FluentFox - Development Environment"

Write-Host ""
Write-Host "  ========================================" -ForegroundColor Cyan
Write-Host "    FluentFox Development Environment" -ForegroundColor Cyan
Write-Host "  ========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  [INFO] Starting both applications..." -ForegroundColor Green
Write-Host "  [INFO] Client will be available at: http://localhost:3000" -ForegroundColor Cyan
Write-Host "  [INFO] Server will be available at: https://localhost:7093" -ForegroundColor Cyan
Write-Host "  [INFO] Swagger UI at: https://localhost:7093/swagger" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Press Ctrl+C to stop both applications" -ForegroundColor Yellow
Write-Host ""
Write-Host "  ========================================" -ForegroundColor Cyan
Write-Host ""

# Get the directory where this script is located
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Start both applications using individual scripts
$clientJob = Start-Job -ScriptBlock {
    Set-Location $using:PWD
    try {
        & "$using:scriptDir\start-client.ps1" 2>&1
    } catch {
        Write-Error "Client startup failed: $_"
        throw
    }
}

$serverJob = Start-Job -ScriptBlock {
    Set-Location $using:PWD
    try {
        & "$using:scriptDir\start-server.ps1" 2>&1
    } catch {
        Write-Error "Server startup failed: $_"
        throw
    }
}

# Monitor both jobs
try {
    Write-Host ">> Monitoring application startup..." -ForegroundColor Blue
    
    # Give applications time to start
    Start-Sleep -Seconds 5
    
    while ($true) {
        $clientState = Get-Job -Id $clientJob.Id | Select-Object -ExpandProperty State
        $serverState = Get-Job -Id $serverJob.Id | Select-Object -ExpandProperty State
        
        # Check for failures with detailed reporting
        if ($clientState -eq "Failed" -or $serverState -eq "Failed") {
            Write-Host ""
            Write-Host ">> APPLICATION FAILURE DETECTED" -ForegroundColor Red
            Write-Host "================================" -ForegroundColor Red
            
            if ($clientState -eq "Failed") {
                Write-Host ">> CLIENT APPLICATION FAILED" -ForegroundColor Red
                Write-Host ">> Client Error Details:" -ForegroundColor Yellow
                $clientError = Receive-Job $clientJob -ErrorAction SilentlyContinue
                if ($clientError) {
                    $clientError | ForEach-Object { Write-Host "   $_" -ForegroundColor Gray }
                } else {
                    Write-Host "   No detailed error information available" -ForegroundColor Gray
                }
                Write-Host ""
            }
            
            if ($serverState -eq "Failed") {
                Write-Host ">> SERVER APPLICATION FAILED" -ForegroundColor Red
                Write-Host ">> Server Error Details:" -ForegroundColor Yellow
                $serverError = Receive-Job $serverJob -ErrorAction SilentlyContinue
                if ($serverError) {
                    $serverError | ForEach-Object { Write-Host "   $_" -ForegroundColor Gray }
                } else {
                    Write-Host "   No detailed error information available" -ForegroundColor Gray
                }
                Write-Host ""
            }
            
            Write-Host ">> TROUBLESHOOTING TIPS:" -ForegroundColor Cyan
            if ($clientState -eq "Failed") {
                Write-Host "   • Check if Node.js is installed and accessible" -ForegroundColor White
                Write-Host "   • Verify client-app directory exists and has package.json" -ForegroundColor White
                Write-Host "   • Try running: cd client-app && npm install" -ForegroundColor White
            }
            if ($serverState -eq "Failed") {
                Write-Host "   • Check if .NET 8 SDK is installed" -ForegroundColor White
                Write-Host "   • Verify FluentFox directory exists and has .csproj file" -ForegroundColor White
                Write-Host "   • Try running: cd FluentFox && dotnet restore" -ForegroundColor White
            }
            Write-Host ""
            break
        } elseif ($clientState -eq "Completed" -or $serverState -eq "Completed") {
            Write-Host ""
            Write-Host ">> APPLICATION STOPPED UNEXPECTEDLY" -ForegroundColor Yellow
            Write-Host "===================================" -ForegroundColor Yellow
            
            if ($clientState -eq "Completed") {
                Write-Host ">> Client application exited" -ForegroundColor Yellow
                $clientOutput = Receive-Job $clientJob -ErrorAction SilentlyContinue
                if ($clientOutput) {
                    Write-Host ">> Client final output:" -ForegroundColor Cyan
                    $clientOutput | Select-Object -Last 10 | ForEach-Object { Write-Host "   $_" -ForegroundColor Gray }
                }
            }
            
            if ($serverState -eq "Completed") {
                Write-Host ">> Server application exited" -ForegroundColor Yellow
                $serverOutput = Receive-Job $serverJob -ErrorAction SilentlyContinue
                if ($serverOutput) {
                    Write-Host ">> Server final output:" -ForegroundColor Cyan
                    $serverOutput | Select-Object -Last 10 | ForEach-Object { Write-Host "   $_" -ForegroundColor Gray }
                }
            }
            Write-Host ""
            break
        }
        
        # Show status every 10 seconds
        Start-Sleep -Seconds 10
        Write-Host ">> Status: Client=$clientState, Server=$serverState" -ForegroundColor Green
    }
} catch {
    Write-Host ""
    Write-Host ">> MONITORING INTERRUPTED" -ForegroundColor Red
    Write-Host ">> Error: $_" -ForegroundColor Red
    Write-Host ""
} finally {
    Write-Host ">> Cleaning up background jobs..." -ForegroundColor Yellow
    
    # Try to get any remaining output before stopping
    try {
        $clientOutput = Receive-Job $clientJob -ErrorAction SilentlyContinue
        $serverOutput = Receive-Job $serverJob -ErrorAction SilentlyContinue
    } catch {}
    
    Stop-Job $clientJob -ErrorAction SilentlyContinue
    Stop-Job $serverJob -ErrorAction SilentlyContinue
    Remove-Job $clientJob -ErrorAction SilentlyContinue
    Remove-Job $serverJob -ErrorAction SilentlyContinue
    
    Write-Host ">> All applications and background jobs stopped" -ForegroundColor Green
}
