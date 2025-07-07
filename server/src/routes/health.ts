import { Router, Request, Response } from 'express';

const router = Router();

// GET /api/health
router.get('/health', (req: Request, res: Response) => {
  res.json({
    status: 'ok',
    timestamp: new Date().toISOString()
  });
});

// GET /api/health/error - Test endpoint for error handling
router.get('/health/error', (req: Request, res: Response) => {
  throw new Error('This is a test error!');
});

export default router;