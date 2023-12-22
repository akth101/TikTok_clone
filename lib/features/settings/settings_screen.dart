import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            //ShowAboutDialog에 들어가서 View License를 클릭함현
            //현재 사용 중인 모든 오픈소스 소프트웨어 관련 라이센스가 들어가 있다.
            //이거 진짜 미쳤다.
            //이건 선택사항이 아니라 꼭 해야 되는 거임
            onTap: () => showAboutDialog(
              context: context,
              applicationVersion: "1.0",
              applicationLegalese: "All rights reserved. Please dont copy me",
            ),
            title: const Text(
              "About",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text("About this app..."),
          ),
          //위의 onTap, title, subtitle 등등을 축약해놓은 게 바로 AboutListTile
          const AboutListTile(),
        ],
      ),
    );
  }
}
