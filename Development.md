# FluentFox Development Guide

This guide provides easy ways to run the FluentFox applications in development mode.

## Quick Start

### 🎯 Start FluentFox Applications
Use the interactive menu to choose which application(s) to start:

```powershell
# PowerShell
.\Scripts\Start-Menu.ps1

# Or double-click
.\Scripts\Run-Apps.bat
```

The menu will present you with options to:
- 🚀 Start Both Applications (Client + Server)
- 🌐 Start Client Only (Next.js)
- ⚡ Start Server Only (.NET API)

**When running, applications will be accessible at:**
- 🌐 Client: http://localhost:3000
- ⚡ Server: https://localhost:7000
- 📖 API Docs: https://localhost:7000/openapi/v1.json

## Manual Development Setup

### Prerequisites
- Node.js 18+ with npm
- .NET 8 SDK
- Git

### Client Application (Next.js)
```bash
cd client-app
npm install
npm run dev
```

### Server Application (.NET 8)
```bash
cd server-api
dotnet restore
dotnet run
```

## Available Scripts

| Script | Description |
|--------|-------------|
| `Scripts\Start-Menu.ps1` / `Scripts\Run-Apps.bat` | Interactive menu to choose and start applications |

## Features

✅ **Automatic dependency installation/restoration**  
✅ **Prerequisites validation (Node.js, .NET)**  
✅ **Colored output with status indicators**  
✅ **Error handling and validation**  
✅ **Easy termination (Ctrl+C)**  
✅ **Double-click execution via .bat files**  

## Troubleshooting

### PowerShell Execution Policy
If you get an execution policy error, run:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Port Conflicts
- Client (3000): Next.js will automatically find the next available port
- Server (7000): Configured in `server-api/Properties/launchSettings.json`

### Dependencies Issues
The scripts automatically handle dependency installation, but if needed:
```bash
# Client
cd client-app && npm install

# Server  
cd server-api && dotnet restore
```

## Development Workflow

1. **First time setup**: Run `Scripts\Run-Apps.bat` or `.\Scripts\Start-Menu.ps1`
2. **Daily development**: Use the menu to select your preferred option
3. **Choose from menu**: Select the applications you need to run
4. **Stop applications**: Press `Ctrl+C` in the terminal

## Next Steps

- Configure CORS in the .NET API for client communication
- Set up environment variables for different environments
- Add Docker configurations for containerized development
- Implement API endpoints for the client to consume
