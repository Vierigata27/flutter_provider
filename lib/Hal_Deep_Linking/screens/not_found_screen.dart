import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Not Found'),
       ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Halaman Tidak Tersedia 404'
              ),
              SizedBox(height: 20,),
              FilledButton(onPressed: (){
                //Todo: goHome
                context.go('/');
              }, 
              child: Text('Back to Home'))
          ],
        ),
      ),
    );
  }
}