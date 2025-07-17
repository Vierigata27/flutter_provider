import 'package:flutter/material.dart';

class HalAnimasi2 extends StatefulWidget {
  const HalAnimasi2({super.key});

  @override
  State<HalAnimasi2> createState() => _HalAnimasi2State();
}

class _HalAnimasi2State extends State<HalAnimasi2> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this
      );

      _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceIn,
      ); 


      _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Animasi 2'),
        centerTitle: true,
      ),
      body: Center(
          child: 
          FadeTransition(
            opacity: _animation,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blueAccent,
              child: Text('Haii ini belajar animasi'),
            ),
            )
      ),
    );
  }
}