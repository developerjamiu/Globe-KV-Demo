import 'package:flutter/material.dart';
import 'package:frontend/src/router.dart';

class RepoStatsApp extends StatelessWidget {
  const RepoStatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Repo Stats',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
