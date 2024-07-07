import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_sign_in/github_sign_in.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn => user != null;
  User? get user => _firebaseAuth.currentUser;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<UserCredential> signUp(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> githubSignIn(BuildContext context) async {
    // await _firebaseAuth.signInWithProvider(GithubAuthProvider());
    final String clientId = dotenv.env['GITHUB_CLIENT_ID']!;
    final String clientSecret = dotenv.env['GITHUB_CLIENT_SECRET']!;
    final String redirectUrl = dotenv.env['GITHUB_REDIRECT_URL']!;

    final GitHubSignIn githubSignIn = GitHubSignIn(
        clientId: clientId,
        clientSecret: clientSecret,
        redirectUrl: redirectUrl);
    final result = await githubSignIn.signIn(context);
    final githubAuthCredential = GithubAuthProvider.credential(result.token!);
    return await FirebaseAuth.instance
        .signInWithCredential(githubAuthCredential);
  }
}

final authRepo = Provider((ref) => AuthenticationRepository());
final authState = StreamProvider((ref) {
  final repo = ref.read(authRepo);
  return repo.authStateChanges();
});
