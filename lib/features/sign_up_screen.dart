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

  void _onSignUpTap(BuildContext context) async {
    //push는 future를 리턴하기 때문에 결과를 await할 수 있음
    //pop에서 뭔가 데이터를 보냈다면 이렇게 받을 수 있음
    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
    print(result);

    //유저가 이 페이지로 돌아왔는지 알고 싶으면 그냥 이렇게 하면 됨
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
    print("user come back");
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
          //원래 이자리는 bottomAppBar자리였는데 material 3에서는
          //못 쓴다고 해서 Container로 바꿨음
          bottomNavigationBar: Container(
            //darkMode일 때 color가 Null이면 자동으로 dartTheme이 사용됨
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
