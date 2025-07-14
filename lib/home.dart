import 'package:flutter/material.dart';
import 'package:latihan_provider/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('latihan Provider'),
      ),
    body: Center(
      child: Consumer(
        builder: (context, CounterModel v, child) {
          return Text(
            v.counter.toString(),
            style: TextStyle(
              fontSize: 100,
            ),
          );
        }
      ),
    ),

    floatingActionButton: 
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: (){
              //Todo: menambahkan angka
              context.read<CounterModel>().increment();
            },
            child: Icon(
              Icons.add,
              ),
          ),
          const SizedBox(height: 10),
           FloatingActionButton(
            onPressed: (){
              //Todo: mengurangi angka
              context.read<CounterModel>().decrement();
            },
            child: Icon(
              Icons.remove,
              ),
          )
        ],
      ),
    ),
    );
  }
}