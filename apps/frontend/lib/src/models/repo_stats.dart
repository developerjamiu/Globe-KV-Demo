class RepoStats {
  final String name;
  final String ownerLogin;
  final String ownerAvatarUrl;
  final String description;
  final int stargazersCount;
  final int forksCount;
  final int openIssuesCount;
  final int subscribersCount;
  final String language;
  final DateTime lastUpdatedAt;

  RepoStats({
    required this.name,
    required this.ownerLogin,
    required this.ownerAvatarUrl,
    required this.description,
    required this.stargazersCount,
    required this.forksCount,
    required this.openIssuesCount,
    required this.subscribersCount,
    required this.language,
    required this.lastUpdatedAt,
  });

  factory RepoStats.fromMap(Map<String, dynamic> json) {
    return RepoStats(
      name: json['name'] ?? 'N/A',
      ownerLogin: json['ownerLogin'] ?? 'N/A',
      ownerAvatarUrl: json['ownerAvatarUrl'] ?? '',
      description: json['description'] ?? 'No description provided.',
      stargazersCount: json['stargazersCount'] ?? 0,
      forksCount: json['forksCount'] ?? 0,
      openIssuesCount: json['openIssuesCount'] ?? 0,
      subscribersCount: json['subscribersCount'] ?? 0,
      language: json['language'] ?? 'N/A',
      lastUpdatedAt:
          DateTime.tryParse(json['lastUpdatedAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ownerLogin': ownerLogin,
      'ownerAvatarUrl': ownerAvatarUrl,
      'description': description,
      'stargazersCount': stargazersCount,
      'forksCount': forksCount,
      'openIssuesCount': openIssuesCount,
      'subscribersCount': subscribersCount,
      'language': language,
      'lastUpdatedAt': lastUpdatedAt.toIso8601String(),
    };
  }

  factory RepoStats.seeded() => RepoStats.fromMap({
    "name": "flutter",
    "ownerLogin": "flutter",
    "ownerAvatarUrl": "https://avatars.githubusercontent.com/u/14101776?v=4",
    "description":
        "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
    "stargazersCount": 171691,
    "language": "Dart",
    "forksCount": 28943,
    "openIssuesCount": 12095,
    "lastUpdatedAt": "2025-08-05T14:58:39Z",
    "subscribersCount": 3487,
  });
}
