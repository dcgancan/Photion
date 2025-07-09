export interface ValidationError {
    field: string;
    message: string;
}
export declare class ValidationService {
    static validateEmail(email: string): ValidationError | null;
    static validatePassword(password: string): ValidationError | null;
    static validateName(name: string): ValidationError | null;
    static validatePhone(phone: string): ValidationError | null;
    static validateRegistration(data: {
        email: string;
        password: string;
        name: string;
        phone?: string;
    }): ValidationError[];
    static validateLogin(data: {
        email: string;
        password: string;
    }): ValidationError[];
}
//# sourceMappingURL=validation.d.ts.map