import 'package:flutter/material.dart';

class RepoStatsError extends StatelessWidget {
  const RepoStatsError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error fetching repo stats',
        style: TextStyle(color: Colors.red, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
