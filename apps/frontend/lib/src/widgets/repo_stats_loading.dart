import 'package:flutter/material.dart';
import 'package:frontend/src/models/repo_stats.dart';
import 'package:frontend/src/widgets/repo_stats_grid.dart';
import 'package:frontend/src/widgets/repo_stats_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RepoStatsLoading extends StatelessWidget {
  const RepoStatsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final repoStats = RepoStats.seeded();

    return Skeletonizer(
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RepoStatsHeader(repoStats: repoStats),
          const SizedBox(height: 32),
          RepoStatsGrid(repoStats: repoStats),
        ],
      ),
    );
  }
}
