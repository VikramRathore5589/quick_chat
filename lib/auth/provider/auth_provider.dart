import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_chat/auth/service/auth_service.dart';
import 'package:quick_chat/core/core.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService authService;
  bool isLoading = false;
  String? errorMsg;
  User? user;

  AuthProvider(this.authService);

  Future<User?> googleLogIn() async {
    try {
      errorMsg = null;
      isLoading = true;
      notifyListeners();
      user = await authService.googleLogIn();
      if (user != null) {
        Core.flutterToast('Login successfully');
        isLoading = false;
      }
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMsg = e.toString();
      Core.flutterToast(errorMsg!);
    }
    notifyListeners();
    return null;
  }
}
