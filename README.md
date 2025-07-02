# FluentFox

A full-stack application built with Next.js and .NET 8 Web API.

## Project Structure

```
FluentFox/
├── client-app/          # Next.js frontend application
├── server-api/          # .NET 8 Web API backend
├── Requirements/        # Project requirements and documentation
└── README.md           # This file
```

## Getting Started

### Prerequisites

- Node.js 18+ and npm/yarn
- .NET 8 SDK
- Git

### Client App (Next.js)

```bash
cd client-app
npm install
npm run dev
```

The client app will be available at `http://localhost:3000`

### Server API (.NET)

```bash
cd server-api
dotnet restore
dotnet run
```

The API will be available at `https://localhost:7000` (or as configured)

## Development

This is a monorepo containing both the frontend and backend applications. Each project maintains its own dependencies and build processes while sharing common documentation and requirements.

## Tech Stack

### Frontend (client-app)
- Next.js 14
- React 18
- Material-UI (MUI)
- TypeScript
- Tailwind CSS

### Backend (server-api)
- .NET 8 Web API
- C#
- Entity Framework Core (if applicable)

## Contributing

1. Clone the repository
2. Create a feature branch
3. Make your changes
4. Test both client and server applications
5. Submit a pull request

## License

Private project - All rights reserved
