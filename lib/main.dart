import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/inbox/activity_screen.dart';
import 'package:tiktok/features/onboarding/interests_screen.dart';
import 'package:tiktok/features/sign_up_screen.dart';
import 'package:tiktok/features/tab_navigation/main_navigation_screen.dart';

void main() async {
  //Flutter framework를 이용해 앱이 시작하기 전에 state를 어떤 식으로든
  //바꾸길 원한다면 engine과 widget의 연결을 확실하게 초기화해야 한다. 뭔소리래
  //이렇게 해놓으면 모든 Widget들이 engine과 연결된 것을 보장해줄 수 있다.
  WidgetsFlutterBinding.ensureInitialized();

  //화면을 오직 portrait으로만 고정시키고 싶을 때 이렇게 하면 된다.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //화면 최상단의 statusbar 아이콘들의 색깔을 정할 수 있다.
  //요건 앱 화면에 따라 바꿔줄 수도 있음.
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //오른쪽 상단에 deug 표시를 없애고 싶을 때 사용
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      theme: ThemeData(
        // splashColor: Colors.transparent,
        // highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
