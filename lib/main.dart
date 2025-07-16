import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan_provider/Provider/home.dart';
import 'package:latihan_provider/Provider/login.dart';
import 'package:latihan_provider/Provider/provider.dart';
import 'package:latihan_provider/database_latihan/utama.dart';
import 'package:latihan_provider/akses_Camera&Storage/halmedia.dart';
import 'package:provider/provider.dart' as provider;

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return provider.ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MaterialApp(
        // title: 'Latihan Provider',
        title: 'Latihan Todo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        // home: LoginPage(),
        // home: Utama(),
        home: Halmedia(),
      ),
    );
  }
}