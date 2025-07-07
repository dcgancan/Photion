# Photion Server

Backend API for Photion - AR Photo Experience Platform

## 🚀 Quick Start

### Prerequisites
- Node.js (v18 or higher)
- PostgreSQL database
- npm or yarn

### Installation

1. Install dependencies:
```bash
npm install
```

2. Set up environment variables:
```bash
cp .env.example .env
```

3. Update `.env` file with your database credentials:
```env
DATABASE_URL="postgresql://username:password@localhost:5432/photion_dev?schema=public"
```

4. Generate Prisma client:
```bash
npm run db:generate
```

5. Push database schema (for development):
```bash
npm run db:push
```

6. Build and start the server:
```bash
npm run build
npm start
```

### Development

For development with hot reload:
```bash
npm run dev
```

## 📋 Available Scripts

- `npm run dev` - Start development server with hot reload
- `npm run build` - Build TypeScript to JavaScript
- `npm start` - Start production server
- `npm run db:generate` - Generate Prisma client
- `npm run db:push` - Push schema changes to database (dev)
- `npm run db:migrate` - Create and run migrations (production)
- `npm run db:studio` - Open Prisma Studio (database GUI)
- `npm run lint` - Run ESLint
- `npm run format` - Format code with Prettier

## 🔍 API Endpoints

### Health Check
- `GET /` - Server status
- `GET /api/health` - Health check endpoint

### Database
- `GET /api/db/test` - Test database connection
- `GET /api/db/users/count` - Get user count

## 🗄️ Database Setup

### Local Development (PostgreSQL)

1. Install PostgreSQL locally or use Docker:
```bash
# Using Docker
docker run --name photion-postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=photion_dev -p 5432:5432 -d postgres:15
```

2. Update your `.env` file:
```env
DATABASE_URL="postgresql://postgres:password@localhost:5432/photion_dev?schema=public"
```

3. Push the schema:
```bash
npm run db:push
```

### Production Setup

For production, use migrations instead of `db:push`:
```bash
npm run db:migrate
```

## 🏗️ Project Structure

```
server/
├── src/
│   ├── generated/          # Generated Prisma client
│   ├── lib/                # Utility libraries
│   │   └── prisma.ts       # Prisma client setup
│   ├── middlewares/        # Express middlewares
│   │   └── errorHandler.ts # Global error handling
│   ├── routes/             # API routes
│   │   ├── health.ts       # Health check routes
│   │   └── database.ts     # Database test routes
│   └── index.ts            # Main server file
├── prisma/
│   └── schema.prisma       # Database schema
├── .env                    # Environment variables (not in git)
├── .env.example            # Environment template
└── package.json
```

## 🔧 Environment Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `DATABASE_URL` | PostgreSQL connection string | `postgresql://user:pass@localhost:5432/db` |
| `NODE_ENV` | Environment mode | `development` or `production` |
| `PORT` | Server port | `3000` |
| `JWT_SECRET` | JWT signing secret | `your-secret-key` |

## 📝 Development Notes

- The server uses TypeScript with strict mode enabled
- Prisma is configured to generate client in `src/generated/prisma`
- All API routes are prefixed with `/api`
- Global error handling is implemented
- Request logging is enabled with Morgan
- CORS is enabled for all origins (configure for production)

## 🚧 Next Steps (FAZ 1 Completion)

- [ ] AWS S3 setup for file storage
- [ ] JWT authentication implementation
- [ ] Video upload endpoints
- [ ] AR marker generation system