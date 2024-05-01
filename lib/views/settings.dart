import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkThemeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadDarkThemePreference();
  }

  Future<void> _loadDarkThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkThemeEnabled = prefs.getBool('dark_theme_enabled') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text("Dark theme"),
            trailing: Switch(
              value: _isDarkThemeEnabled,
              onChanged: (value) {
                setState(() {
                  _isDarkThemeEnabled = value;
                  _saveDarkThemePreference(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveDarkThemePreference(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark_theme_enabled', value);
  }
}
