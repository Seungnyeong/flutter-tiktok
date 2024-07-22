import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';
import 'package:tiktok_clone/firebase_options.dart';
import 'package:tiktok_clone/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAuth.instance.signOut();
  });

  testWidgets("Create Account Folow", (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(
        // overrides: [
        //   playbackConfigProvider.overrideWith(() => PlaybackConfigViewModel(_repository))
        // ],
        child: TikTokApp()));

    await tester.pumpAndSettle();
    final login = find.text("Log in");
    expect(find.text("Sign up for TikTok"), findsOneWidget);
    expect(login, findsOneWidget);
    await tester.tap(find.text("Log in"));
    await tester.pumpAndSettle(const Duration(
      seconds: 20,
    ));
    final signUp = find.text("Sign up");
    expect(signUp, findsOneWidget);
    await tester.tap(signUp);
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 10));
    final emailButton = find.text("Use email & password");
    expect(emailButton, findsOneWidget);
    await tester.tap(emailButton);
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final usernameInput = find.byType(TextField).first;
    await tester.enterText(usernameInput, "test");
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 10));
    await tester.tap(find.text("Next"));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 10));
    final emailInput = find.byType(TextField).first;
    await tester.enterText(emailInput, "test@testing.com");
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 10));
    final passwordInput = find.byType(TextField).first;
    await tester.enterText(passwordInput, "sdfsdf");
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 10));
    await tester.tap(find.text("Next"));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 10));
  });
}
