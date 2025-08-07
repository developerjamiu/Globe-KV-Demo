import 'package:go_router/go_router.dart';
import 'package:frontend/src/pages/repo_search_page.dart';
import 'package:frontend/src/pages/repo_stats_page.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const RepoSearchPage()),
      GoRoute(
        path: '/stats/:org/:repo',
        builder: (context, state) {
          final org = Uri.decodeComponent(state.pathParameters['org']!);
          final repo = Uri.decodeComponent(state.pathParameters['repo']!);
          return RepoStatsPage(orgName: org, repoName: repo);
        },
      ),
    ],
  );
}
