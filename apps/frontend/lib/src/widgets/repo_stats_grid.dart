import 'package:flutter/material.dart';
import 'package:frontend/src/models/repo_stats.dart';
import 'package:frontend/src/widgets/repo_stats_card.dart';

class RepoStatsGrid extends StatelessWidget {
  const RepoStatsGrid({super.key, required this.repoStats});

  final RepoStats repoStats;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 4;
        if (constraints.maxWidth < 1000) crossAxisCount = 3;
        if (constraints.maxWidth < 700) crossAxisCount = 2;
        if (constraints.maxWidth < 450) crossAxisCount = 1;

        return GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: (crossAxisCount == 1) ? 3 : 1.5,
          children: [
            RepoStatCard(
              key: ValueKey(repoStats.stargazersCount),
              title: 'Stars',
              value: repoStats.stargazersCount,
              icon: Icons.star_rounded,
              color1: const Color(0xFFFBCF33),
              color2: const Color(0xFFF5A623),
            ),
            RepoStatCard(
              title: 'Forks',
              value: repoStats.forksCount,
              icon: Icons.call_split_rounded,
              color1: const Color(0xFF50E3C2),
              color2: const Color(0xFF20C997),
            ),
            RepoStatCard(
              title: 'Open Issues',
              value: repoStats.openIssuesCount,
              icon: Icons.error_outline_rounded,
              color1: const Color(0xFFF06292),
              color2: const Color(0xFFE91E63),
            ),
            RepoStatCard(
              title: 'Subscribers',
              value: repoStats.subscribersCount,
              icon: Icons.visibility_rounded,
              color1: const Color(0xFF748EF6),
              color2: const Color(0xFF5C6BC0),
            ),
          ],
        );
      },
    );
  }
}
