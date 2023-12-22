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
      body: ListWheelScrollView(
        //itemExtent는 리스트 안의 아이템 높이를 설정해줌
        itemExtent: 200,
        //돋보기 사용 가능
        useMagnifier: true,
        //확대 비율 설정
        magnification: 1.5,
        //얼마나 원형일 것이냐
        diameterRatio: 10,
        offAxisFraction: 1.2,
        children: [
          for (var x in [1, 2, 3, 1, 1, 1, 1, 1, 1])
            FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                color: Colors.teal,
                alignment: Alignment.center,
                child: const Text("pick me"),
              ),
            ),
        ],
      ),
    );
  }
}
