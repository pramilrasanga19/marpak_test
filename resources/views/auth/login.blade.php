<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8fafc;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .auth-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            width: 100%;
            max-width: 400px;
        }
        
        .auth-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #1a202c;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        .input-group {
            margin-bottom: 1rem;
        }
        
        .input-label {
            display: block;
            font-size: 0.875rem;
            color: #4a5568;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }
        
        .input-field {
            width: 100%;
            padding: 0.5rem 0.75rem;
            border: 1px solid #e2e8f0;
            border-radius: 4px;
            font-size: 1rem;
            transition: border-color 0.2s;
        }
        
        .input-field:focus {
            outline: none;
            border-color: #3182ce;
            box-shadow: 0 0 0 3px rgba(49, 130, 206, 0.2);
        }
        
        .error-message {
            color: #e53e3e;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
            margin: 1rem 0;
        }
        
        .remember-checkbox {
            margin-right: 0.5rem;
        }
        
        .remember-text {
            font-size: 0.875rem;
            color: #4a5568;
        }
        
        .action-buttons {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 1.5rem;
        }
        
        .forgot-password {
            color: #4299e1;
            font-size: 0.875rem;
            text-decoration: none;
        }
        
        .forgot-password:hover {
            text-decoration: underline;
        }
        
        .login-button {
            background-color: #4299e1;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 0.5rem 1rem;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        
        .login-button:hover {
            background-color: #3182ce;
        }
        
        .register-button {
            background-color: #48bb78;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 0.5rem 1rem;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            transition: background-color 0.2s;
            margin-top: 1rem;
            width: 100%;
        }
        
        .register-button:hover {
            background-color: #38a169;
        }
        
        .session-status {
            color: #2f855a;
            background-color: #f0fff4;
            padding: 0.75rem;
            border-radius: 4px;
            margin-bottom: 1rem;
            font-size: 0.875rem;
        }
        
        .error-feedback {
            color: #e53e3e;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
    </style>
</head>
<body>
    <div class="auth-container">
        <!-- Session Status -->
        @if(session('status'))
            <div class="session-status">
                {{ session('status') }}
            </div>
        @endif

        <h1 class="auth-title">Login</h1>

        <form method="POST" action="{{ route('login') }}">
            @csrf

            <!-- Email Address -->
            <div class="input-group">
                <label class="input-label" for="email">Email</label>
                <input id="email" class="input-field" type="email" name="email" value="{{ old('email') }}" required autofocus autocomplete="username">
                @error('email')
                    <div class="error-message">{{ $message }}</div>
                @enderror
            </div>

            <!-- Password -->
            <div class="input-group">
                <label class="input-label" for="password">Password</label>
                <input id="password" class="input-field" type="password" name="password" required autocomplete="current-password">
                @error('password')
                    <div class="error-message">{{ $message }}</div>
                @enderror
            </div>

            <!-- Remember Me -->
            <div class="remember-me">
                <input id="remember_me" type="checkbox" class="remember-checkbox" name="remember">
                <label for="remember_me" class="remember-text">Remember me</label>
            </div>

            <div class="action-buttons">
                @if (Route::has('password.request'))
                    <a class="forgot-password" href="{{ route('password.request') }}">
                        Forgot your password?
                    </a>
                @endif

                <button type="submit" class="login-button">
                    Log in
                </button>
            </div>
        </form>

        <a href="{{ route('register') }}" class="register-button">
            Register
        </a>
    </div>
</body>
</html>