import { Request, Response, NextFunction } from 'express';

// 404 Not Found handler - tüm rotalardan sonra çalışır
export const notFoundHandler = (req: Request, res: Response, next: NextFunction) => {
  const error = new Error(`Not Found - ${req.originalUrl}`);
  res.status(404);
  next(error);
};

// Global error handler - en son middleware olarak çalışır
export const globalErrorHandler = (
  error: Error,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let statusCode = res.statusCode === 200 ? 500 : res.statusCode;
  let message = error.message;

  // Geliştirme ortamında stack trace'i dahil et
  const isDevelopment = process.env.NODE_ENV !== 'production';

  res.status(statusCode).json({
    message,
    ...(isDevelopment && { stack: error.stack })
  });
};