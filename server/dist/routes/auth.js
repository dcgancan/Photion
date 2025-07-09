"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const auth_1 = require("../lib/auth");
const validation_1 = require("../lib/validation");
const prisma_1 = require("../lib/prisma");
const auth_2 = require("../middlewares/auth");
const router = express_1.default.Router();
router.post('/register', async (req, res) => {
    try {
        const { email, password, name, phone } = req.body;
        const validationErrors = validation_1.ValidationService.validateRegistration({
            email,
            password,
            name,
            phone,
        });
        if (validationErrors.length > 0) {
            res.status(400).json({
                success: false,
                message: 'Validation failed',
                errors: validationErrors,
            });
            return;
        }
        const existingUser = await prisma_1.prisma.user.findUnique({
            where: { email: email.toLowerCase() },
        });
        if (existingUser) {
            res.status(409).json({
                success: false,
                message: 'User with this email already exists',
            });
            return;
        }
        const hashedPassword = await auth_1.AuthService.hashPassword(password);
        const user = await prisma_1.prisma.user.create({
            data: {
                email: email.toLowerCase(),
                password: hashedPassword,
                name: name.trim(),
                phone: phone?.trim() || null,
            },
        });
        const token = auth_1.AuthService.generateToken(user);
        const sanitizedUser = auth_1.AuthService.sanitizeUser(user);
        res.status(201).json({
            success: true,
            message: 'User registered successfully',
            data: {
                user: sanitizedUser,
                token,
            },
        });
    }
    catch (error) {
        console.error('Registration error:', error);
        res.status(500).json({
            success: false,
            message: 'Internal server error',
        });
    }
});
router.post('/login', async (req, res) => {
    try {
        const { email, password } = req.body;
        const validationErrors = validation_1.ValidationService.validateLogin({ email, password });
        if (validationErrors.length > 0) {
            res.status(400).json({
                success: false,
                message: 'Validation failed',
                errors: validationErrors,
            });
            return;
        }
        const user = await prisma_1.prisma.user.findUnique({
            where: { email: email.toLowerCase() },
        });
        if (!user) {
            res.status(401).json({
                success: false,
                message: 'Invalid email or password',
            });
            return;
        }
        if (!user.isActive) {
            res.status(401).json({
                success: false,
                message: 'Account is deactivated',
            });
            return;
        }
        const isPasswordValid = await auth_1.AuthService.comparePassword(password, user.password);
        if (!isPasswordValid) {
            res.status(401).json({
                success: false,
                message: 'Invalid email or password',
            });
            return;
        }
        const token = auth_1.AuthService.generateToken(user);
        const sanitizedUser = auth_1.AuthService.sanitizeUser(user);
        res.status(200).json({
            success: true,
            message: 'Login successful',
            data: {
                user: sanitizedUser,
                token,
            },
        });
    }
    catch (error) {
        console.error('Login error:', error);
        res.status(500).json({
            success: false,
            message: 'Internal server error',
        });
    }
});
router.get('/me', auth_2.authenticateToken, async (req, res) => {
    try {
        const userId = req.user?.userId;
        if (!userId) {
            res.status(401).json({
                success: false,
                message: 'User not authenticated',
            });
            return;
        }
        const user = await prisma_1.prisma.user.findUnique({
            where: { id: userId },
            select: {
                id: true,
                email: true,
                name: true,
                phone: true,
                isActive: true,
                createdAt: true,
                updatedAt: true,
            },
        });
        if (!user) {
            res.status(404).json({
                success: false,
                message: 'User not found',
            });
            return;
        }
        res.status(200).json({
            success: true,
            data: { user },
        });
    }
    catch (error) {
        console.error('Profile error:', error);
        res.status(500).json({
            success: false,
            message: 'Internal server error',
        });
    }
});
router.put('/me', auth_2.authenticateToken, async (req, res) => {
    try {
        const userId = req.user?.userId;
        const { name, phone } = req.body;
        if (!userId) {
            res.status(401).json({
                success: false,
                message: 'User not authenticated',
            });
            return;
        }
        const validationErrors = [];
        if (name !== undefined) {
            const nameError = validation_1.ValidationService.validateName(name);
            if (nameError)
                validationErrors.push(nameError);
        }
        if (phone !== undefined && phone !== null) {
            const phoneError = validation_1.ValidationService.validatePhone(phone);
            if (phoneError)
                validationErrors.push(phoneError);
        }
        if (validationErrors.length > 0) {
            res.status(400).json({
                success: false,
                message: 'Validation failed',
                errors: validationErrors,
            });
            return;
        }
        const updateData = {};
        if (name !== undefined)
            updateData.name = name.trim();
        if (phone !== undefined)
            updateData.phone = phone?.trim() || null;
        const user = await prisma_1.prisma.user.update({
            where: { id: userId },
            data: updateData,
            select: {
                id: true,
                email: true,
                name: true,
                phone: true,
                isActive: true,
                createdAt: true,
                updatedAt: true,
            },
        });
        res.status(200).json({
            success: true,
            message: 'Profile updated successfully',
            data: { user },
        });
    }
    catch (error) {
        console.error('Profile update error:', error);
        res.status(500).json({
            success: false,
            message: 'Internal server error',
        });
    }
});
router.post('/logout', auth_2.authenticateToken, async (req, res) => {
    res.status(200).json({
        success: true,
        message: 'Logged out successfully',
    });
});
exports.default = router;
//# sourceMappingURL=auth.js.map