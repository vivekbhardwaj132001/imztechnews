import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          _buildSectionHeader('Appearance'),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Dark Mode'),
                  subtitle: const Text('Toggle between light and dark themes'),
                  secondary: Icon(
                    themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
                    color: colorScheme.primary,
                  ),
                  value: themeMode == ThemeMode.dark,
                  onChanged: (_) =>
                      ref.read(themeControllerProvider.notifier).toggleTheme(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildSectionHeader('Data Management'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.delete_outline, color: Colors.redAccent),
                  title: const Text('Clear News Cache'),
                  subtitle: const Text('Remove all locally stored articles'),
                  onTap: () => _showClearCacheDialog(context, 'articles_box', 'News cache cleared'),
                ),
                const Divider(indent: 56, endIndent: 16, height: 1),
                ListTile(
                  leading: const Icon(Icons.bookmark_remove_outlined, color: Colors.redAccent),
                  title: const Text('Clear All Bookmarks'),
                  subtitle: const Text('Permanently remove your saved articles'),
                  onTap: () => _showClearCacheDialog(context, 'bookmarks_box', 'All bookmarks removed'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Center(
            child: Column(
              children: [
                Text(
                  'IMZ NEWS',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                    color: Colors.grey[400],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  void _showClearCacheDialog(BuildContext context, String boxName, String successMsg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Action'),
        content: Text('Are you sure you want to $successMsg? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () async {
              await Hive.box(boxName).clear();
              if (context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(successMsg), behavior: SnackBarBehavior.floating),
                );
              }
            },
            child: const Text('CLEAR', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
