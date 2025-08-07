import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/models/repo_stats.dart';
import 'package:http/http.dart' as http;

final repoStatsProvider = FutureProvider.autoDispose.family<RepoStats, String>((
  ref,
  String repoName,
) async {
  final response = await http.get(
    Uri.https('repo-stats-backend.globeapp.dev', '/stats/$repoName'),
  );

  final json = jsonDecode(response.body) as Map<String, dynamic>;

  return RepoStats.fromMap(json);
});
