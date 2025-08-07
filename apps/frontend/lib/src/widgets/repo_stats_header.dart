import 'package:flutter/material.dart';
import 'package:frontend/src/models/repo_stats.dart';
import 'package:intl/intl.dart';

class RepoStatsHeader extends StatelessWidget {
  const RepoStatsHeader({super.key, required this.repoStats});

  final RepoStats repoStats;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              key: Key(repoStats.ownerAvatarUrl),
              backgroundImage: NetworkImage(repoStats.ownerAvatarUrl),
              radius: 24,
              backgroundColor: Colors.grey.shade800,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  repoStats.name,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'by ${repoStats.ownerLogin}',
                  style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          repoStats.description,
          style: TextStyle(fontSize: 16, color: Colors.grey[300], height: 1.5),
        ),
        const SizedBox(height: 8),
        Text(
          'Last updated: ${DateFormat.yMMMMd().format(repoStats.lastUpdatedAt)}',
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
