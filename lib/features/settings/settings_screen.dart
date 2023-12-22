import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          //안드로이드냐 ios냐에 따라 자동으로 바꿔줌
          Switch.adaptive(
            value: _notifications,
            onChanged: _onNotificationChanged,
          ),
          CupertinoSwitch(
            value: _notifications,
            onChanged: _onNotificationChanged,
          ),
          Switch(
            value: _notifications,
            onChanged: _onNotificationChanged,
          ),
          Checkbox(
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _onNotificationChanged,
          ),
          CheckboxListTile(
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _onNotificationChanged,
            title: const Text("Enable Notifications"),
          ),
          ListTile(
            //showDatePicker가 제일 인상깊은 점은
            //DateTime이 Futre에서 반환될 수도 있다는 것

            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
              );
              print(date);
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                      appBarTheme: const AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              print(booking);
            },
            title: const Text("What is your birthday"),
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}
