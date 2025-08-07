import 'dart:convert';
import 'dart:developer';

import 'package:backend/github_service.dart';
import 'package:globe_kv/globe_kv.dart';
import 'package:shelf/shelf.dart';

class StatsHandler {
  final GlobeKV _kv;
  final GitHubService _githubService;

  StatsHandler(this._kv, this._githubService);

  Future<Response> call(Request req, String owner, String repo) async {
    final repoName = '$owner/$repo';
    final cacheKey = 'github:stats:$repoName';
    final cachedStats = await _kv.getString(cacheKey);

    if (cachedStats != null) {
      log('CACHE HIT for $repoName');
      return Response.ok(
        cachedStats,
        headers: {'Content-Type': 'application/json', 'X-Cache-Status': 'HIT'},
      );
    }

    log('CACHE MISS for $repoName');
    try {
      final freshStats = await _githubService.getRepoStats(repoName);
      final statsJson = jsonEncode(freshStats);

      await _kv.set(cacheKey, statsJson, ttl: 300);

      return Response.ok(
        statsJson,
        headers: {'Content-Type': 'application/json', 'X-Cache-Status': 'MISS'},
      );
    } catch (e) {
      log('Error fetching fresh stats: $e');
      return Response.internalServerError(body: 'Could not retrieve stats.');
    }
  }
}
