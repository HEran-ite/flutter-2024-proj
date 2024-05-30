import 'package:fffff/domain/entities/signup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



// StateNotifier class for Signup
class SignupNotifier extends StateNotifier<SignupState> {
  SignupNotifier() : super(SignupState());

  void setIsAdmin(bool isAdmin) {
    state = state.copyWith(isAdmin: isAdmin);
  }

  void setFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setConfirmPassword(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }
}
