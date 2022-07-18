import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/character_select_screen.dart';
import 'screens/daily_arcane_river_screen.dart';
import 'screens/daily_bosses_screen.dart';
import 'screens/daily_tasks_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/summary_screen.dart';
import 'screens/weekly_bosses.screen.dart';
import 'screens/weekly_tasks_screen.dart';

void main() {
  runApp(const MapleTrackerApp());
}

class MapleTrackerApp extends StatelessWidget {
  const MapleTrackerApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: const Color(0xfff97316),
        appBarTheme: const AppBarTheme(
          color: Color(0xfff97316),
        ),
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      initialRoute: '/character-select',
      routes: {
        '/summary': (context) => const SummaryScreen(
              title: 'Summary',
            ),
        '/settings': (context) => const SettingsScreen(
              title: 'Settings',
            ),
        '/character-select': (context) => const CharacterSelectScreen(
              title: 'Character Select',
            ),
        '/daily-bosses': (context) => const DailyBossesScreen(
              title: 'Daily Bosses',
            ),
        '/daily-tasks': (context) => const DailyTasksScreen(
              title: 'Daily Tasks',
            ),
        '/daily-arcane-river': (context) => const DailyArcaneRiverScreen(
              title: 'Daily Arcane River',
            ),
        '/weekly-bosses': (context) => const WeeklyBossesScreen(
              title: 'Weekly Bosses',
            ),
        '/weekly-tasks': (context) => const WeeklyTasksScreen(
              title: 'Weekly Tasks',
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
