import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:latihan_provider/models/transaction.dart';
import 'package:http/http.dart' as http;

class MidtransService {
  final String serverKey = dotenv.env['MIDTRANS_SERVER_KEY']!;
  final String clientKey = dotenv.env['MIDTRANS_CLIENT_KEY']!;
  final String baseUrl = 'https://app.sandbox.midtrans.com/snap/v1';

  Future<String> createTransaction (Transaction tr)async{
    final auth = 'Basic ${base64Encode(utf8.encode(serverKey+':'))}';

    final response = await http.post(
      Uri.parse('$baseUrl/transactions'),
      headers: <String, String> {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : auth,
      },
      body: jsonEncode({
        'transaction_details' : {
          'order_id' : tr.orderId + DateTime.now().millisecondsSinceEpoch.toString(),
          'gross_amount' : tr.amount,
        },
        'item_details' : [
          {
            'id' : tr.orderId,
            'price' : tr.amount,
            'quantity' : 1,
            'name' : tr.itemName,
          }
        ]
      })
    );

    print('hasil response midtrans ${response.body}');

    if(response.statusCode == 201){
      final resJson = jsonDecode(response.body);
      return resJson['token'];
    }else{
      throw Exception('Gagal pembayaran');
    }
  }

}