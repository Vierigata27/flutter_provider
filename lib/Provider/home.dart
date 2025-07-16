import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan_provider/Provider/provider.dart';
import 'package:provider/provider.dart' as provider;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final angkaRiverpod = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('latihan Provider'),
      ),

    body: Center(
      child: 
        Text(
          angkaRiverpod.toString(),
            style: TextStyle(
              fontSize: 100,
          ),
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
              // context.read<CounterModel>().increment();
              ref.read(counterProvider.notifier).state +=1;
            },
            child: Icon(
              Icons.add,
              ),
          ),
          const SizedBox(height: 10),
           FloatingActionButton(
            onPressed: (){
              //Todo: mengurangi angka
              // context.read<CounterModel>().decrement();
              ref.read(counterProvider.notifier).state -=1;
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