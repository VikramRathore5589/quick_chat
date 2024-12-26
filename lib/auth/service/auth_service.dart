import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> googleLogIn() async {
    final GoogleSignInAccount? signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      throw 'Cancel google sign in process';
    }
    final GoogleSignInAuthentication googleSignInAuthentication =
        await signInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }

  Future logOut() async {
    await googleSignIn.signOut();
  }
}
