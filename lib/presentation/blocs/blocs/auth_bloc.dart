import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/presentation/blocs/events/auth_event.dart';
import 'package:flutter_bloc_architecture/presentation/blocs/states/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    // Simula il login
    if (event.email == 'admin' && event.password == 'admin') {
      emit(state.copyWith(isLoggedIn: true));
    } else {
      emit(state.copyWith(isLoggedIn: false));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoggedIn: false));
  }
}
