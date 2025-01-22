abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {}

class AuthLoggedOutState extends AuthState {}

class AuthPasswordResetEmailSentState extends AuthState {}

class PasswordVisibilityState extends AuthState {
  final bool isPasswordVisible;
  PasswordVisibilityState(this.isPasswordVisible);
}

class RegisterPasswordVisibilityState extends AuthState {
  final bool isRegisterPasswordVisible;
  RegisterPasswordVisibilityState(this.isRegisterPasswordVisible);
}

class RegisterConfirmPasswordVisibilityState extends AuthState {
  final bool isRegisterConfirmPasswordVisible;
  RegisterConfirmPasswordVisibilityState(this.isRegisterConfirmPasswordVisible);
}
