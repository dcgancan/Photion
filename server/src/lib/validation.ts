export interface ValidationError {
  field: string;
  message: string;
}

export class ValidationService {
  static validateEmail(email: string): ValidationError | null {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    
    if (!email || email.trim().length === 0) {
      return { field: 'email', message: 'Email is required' };
    }
    
    if (!emailRegex.test(email)) {
      return { field: 'email', message: 'Please enter a valid email address' };
    }
    
    return null;
  }

  static validatePassword(password: string): ValidationError | null {
    if (!password || password.length === 0) {
      return { field: 'password', message: 'Password is required' };
    }
    
    if (password.length < 8) {
      return { field: 'password', message: 'Password must be at least 8 characters long' };
    }
    
    if (!/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/.test(password)) {
      return { field: 'password', message: 'Password must contain at least one uppercase letter, one lowercase letter, and one number' };
    }
    
    return null;
  }

  static validateName(name: string): ValidationError | null {
    if (!name || name.trim().length === 0) {
      return { field: 'name', message: 'Name is required' };
    }
    
    if (name.trim().length < 2) {
      return { field: 'name', message: 'Name must be at least 2 characters long' };
    }
    
    return null;
  }

  static validatePhone(phone: string): ValidationError | null {
    if (!phone) return null; // Phone is optional
    
    const phoneRegex = /^[+]?[\d\s\-()]{10,15}$/;
    
    if (!phoneRegex.test(phone)) {
      return { field: 'phone', message: 'Please enter a valid phone number' };
    }
    
    return null;
  }

  static validateRegistration(data: {
    email: string;
    password: string;
    name: string;
    phone?: string;
  }): ValidationError[] {
    const errors: ValidationError[] = [];
    
    const emailError = this.validateEmail(data.email);
    if (emailError) errors.push(emailError);
    
    const passwordError = this.validatePassword(data.password);
    if (passwordError) errors.push(passwordError);
    
    const nameError = this.validateName(data.name);
    if (nameError) errors.push(nameError);
    
    if (data.phone) {
      const phoneError = this.validatePhone(data.phone);
      if (phoneError) errors.push(phoneError);
    }
    
    return errors;
  }

  static validateLogin(data: { email: string; password: string }): ValidationError[] {
    const errors: ValidationError[] = [];
    
    const emailError = this.validateEmail(data.email);
    if (emailError) errors.push(emailError);
    
    if (!data.password || data.password.length === 0) {
      errors.push({ field: 'password', message: 'Password is required' });
    }
    
    return errors;
  }
}