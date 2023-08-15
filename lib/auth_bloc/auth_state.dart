abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  //nanti ketika auth sukses maka akan mengirimkan nama ke home
  final String name;
  //constructornya
  AuthSuccess({required this.name});
}

class AuthError extends AuthState {
  //nanti ketika auth gagal akan mengirimkan pesan message nya
  final String message;
  //constructornya
  AuthError({required this.message});
}
