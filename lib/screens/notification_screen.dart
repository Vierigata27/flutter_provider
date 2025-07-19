import 'package:flutter/material.dart';
import 'package:latihan_provider/service/notification_service.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationService ns = NotificationService();

  Future<void> _showNotification () async{
    await ns.showNotifivation(id: 1, title: 'Judul Notifikasi', desc: 'Testing Notifikasi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Notifikasi'),
        centerTitle: true,

      ),
      body: Center(
        child: Column(
          children: [
            FilledButton(onPressed: _showNotification, child: Text('Notifikasi Lokal'))
          ],
        ),
      ),
    );
  }
}