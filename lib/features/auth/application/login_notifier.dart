import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:citybuddy/data/models/user_model.dart';
import 'package:citybuddy/features/auth/data/repositories/auth_repository.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, AsyncValue<UserModel>>(
  (ref) => LoginNotifier(),
);

class LoginNotifier extends StateNotifier<AsyncValue<UserModel>> {
  LoginNotifier() : super(const AsyncValue.loading());

  final _repo = AuthRepository();

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _repo.login(email, password);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}