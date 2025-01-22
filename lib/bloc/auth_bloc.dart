import 'package:auth_flow/bloc/auth_event.dart';
import 'package:auth_flow/bloc/auth_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  bool _isPasswordVisible = false;
  bool _isRegisterPasswordVisible = false;
  bool _isRegisterConfirmPasswordVisible = false;

  AuthBloc(this._firebaseAuth, this._firebaseFirestore)
      : super(AuthInitialState()) {
    on<RegisterEvent>(_onRegisterEvent);
    on<LoginEvent>(_onLoginEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<ForgotPasswordEvent>(_onForgotPasswordEvent);
    on<TogglePasswordVisibilityEvent>(_onTogglePasswordVisibilityEvent);
    on<ToggleRegisterPasswordVisibilityEvent>(
        _onToggleRegisterPasswordVisibilityEvent);
    on<ToggleRegisterConfirmPasswordVisibilityEvent>(
        _onToggleRegisterConfirmPasswordVisibilityEvent);
  }

  Future<void> _onRegisterEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      await _firebaseFirestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'uid': userCredential.user?.uid,
        'email': event.email,
        'name': event.name, // Add this to the RegisterEvent
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState());
      emit(AuthInitialState());
    }
  }

  Future<void> _onLogoutEvent(
      LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await _firebaseAuth.signOut();
      emit(AuthLoggedOutState());
      emit(AuthInitialState());
    } catch (error) {
      emit(AuthErrorState());
    }
  }

  Future<void> _onForgotPasswordEvent(
      ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: event.email);
      emit(AuthPasswordResetEmailSentState());
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  void _onTogglePasswordVisibilityEvent(
      TogglePasswordVisibilityEvent event, Emitter<AuthState> emit) {
    _isPasswordVisible = !_isPasswordVisible;
    emit(PasswordVisibilityState(_isPasswordVisible));
  }

  void _onToggleRegisterPasswordVisibilityEvent(
      ToggleRegisterPasswordVisibilityEvent event, Emitter<AuthState> emit) {
    _isRegisterPasswordVisible = !_isRegisterPasswordVisible;
    emit(RegisterPasswordVisibilityState(_isRegisterPasswordVisible));
  }

  void _onToggleRegisterConfirmPasswordVisibilityEvent(
      ToggleRegisterConfirmPasswordVisibilityEvent event,
      Emitter<AuthState> emit) {
    _isRegisterConfirmPasswordVisible = !_isRegisterConfirmPasswordVisible;
    emit(RegisterConfirmPasswordVisibilityState(
        _isRegisterConfirmPasswordVisible));
  }
}
