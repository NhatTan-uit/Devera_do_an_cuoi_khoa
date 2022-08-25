import '../../../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseConfig {
  Future<bool> isEmailVerified();

  Future emailAndPasswordLogIn(UserModel userModel);
  Future<bool> emailAndPasswordCheckLoginStatus();
  Future<UserModel> getAuthorizedUser();
  Future emailAndPasswordLogOut();

  Future<String> emailAndPasswordSignUp(UserModel userModel);
  Future<bool> emailAndPasswordSignUpVerifyEmail();
}

class FirebaseConfigImpl implements FirebaseConfig {
  @override
  Future emailAndPasswordLogIn(UserModel userModel) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userModel.userEmail.trim(),
          password: userModel.passWord.trim()
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Future<bool> emailAndPasswordCheckLoginStatus() async {
    await FirebaseAuth.instance.currentUser!.reload();

    final isUser = await FirebaseAuth.instance.authStateChanges();

    if (isUser != null) {
      return true;
    }
    else {
      return false;
    }
  }

  @override
  Future<UserModel> getAuthorizedUser() async {
    final user = await FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel(
      userId: user?.uid ?? '',
      userEmail: user?.email ?? '',
      passWord: '',
    );

    print(userModel);
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