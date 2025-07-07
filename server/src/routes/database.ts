import { Router } from 'express';
import { prisma } from '../lib/prisma';

const router = Router();

// Database connection test endpoint
router.get('/test', async (req, res) => {
  try {
    // Test database connection
    await prisma.$queryRaw`SELECT 1`;
    
    res.json({
      success: true,
      message: 'Database connection successful',
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Database connection test failed:', error);
    res.json({
      success: false,
      message: 'Database not available (development mode)',
      error: error instanceof Error ? error.message : 'Unknown error',
      timestamp: new Date().toISOString()
    });
  }
});

// Get user count (simple query test)
router.get('/users/count', async (req, res) => {
  try {
    const count = await prisma.user.count();
    
    res.json({
      success: true,
      userCount: count,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('User count query failed:', error);
    res.json({
      success: false,
      message: 'Database not available (development mode)',
      userCount: 0,
      error: error instanceof Error ? error.message : 'Unknown error',
      timestamp: new Date().toISOString()
    });
  }
});

export default router;