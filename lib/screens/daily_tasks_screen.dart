import 'package:flutter/material.dart';

class DailyTasksScreen extends StatelessWidget {
  const DailyTasksScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        actions: const [],
      ),
      body: const Text('Help'),
    );
  }
}
