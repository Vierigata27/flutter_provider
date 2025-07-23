import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Halaman Home'),
            SizedBox(height: 10,),
            FilledButton(onPressed: (){
              context.go('/produk');
            }, child: Text('Go to Product')),
            SizedBox(height: 10,),
            FilledButton(onPressed: (){
              context.go('/profile');
            }, child: Text('Go to profile')),
          ],
        ),
      )
    );
  }
}