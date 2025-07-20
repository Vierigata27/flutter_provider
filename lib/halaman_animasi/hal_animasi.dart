import 'package:flutter/material.dart';
import 'package:latihan_provider/halaman_animasi/hal_animasi2.dart';
// ignore: unused_import
import 'package:path/path.dart';

class HalAnimasi extends StatefulWidget {
  const HalAnimasi({super.key});

  @override
  State<HalAnimasi> createState() => _HalAnimasiState();
}

class _HalAnimasiState extends State<HalAnimasi> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animasi Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 3),
                height: _isExpanded ? 200 : 100,
                width: _isExpanded ? 200 : 50,
                color: _isExpanded ? Colors.blue : Colors.brown,
                curve: Curves.bounceIn,
                child: Text('Sentuh Aku'),
                ),

                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 300), 
                  duration: Duration(seconds: 3), 
                  builder: (Context, value, child){
                    print('value tween : $value');
                    return Container(
                      width: value,
                      height: value,
                      color: Colors.blue,
                      child: Text(
                        'Tween'
                        )
                    );
                  },
                  ),
                  FilledButton(
                    onPressed: (){  
                      Navigator.of(context).push(_createRoute());

                    }, 
                    child: Text('Go Halaman Animasi 2'))

            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HalAnimasi2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween<Offset>(
        begin: const Offset(1.0, 0.0), // Perbaiki 'Offside' jadi 'Offset' dan tambahkan 'const'
        end: Offset.zero,
      );

      return SlideTransition(
        position: animation.drive(tween), // Atau animation.drive(tween.chain(CurveTween(curve: Curves.easeOut))), jika ingin kurva
        child: child,
      );
    },
  );
}