import 'package:flutter/material.dart';
import 'package:frontend/src/models/repo_stats.dart';
import 'package:frontend/src/widgets/repo_stats_grid.dart';
import 'package:frontend/src/widgets/repo_stats_header.dart';

class RepoStatsData extends StatelessWidget {
  const RepoStatsData({super.key, required this.repoStats});

  final RepoStats repoStats;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RepoStatsHeader(repoStats: repoStats),
        const SizedBox(height: 32),
        RepoStatsGrid(repoStats: repoStats),
      ],
    );
  }
}
