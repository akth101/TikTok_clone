import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/username_screen.dart';
import 'package:tiktok/features/authentication/login_screen.dart';
import 'package:tiktok/features/authentication/widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const UserNameScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        // if (orientation == Orientation.landscape) {
        //   return const Scaffold(
        //     body: Center(
        //       child: Text("Plz rotate your phone"),
        //     ),
        //   );
        // }

        print(orientation);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size40,
              ),
              child: Column(
                children: [
                  Gaps.v80,
                  const Text(
                    'Sign up for TikTok',
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v20,
                  const Text(
                    'Create a profile, follow other accounts, make your own videos, and more.',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gaps.v40,
                  //collection if or for는 오직 하나의 대상에만 적용된다.
                  //... 이게 List를 없애는 것과 같다? 먼소리지
                  if (orientation == Orientation.portrait) ...[
                    GestureDetector(
                      onTap: () => _onEmailTap(context),
                      child: const AuthButton(
                        icon: FaIcon(FontAwesomeIcons.user),
                        text: "Use email & password",
                      ),
                    ),
                    Gaps.v16,
                    const AuthButton(
                      icon: FaIcon(FontAwesomeIcons.apple),
                      text: "Continue with Apple",
                    ),
                  ],
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onEmailTap(context),
                            child: const AuthButton(
                              icon: FaIcon(FontAwesomeIcons.user),
                              text: "Use email & password",
                            ),
                          ),
                        ),
                        Gaps.h16,
                        const Expanded(
                          child: AuthButton(
                            icon: FaIcon(FontAwesomeIcons.apple),
                            text: "Continue with Apple",
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            // elevation: 2,
            //darkMode일 때 color가 Null이면 자동을 dartTheme이 사용됨
            color: isDarkMode(context) ? null : Colors.grey.shade50,
            child: Padding(
              padding: const EdgeInsets.only(
                top: Sizes.size32,
                bottom: Sizes.size64,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account'),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onSignUpTap(context),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
