import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/chat_providers.dart';
import 'package:provider/provider.dart';

class ChatScreens extends StatefulWidget {
  const ChatScreens({super.key});

  @override
  State<ChatScreens> createState() => _ChatScreensState();
}

class _ChatScreensState extends State<ChatScreens> {
  TextEditingController pesanController = TextEditingController();

  // Bersihkan controller saat widget dibuang
  @override
  void dispose() {
    pesanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat AI'), // Judul lebih relevan
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Tambahkan warna app bar
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatProviders>(
              builder: (context, value, child) {
                return ListView.builder(
                  reverse: true, // Untuk menampilkan pesan terbaru di bawah
                  itemCount: value.cm.length,
                  itemBuilder: (context, index) {
                    final chat = value.cm[value.cm.length - 1 - index]; // Cara yang lebih bersih untuk mengakses item terbaru
                    return BubbleSpecialThree(
                      text: chat.message,
                      color: chat.isUser ? Theme.of(context).colorScheme.primary : Colors.grey[300]!, // Gunakan tema warna
                      tail: true,
                      isSender: chat.isUser,
                      textStyle: TextStyle(color: chat.isUser ? Colors.white : Colors.black),
                    );
                  },
                );
              },
            ),
          ),
          Consumer<ChatProviders>(
            builder: (context, value, child) {
              return value.isLoading == true
                  ? const LinearProgressIndicator() // Gunakan const jika tidak ada perubahan
                  : const SizedBox(); // Gunakan const jika tidak ada perubahan
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0, left: 15.0, right: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: pesanController,
                    decoration: const InputDecoration( // Gunakan const jika tidak ada perubahan
                      hintText: 'Input pesan Anda di sini',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      // Pastikan pesan tidak kosong sebelum mengirim
                      if (value.trim().isNotEmpty) {
                        context.read<ChatProviders>().sendMessage(value.trim());
                        pesanController.clear();
                      }
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Pastikan pesan tidak kosong sebelum mengirim
                    if (pesanController.text.trim().isNotEmpty) {
                      context.read<ChatProviders>().sendMessage(pesanController.text.trim());
                      pesanController.clear();
                    }
                  },
                  icon: const Icon(Icons.send), // Gunakan const jika tidak ada perubahan
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}