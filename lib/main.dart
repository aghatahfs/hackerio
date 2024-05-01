import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hackerio/theme/theme_data_style.dart';
import 'package:hackerio/views/bookmark.dart';
import 'package:hackerio/views/dashboard.dart';
import 'package:hackerio/views/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  bool _isDarkThemeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadDarkThemePreference();
  }

  Future<void> _loadDarkThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkThemeEnabled = prefs.getBool('dark_theme_enabled') ?? false;
    setState(() {
      _isDarkThemeEnabled = isDarkThemeEnabled;
    });
  }

  List<Widget> _page = <Widget>[
    DashboardPage(),
    BookmarkPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkThemeEnabled ? ThemeDataStyle.darkTheme : ThemeDataStyle.lightTheme,
      // darkTheme: darkTheme,
      home: Scaffold(
        body: _page[_selectedIndex],
        bottomNavigationBar: Container(
          color: Color.fromARGB(255, 20, 148, 20),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: GNav(
            backgroundColor: Color.fromARGB(255, 20, 148, 20),
            tabBackgroundColor: Color.fromARGB(255, 54, 177, 54),
            activeColor: Colors.white,
            color: Colors.white,
            gap: 8,
            padding: EdgeInsets.all(12),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.bookmark,
                text: 'Bookmark',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
