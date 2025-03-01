part of 'auth.cubit.dart';

class AuthState extends ErrorState {
  final bool isAuthanticated;

  AuthState({required this.isAuthanticated, String? error})
    : super(error);

  factory AuthState.initial() => AuthState(isAuthanticated: false);

  AuthState _authenticated() => _copyWith(isAuthanticated: true);
  AuthState _unauthenticated() => _copyWith(isAuthanticated: false);
  AuthState _loading() => _copyWith();
  AuthState _error(String error) => _copyWith(error: error);

  AuthState _copyWith({bool? isAuthanticated, String? error}) =>
      AuthState(
        isAuthanticated: isAuthanticated ?? this.isAuthanticated,
        error: error,
      );
}