# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Photion is an AR Photo Experience Platform with a dual-architecture setup:
- **iOS App**: Native SwiftUI application in `iOS/Photion/` 
- **Backend Server**: Node.js/Express API in `server/`

## Development Commands

### Server Development (in `/server`)
```bash
npm run dev                 # Start development server with hot reload
npm run dev:watch          # Build with TypeScript watch mode + nodemon
npm run build              # Build TypeScript to JavaScript
npm start                  # Start production server
npm run lint               # Run ESLint
npm run lint:fix           # Auto-fix ESLint issues
npm run format             # Format code with Prettier
```

### Database Commands (in `/server`)
```bash
npm run db:generate        # Generate Prisma client
npm run db:push           # Push schema changes to database (dev)
npm run db:migrate        # Create and run migrations (production)
npm run db:studio         # Open Prisma Studio (database GUI)
```

### iOS Development
- Open `iOS/Photion/Photion.xcodeproj` in Xcode
- Build and run through Xcode interface

## Architecture Overview

### Backend (`server/`)
- **Framework**: Express.js with TypeScript
- **Database**: PostgreSQL with Prisma ORM
- **Structure**: 
  - `src/index.ts` - Main server entry point
  - `src/routes/` - API endpoint definitions
  - `src/lib/prisma.ts` - Database client setup
  - `src/middlewares/` - Express middlewares
  - `prisma/schema.prisma` - Database schema definition

### iOS App (`iOS/Photion/`)
- **Framework**: SwiftUI
- **Architecture**: Feature-based organization
- **Key Components**:
  - `Features/` - Main app screens (Home, Profile, AR, Authentication)
  - `Core/` - Shared models and networking
  - `Utils/` - Constants and extensions

## API Endpoints

Current endpoints:
- `GET /` - Server status
- `GET /api/health` - Health check
- `GET /api/db/test` - Database connection test
- `GET /api/db/users/count` - User count

## Database Setup

Requires PostgreSQL database. For development:
```bash
# Using Docker
docker run --name photion-postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=photion_dev -p 5432:5432 -d postgres:15

# Set DATABASE_URL in .env
DATABASE_URL="postgresql://postgres:password@localhost:5432/photion_dev?schema=public"
```

## Important Notes

- Server uses TypeScript with strict mode
- Prisma generates client in `src/generated/prisma`
- All API routes prefixed with `/api`
- CORS enabled for all origins (configure for production)
- Global error handling implemented
- Request logging with Morgan
- Server continues without database in development for resilience

## Next Development Phase (FAZ 1)
- AWS S3 integration for file storage
- JWT authentication system
- Video upload endpoints
- AR marker generation system