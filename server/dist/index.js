"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
require("dotenv/config");
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const morgan_1 = __importDefault(require("morgan"));
const health_1 = __importDefault(require("./routes/health"));
const database_1 = __importDefault(require("./routes/database"));
const errorHandler_1 = require("./middlewares/errorHandler");
const prisma_1 = require("./lib/prisma");
const app = (0, express_1.default)();
const PORT = process.env.PORT || 3000;
app.use((0, cors_1.default)());
app.use((0, morgan_1.default)('combined'));
app.use(express_1.default.json());
app.use(express_1.default.urlencoded({ extended: true }));
app.get('/', (req, res) => {
    res.json({ message: 'Photion Server is running!' });
});
app.use('/api', health_1.default);
app.use('/api/db', database_1.default);
app.use(errorHandler_1.notFoundHandler);
app.use(errorHandler_1.globalErrorHandler);
async function connectToDatabase() {
    try {
        await prisma_1.prisma.$connect();
        console.log('✅ Database connected successfully');
    }
    catch (error) {
        console.error('❌ Database connection failed:', error);
        console.log('⚠️  Server will continue without database for development...');
    }
}
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
//# sourceMappingURL=index.js.map