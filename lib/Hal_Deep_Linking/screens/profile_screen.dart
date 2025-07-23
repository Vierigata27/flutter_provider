import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Profile'),
       ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.brown,
              child: Icon(Icons.person, size: 60, color: Colors.white,),
            ),
            SizedBox(height: 20,),
            Text(
              'Halaman Profile'
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