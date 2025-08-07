import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RepoSearchPage extends StatefulWidget {
  const RepoSearchPage({super.key});

  @override
  State<RepoSearchPage> createState() => _RepoSearchPageState();
}

class _RepoSearchPageState extends State<RepoSearchPage> {
  late final _orgController = TextEditingController();
  late final _repoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _searchRepository() {
    if (_formKey.currentState!.validate()) {
      final org = Uri.encodeComponent(_orgController.text.trim());
      final repo = Uri.encodeComponent(_repoController.text.trim());
      context.go('/stats/$org/$repo');
    }
  }

  @override
  void dispose() {
    _orgController.dispose();
    _repoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'GitHub Repository Stats',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Enter an organization and repository name to see its stats.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 48),
                  TextFormField(
                    controller: _orgController,
                    decoration: const InputDecoration(
                      hintText: 'e.g., developerjamiu',
                      labelText: 'Organization',
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter an organization' : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _repoController,
                    decoration: const InputDecoration(
                      hintText: 'e.g., flutter',
                      labelText: 'Repository',
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a repository' : null,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _searchRepository,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Get Stats',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
