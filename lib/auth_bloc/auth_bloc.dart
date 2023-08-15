import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_auth/auth_bloc/auth_event.dart';
import 'package:flutter_bloc_example_auth/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      //emit adalah gerbang untuk merubah state
      //ketika login maka akan loading terlebih dahulu
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 1));
      //ketika login sukses maka akan mengirimkan nama Mario
      emit(AuthSuccess(name: 'Mario'));
    });

    on<LogoutEvent>((event, emit) async {
      //Ketika logout maka akan loading terlebih dahulu
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 1));
      //ketika logout sukses maka akan kembali ke halaman awal
      emit(AuthInitial());
    });
  }
}
