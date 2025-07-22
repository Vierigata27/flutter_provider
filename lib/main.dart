import 'package:firebase_core/firebase_core.dart';
import 'package:latihan_provider/hal_transaksi/pay_page.dart';
import 'package:latihan_provider/providers/chat_providers.dart';
import 'package:latihan_provider/screens/chat_screens.dart';
import 'package:latihan_provider/service/fcm_service.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Untuk ProviderScope
import 'package:latihan_provider/Provider/home.dart'; // Import yang mungkin tidak digunakan jika hanya fokus ke chat
import 'package:latihan_provider/Provider/login.dart'; // Import yang mungkin tidak digunakan jika hanya fokus ke chat
import 'package:latihan_provider/Provider/provider.dart'; // Import yang mungkin tidak digunakan jika hanya fokus ke chat
import 'package:latihan_provider/database_latihan/utama.dart'; // Import yang mungkin tidak digunakan jika hanya fokus ke chat
import 'package:latihan_provider/akses_Camera&Storage/halmedia.dart'; // Import yang mungkin tidak digunakan jika hanya fokus ke chat
import 'package:latihan_provider/akses_googlemaps/maps.dart'; // Import yang mungkin tidak digunakan jika hanya fokus ke chat
import 'package:latihan_provider/halaman_animasi/hal_animasi.dart'; // Import yang mungkin tidak digunakan jika hanya fokus ke chat
import 'package:latihan_provider/screens/notification_screen.dart';
import 'package:latihan_provider/service/notification_service.dart';
import 'package:provider/provider.dart' as provider; // Menggunakan alias untuk menghindari konflik nama
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  // Pastikan binding Flutter diinisialisasi sebelum operasi asinkron
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // Inisialisasi Notification Service
  final NotificationService ns = NotificationService();
  await ns.init();

  // Inisialisasi FCM Service
  final FcmService fcmService = FcmService();
  await fcmService.initialize();

  // Muat variabel lingkungan dari file .env
  await dotenv.load(fileName: ".env");

  // Jalankan aplikasi dengan ProviderScope untuk Riverpod
  // dan ChangeNotifierProvider untuk paket 'provider'
  runApp(
    ProviderScope(
      child: provider.ChangeNotifierProvider(
        create: (context) => ChatProviders(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Chat AI', // Judul aplikasi yang lebih relevan
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true, // Direkomendasikan untuk Material Design 3
      ),
      // home: LoginPage(),
      // home: Utama(),
      // home: Halmedia(),
      // home: MapSample(),
      // home: HalAnimasi(),
      // home: NotificationScreen(),
      // home: const ChatScreens(),
      home: PaymentPage(), // Menggunakan const karena widget tidak berubah // Sembunyikan banner "DEBUG"
    );
  }
}