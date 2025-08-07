import 'package:flutter/material.dart';
import 'package:frontend/src/pages/repo_search_page.dart';

class RepoStatsApp extends StatelessWidget {
  const RepoStatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Repo Stats',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      debugShowCheckedModeBanner: false,
      home: const RepoSearchPage(),
    );
  }
}
