import 'dart:io';
import 'dart:developer';

import 'package:backend/github_service.dart';
import 'package:backend/stats_handler.dart';
import 'package:globe_kv/globe_kv.dart';
import 'package:http/http.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  final kvNameSpaceId = Platform.environment['KV_NAMESPACE_ID'] ?? '';

  final kv = GlobeKV(kvNameSpaceId);
  final githubService = GitHubService(Client());
  final statsHandler = StatsHandler(kv, githubService);

  final app = Router();

  app.get('/stats/<owner>/<repo>', statsHandler.call);

  var handler = const Pipeline()
      .addMiddleware(corsHeaders())
      .addMiddleware(logRequests())
      .addHandler(app.call);

  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await serve(handler.call, ip, port);
  log('Server listening on port ${server.port}');
}
