import 'dotenv/config';
import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import healthRouter from './routes/health';
import databaseRouter from './routes/database';
import authRouter from './routes/auth';
import { notFoundHandler, globalErrorHandler } from './middlewares/errorHandler';
import { prisma } from './lib/prisma';

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(morgan('combined'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Basic route
app.get('/', (req, res) => {
  res.json({ message: 'Photion Server is running!' });
});

// API Routes
app.use('/api', healthRouter);
app.use('/api/db', databaseRouter);
app.use('/api/auth', authRouter);

// Error handling middleware
app.use(notFoundHandler);
app.use(globalErrorHandler);

// Database connection test
async function connectToDatabase() {
  try {
    await prisma.$connect();
    console.log('✅ Database connected successfully');
  } catch (error) {
    console.error('❌ Database connection failed:', error);
    console.log('⚠️  Server will continue without database for development...');
    // Don't exit in development, continue without database
  }
}

// Start server
async function startServer() {
  await connectToDatabase();
  
  app.listen(PORT, () => {
    console.log(`🚀 Server is running on port ${PORT}`);
    console.log(`📊 Environment: ${process.env.NODE_ENV}`);
  });
}

startServer().catch((error) => {
  console.error('Failed to start server:', error);
  process.exit(1);
});
