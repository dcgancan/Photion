import { Request, Response, NextFunction } from 'express';
import { JWTPayload } from '../lib/auth';
export interface AuthenticatedRequest extends Request {
    user?: JWTPayload;
}
export declare const authenticateToken: (req: AuthenticatedRequest, res: Response, next: NextFunction) => Promise<void>;
export declare const optionalAuth: (req: AuthenticatedRequest, res: Response, next: NextFunction) => Promise<void>;
//# sourceMappingURL=auth.d.ts.map