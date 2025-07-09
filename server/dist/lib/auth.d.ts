import { User } from '@prisma/client';
export interface JWTPayload {
    userId: number;
    email: string;
}
export interface AuthUser {
    id: number;
    email: string;
    name: string | null;
    phone: string | null;
    isActive: boolean;
    createdAt: Date;
    updatedAt: Date;
}
export declare class AuthService {
    static hashPassword(password: string): Promise<string>;
    static comparePassword(password: string, hashedPassword: string): Promise<boolean>;
    static generateToken(user: User): string;
    static verifyToken(token: string): JWTPayload;
    static sanitizeUser(user: User): AuthUser;
}
//# sourceMappingURL=auth.d.ts.map