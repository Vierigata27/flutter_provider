import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:latihan_provider/hal_transaksi/pay_widget_service.dart';
import 'package:latihan_provider/models/transaction.dart';
import 'package:latihan_provider/service/midtrans_service.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final MidtransService ms = MidtransService();
  bool isLoading = false;

  Map product = {
    'nama' : 'Buku',
    'harga' : '5000',
    'desc' : 'buku polos'
  };

  Future<void> pay() async{
    setState(() {
      isLoading = true;
    });

    try{
      final trx = Transaction(
      orderId: '123',
       amount: product['harga'], 
       itemName: product['nama']
       );

       final token = await ms.createTransaction(trx);

       if (token != null){
        print('token = $token');
        Navigator.push(context, 
         MaterialPageRoute(builder: (context) => 
         PayWidgetPage(snapToken: token, clientKey: dotenv.env['MIDTRANS_CLIENT_KEY']!))
        );
       }

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error $e'))
      );
      print(e.toString());
    }finally{
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Page'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Icon(Icons.book, size: 100,),
                  ListTile(
                    title: Text(product['nama']),
                    subtitle: Text(product['desc']),
                    trailing: Text('Rp.' + product['harga']),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            if(isLoading) CircularProgressIndicator(),
            FilledButton(onPressed: pay, child: Text('Bayar'))
          ],
        ),
      ),
    );
  }
}