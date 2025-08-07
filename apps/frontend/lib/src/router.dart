import 'package:frontend/src/pages/repo_not_found_page.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/src/pages/repo_search_page.dart';
import 'package:frontend/src/pages/repo_stats_page.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const RepoSearchPage()),
      GoRoute(
        path: '/stats',
        builder: (context, state) {
          final org = state.uri.queryParameters['org'] ?? '';
          final repo = state.uri.queryParameters['repo'] ?? '';

          if (org.isEmpty || repo.isEmpty) {
            return const RepoNotFoundPage();
          }

          return RepoStatsPage(orgName: org, repoName: repo);
        },
      ),
    ],
  );
}
