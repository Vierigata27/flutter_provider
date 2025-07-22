import 'package:flutter/material.dart';
import 'package:latihan_provider/hal_transaksi/pay_status_page.dart';
import 'package:midtrans_snap/midtrans_snap.dart';
import 'package:midtrans_snap/models.dart';

class PayWidgetPage extends StatelessWidget {
  final String snapToken;
  final String clientKey;

  const PayWidgetPage({super.key, required this.snapToken, required this.clientKey});

  @override
  Widget build(BuildContext context) {
    // --- TAMBAHKAN INI UNTUK DEBUGGING ---
    print('PayWidgetPage received snapToken: $snapToken');
    print('PayWidgetPage received clientKey: $clientKey');
    // --- AKHIR DEBUGGING ---

    return Scaffold(
      appBar: AppBar(title: Text('pay'),
      ),
    body: MidtransSnap(
      mode: MidtransEnvironment.sandbox,
      token: snapToken,
      midtransClientKey: clientKey,
      onResponse: (result) {
        print('hasil pembayaran = ${result.toJson()}');

        Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>
        PaymentStatusPage(snapToken: snapToken, midtransResponse: result))
        );
      },
      // Tambahkan onPageFinished dan onWebResourceError untuk debugging lebih lanjut
      onPageFinished: (url) {
        print('MidtransSnap WebView finished loading: $url');
      },
      onWebResourceError: (error) {
        print('MidtransSnap WebView error: ${error.description}');
        print('MidtransSnap WebView error code: ${error.errorCode}');
      },
      ),
    );
  }
}