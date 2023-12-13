import 'package:flutter/material.dart';
import 'package:kash_app/features/profile/presentation/page/profile_screen.dart';
import 'package:kash_app/utils/serivice_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileScreen(),
    );
  }
}
