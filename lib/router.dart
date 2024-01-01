import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/features/authentication/login_screen.dart';
import 'package:tiktok/features/authentication/username_screen.dart';
import 'package:tiktok/features/authentication/widgets/email_screen.dart';
import 'package:tiktok/features/sign_up_screen.dart';
import 'package:tiktok/features/users/user_profile_screen.dart';

//builder는 해당 위젯의 상태가 변경될 때마다
//UI를 업데이트하는 역할을 한다.

//만약에 내가 만드는 프로그램이 죽어도 웹을 지원하지 않을 거라면
//GoRouter 안 쓰고 Navigator ver.1 써도 아무런 상관이 없다.

//화면은 계속 바뀌는데 브라우저 url창에 있는 url은 바뀌지 않았으면 한다?
//그럼 GoRouter랑 Navigator ver.1을 섞어서 쓰자.

final router = GoRouter(
  routes: [
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: UserNameScreen.routeName,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const UserNameScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        );
      },
    ),
    GoRoute(
      path: EmailScreen.routeName,
      builder: (context, state) => const EmailScreen(),
    ),
    GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final username = state.params['username'];
        final tab = state.queryParams["show"];
        print(state.params);
        return UserProfileScreen(username: username!, tab: tab!);
      },
    ),
  ],
);
