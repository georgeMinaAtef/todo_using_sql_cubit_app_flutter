
import 'package:firebase_and_flutter_app/modules/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppData extends StatelessWidget {
  const AppData({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner:  false,
        title: 'ToDo App Using Firebase',
        theme: ThemeData(),
        home:  const HomeData(),
      ),
    );
  }
}
