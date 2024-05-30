// login_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fffff/domain/entities/user_data.dart';
import 'package:fffff/infrastructure/api/user_api_provider.dart';
import 'package:jwt_decode/jwt_decode.dart';

class LoginState {
  final String email;
  final String password;
  final User? user;
  final bool isLoading;
  final String? error;

  LoginState({
    this.email = '',
    this.password = '',
    this.user,
    this.isLoading = false,
    this.error,
  });

  LoginState copyWith({
    String? email,
    String? password,
    User? user,
    bool? isLoading,
    String? error,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  final UserApi _userApi;

  LoginNotifier(this._userApi) : super(LoginState());

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<Map<String, dynamic>> login() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final token = await _userApi.login(state.email, state.password);
      print('Token: $token'); // Log the token

      Map<String, dynamic> payload = Jwt.parseJwt(token);
      print('Decoded Token Payload: $payload'); // Log the decoded token payload

      String role = payload['role'];
      print('User role: $role');

      // Create a User object based on the decoded token
      final user = User(
        id: payload['id'],
        name: payload['name'],
        email: state.email,
        role: role, password:payload['password'],
      );

      state = state.copyWith(user: user, isLoading: false);
      return {'token': token, 'user': user};
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      throw e;
    }
  }
}

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) {
    final userApi = ref.watch(userApiProvider);
    return LoginNotifier(userApi);
  },
);
