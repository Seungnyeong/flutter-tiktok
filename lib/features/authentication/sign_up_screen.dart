import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/utils.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/";
  const SignUpScreen({super.key});

  void _onLoginTab(BuildContext context, Widget screen) async {
    final result = await Navigator.of(context).pushNamed(LoginScreen.routeName);
    print(result);
  }

  void _onEmailTab(BuildContext context, Widget screen) {
    // Navigator.of(context).push(
    //   PageRouteBuilder(
    //       transitionDuration: const Duration(seconds: 1),
    //       reverseTransitionDuration: const Duration(seconds: 1),
    //       pageBuilder: (context, animation, secondaryAnimation) => screen,
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         final offsetAnimation =
    //             Tween(begin: const Offset(1, 0), end: Offset.zero)
    //                 .animate(animation);
    //         final opacityAnimation =
    //             Tween(begin: 0.5, end: 1.0).animate(animation);
    //         return SlideTransition(
    //             position: offsetAnimation,
    //             child: FadeTransition(
    //               opacity: opacityAnimation,
    //               child: child,
    //             ));
    //       }),
    // );

    Navigator.of(context).pushNamed(UsernameScreen.routeName);
  }

  void _onTapNaivator(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    S.load(const Locale('en'));
    return OrientationBuilder(
      builder: (context, orientation) {
        // if (orientation == Orientation.landscape) {
        //   return const Scaffold(
        //     body: Center(
        //       child: Text('Please rotate ur phone.'),
        //     ),
        //   );
        // }
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size40,
              ),
              child: Column(
                children: [
                  Gaps.v80,
                  Text(S.of(context).signUpTitle("TikTok", DateTime.now()),
                      style: const TextStyle(
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.w700,
                      )),
                  Gaps.v20,
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      S.of(context).signUpSubtitle(0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    AuthButton(
                      clickFunc: () =>
                          _onTapNaivator(context, const UsernameScreen()),
                      icon: const FaIcon(FontAwesomeIcons.user),
                      text: S.of(context).useEmailPassword,
                    ),
                    Gaps.v16,
                    AuthButton(
                      clickFunc: () =>
                          _onEmailTab(context, const UsernameScreen()),
                      icon: const FaIcon(FontAwesomeIcons.apple),
                      text: S.of(context).continueWithApple,
                    ),
                  ],
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        Expanded(
                          child: AuthButton(
                            clickFunc: () =>
                                _onTapNaivator(context, const UsernameScreen()),
                            icon: const FaIcon(FontAwesomeIcons.user),
                            text: S.of(context).useEmailPassword,
                          ),
                        ),
                        Gaps.h16,
                        Expanded(
                          child: AuthButton(
                            clickFunc: () =>
                                _onTapNaivator(context, const UsernameScreen()),
                            icon: const FaIcon(FontAwesomeIcons.apple),
                            text: S.of(context).continueWithApple,
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: isDarkMode(context) ? null : Colors.grey.shade50,
            elevation: 2,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).alreadyHaveAnAccount),
                Gaps.h5,
                GestureDetector(
                  onTap: () => _onLoginTab(context, const LoginScreen()),
                  child: Text(
                    S.of(context).logIn('male'),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
