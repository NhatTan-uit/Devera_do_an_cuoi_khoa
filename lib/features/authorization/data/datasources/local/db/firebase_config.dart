import '../../../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseConfig {
  Future<bool> isEmailVerified();

  Future<bool> emailAndPasswordLogIn(UserModel userModel);
  Future<bool> emailAndPasswordCheckLoginStatus();
  Future<UserModel> getAuthorizedUser();
  Future emailAndPasswordLogOut();

  Future<String> emailAndPasswordSignUp(UserModel userModel);
  Future<bool> emailAndPasswordSignUpVerifyEmail();
}

class FirebaseConfigImpl implements FirebaseConfig {
  @override
  Future<bool> emailAndPasswordLogIn(UserModel userModel) async {
    bool loginStatus = false;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userModel.userEmail.trim(),
          password: userModel.passWord.trim()
      );

      loginStatus = true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }

    return loginStatus;
  }

  @override
  Future<bool> emailAndPasswordCheckLoginStatus() async {
    bool loginStatus = false;
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        loginStatus = false;
      } else {
        print('User is signed in!');
        loginStatus = true;
      }
    });

    print(loginStatus);
    return loginStatus;
  }

  @override
  Future<UserModel> getAuthorizedUser() async {
    final user = await FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel(
      userId: user?.uid ?? '',
      userEmail: user?.email ?? '',
      passWord: '',
    );

    print(userModel.userId);
    return userModel;
  }

  @override
  Future emailAndPasswordLogOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<String> emailAndPasswordSignUp(UserModel userModel) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userModel.userEmail.trim(),
          password: userModel.passWord.trim()
      );

      return "";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  @override
  Future<bool> emailAndPasswordSignUpVerifyEmail() async {
    final user = await FirebaseAuth.instance.currentUser!;

    bool isVerify = await FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isVerify) {
      user.sendEmailVerification();
      return true;
    }

    return false;
  }

  @override
  Future<bool> isEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    return FirebaseAuth.instance.currentUser!.emailVerified;
  }
}