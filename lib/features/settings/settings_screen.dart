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
      body: const Column(
        children: [
          CupertinoActivityIndicator(
            radius: 40,
            animating: false,
          ),
          CircularProgressIndicator(),
          //유저가 어떤 os를 사용하는지 인식하고 자동으로 바꿔줌
          //조건문 그런 거 필요없음. 그냥 이거 하나면 알아서 해줌
          //ios simulator 쓴다? 그러면 자동으로 쿠퍼티노 스타일로 바꿔줌
          //미쳤다.
          CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}
