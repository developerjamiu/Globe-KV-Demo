import 'dart:convert';

import 'package:http/http.dart';

class GitHubService {
  GitHubService(this._client);

  final Client _client;

  static final _baseUrl = Uri.parse('https://api.github.com');

  Future<Map<String, dynamic>> getRepoStats(String repo) async {
    final response = await _client.get(_baseUrl.resolve('/repos/$repo'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      return {
        'name': data['name'] ?? 'N/A',
        'ownerLogin': data['owner']?['login'] ?? 'N/A',
        'ownerAvatarUrl': data['owner']?['avatar_url'] ?? '',
        'description': data['description'] ?? 'No description provided.',
        'stargazersCount': data['stargazers_count'] ?? 0,
        'forksCount': data['forks_count'] ?? 0,
        'openIssuesCount': data['open_issues_count'] ?? 0,
        'subscribersCount': data['subscribers_count'] ?? 0,
        'language': data['language'] ?? 'N/A',
        'lastUpdatedAt':
            DateTime.tryParse(data['updated_at'] ?? '') ??
            DateTime.now().toIso8601String(),
      };
    }

    throw Exception('Failed to load stats: ${response.statusCode}');
  }
}
