"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const prisma_1 = require("../lib/prisma");
const router = (0, express_1.Router)();
router.get('/test', async (req, res) => {
    try {
        await prisma_1.prisma.$queryRaw `SELECT 1`;
        res.json({
            success: true,
            message: 'Database connection successful',
            timestamp: new Date().toISOString()
        });
    }
    catch (error) {
        console.error('Database connection test failed:', error);
        res.status(500).json({
            success: false,
            message: 'Database connection failed',
            error: error instanceof Error ? error.message : 'Unknown error'
        });
    }
});
router.get('/users/count', async (req, res) => {
    try {
        const count = await prisma_1.prisma.user.count();
        res.json({
            success: true,
            userCount: count,
            timestamp: new Date().toISOString()
        });
    }
    catch (error) {
        console.error('User count query failed:', error);
        res.status(500).json({
            success: false,
            message: 'Failed to get user count',
            error: error instanceof Error ? error.message : 'Unknown error'
        });
    }
});
exports.default = router;
//# sourceMappingURL=database.js.map