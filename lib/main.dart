import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
      //themeMode는 핸드폰에 ligiht or dark모드를 쓸지 알려주는 역할을 함.
      //앱이 실행되는 기기환경에 맞추는게 system
      //아이폰이 다크모드면 우리 앱도 다크모드가 될것임 개쩐다. 미쳤다.
      //물론 system 대신 dark, light도 사용가능
      //주의주의주의 ::: 앱에 darkMode를 적용할지 말지 반드시 생각하고 나서 만들어야 함.
      //위젯 일일이 찾아다니면서 일일이 색깔 뒤바꾸고 싶지 않다면
      themeMode: ThemeMode.system,
      //모든 디자인 관련한 부분은 여기다 때려넣는 게 가장 좋다. 그러면 일일이
      //페이지마다 색깔 설정할 필요가 없어진다.
      theme: ThemeData(
        textTheme: GoogleFonts.itimTextTheme(),
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade50,
        ),
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
      darkTheme: ThemeData(
        //text 색깔을 사용자가 설정하지 않은 텍스트들을 모조리
        //하얀색으로 바꿔줌. 미쳤다 미쳤어
        textTheme: GoogleFonts.itimTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade800,
        ),
        primaryColor: const Color(0xFFE9435A),
      ),
      home: const SignUpScreen(),
    );
  }
}

//layoutBuilder
// 이걸 Scaffold의 body에 넣는다면 화면의 크기를 알려줄 것이다.
// 그게 가질 수 있는 width의 최대값이니까
// 현재 어느정도까지 커질 수 있는지 알려주는 게 역할
//화면 크기가 아닌 그 부모의 크기를 알고 싶을 때 유용
//전체 화면 크기는 MediaQuery로, 부모의 크기는 layoutBuilder로
