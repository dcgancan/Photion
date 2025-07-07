import express from 'express';
import cors from 'cors';
import morgan from 'morgan';
import healthRouter from './routes/health';
import { notFoundHandler, globalErrorHandler } from './middlewares/errorHandler';

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

// Error handling middleware
app.use(notFoundHandler);
app.use(globalErrorHandler);

// Start server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
