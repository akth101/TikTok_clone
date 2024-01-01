// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/username_screen.dart';
import 'package:tiktok/features/authentication/login_screen.dart';
import 'package:tiktok/features/authentication/widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/features/authentication/widgets/email_screen.dart';
import 'package:tiktok/utils.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/";

  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) async {
    //GoRouter를 설치했기 때문에 context에서 Push 메서드를 사용할 수 있는 거임

    context.push(LoginScreen.routName);
    //push는 이전 화면들의 스택 위에 새 화면을 쌓는다.
    //그래서 뒤로 가기같은 개념이 있다.
    // context.push(LoginScreen.routName);

    //go는 그런 개념이 아니다.
    //그냥 보내버리기만 할 뿐이다.
    //실제로 go를 사용하면 뒤로가기 버튼이 자동으로 생성되지 않는다.
    // context.go(LoginScreen.routName);
  }

  //이번 강의의 목표
  //Navigator.of(context).pushNamed("/username");
  //이런 식으로 페이지를 넘기는 것
  void _onEmailTap(BuildContext context) {
    //context를 아래와 같은 형식으로 사용하는 걸 inherited Widget이라고 한다.
    context.push(UserNameScreen.routeName);

    //이렇게도 쓸 수 있다.
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const SignUpScreen(),
    //   ),
    // );
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
                    onTap: () => _onLoginTap(context),
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
