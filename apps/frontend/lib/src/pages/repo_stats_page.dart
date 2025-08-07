import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/models/repo_stats.dart';
import 'package:frontend/src/providers/stats_provider.dart';
import 'package:frontend/src/widgets/repo_stats_data.dart';
import 'package:frontend/src/widgets/repo_stats_error.dart';
import 'package:frontend/src/widgets/repo_stats_loading.dart';

class RepoStatsPage extends ConsumerWidget {
  const RepoStatsPage({
    super.key,
    required this.orgName,
    required this.repoName,
  });

  final String orgName;
  final String repoName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<RepoStats> repoStats = ref.watch(
      repoStatsProvider('$orgName/$repoName'),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: switch (repoStats) {
                AsyncData(:final value) => RepoStatsData(repoStats: value),
                AsyncError() => RepoStatsError(),
                _ => RepoStatsLoading(),
              },
            ),
          ),
        ),
      ),
    );
  }
}
