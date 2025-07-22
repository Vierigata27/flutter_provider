import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:latihan_provider/hal_transaksi/pay_widget_service.dart';
import 'package:midtrans_snap/models.dart';
import 'package:path/path.dart';

class PaymentStatusPage extends StatelessWidget {
  final MidtransResponse midtransResponse;
  final String snapToken;
  const PaymentStatusPage({super.key, required this.snapToken, required this.midtransResponse});


  Color getColor() {
    switch (midtransResponse.transactionStatus.toLowerCase()){
      case 'settlement' :
        return Colors.green;
        case 'pending' :
        return Colors.orange;
        case 'cancel' :
        return Colors.red;
        default :
        return Colors.grey;
    }
  }

  IconData getIcon() {
    switch (midtransResponse.transactionStatus.toLowerCase()){
      case 'settlement' :
        return Icons.check;
        case 'pending' :
        return Icons.watch_later;
        case 'cancel' :
        return Icons.close;
        default :
        return Icons.watch_later;
    }
  }

  void lanjutBayar (BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => 
    PayWidgetPage(
      snapToken: snapToken, 
      clientKey: dotenv.env['MIDTRANS_CLIENT_KEY']!,)
      )
      );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Status'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: getColor().withOpacity(.3),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                Text(
                  midtransResponse.transactionStatus.toUpperCase(),
                  style: TextStyle(fontSize: 24),
                ),
                Icon(getIcon(), color: getColor(), size: 48,)
              ],
            ),
          ),
          SizedBox(height: 10,),
          buildInfo('Order Id', midtransResponse.orderId),
          SizedBox(height: 10,),
          buildInfo('Total Pembayaran', 'Rp.' + midtransResponse.grossAmount.toString()),
          SizedBox(height: 10,),
          if(midtransResponse.transactionStatus.toLowerCase() != 'settlement' 
            && midtransResponse.transactionStatus.toLowerCase() != 'cancel') 
            FilledButton(onPressed: (){
              lanjutBayar(context);
          }, 
          child: Text('Lanjutkan Pembayaran')
          )

        ],
      ),
    );
  }

  Widget buildInfo (String label, String value){
    return Column(
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 5,),
        Text(value)
      ],
    );
  }
}