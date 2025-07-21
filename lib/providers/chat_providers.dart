import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:latihan_provider/models/chat_message.dart';
import 'package:http/http.dart' as http;

class ChatProviders with ChangeNotifier {
  List<ChatMessage> _cm = [];
  bool _isLoading = false;

  List<ChatMessage> get cm => _cm;
  bool get isLoading => _isLoading;

  // Fungsi kirim pesan
  Future<void> sendMessage(String message) async {
    // Tambahkan pesan pengguna ke daftar
    _cm.add(
      ChatMessage(message: message, isUser: true, time: DateTime.now()),
    );
    notifyListeners(); // Beri tahu UI untuk memperbarui

    _isLoading = true;
    notifyListeners(); // Tampilkan indikator loading

    try {
      final response = await http.post(
        Uri.parse('https://api.groq.com/openai/v1/chat/completions'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${dotenv.env['API_KEY']}",
        },
        body: jsonEncode({
          "model": "llama-3.3-70b-versatile",
          "messages": [
            {
              "role": "user",
              "content": message,
            }
          ],
        }),
      );

      final data = jsonDecode(response.body);

      if (kDebugMode) { // Hanya cetak di mode debug
        print(data);
      }

      // **Perbaikan utama di sini:**
      // Periksa 'error' dari API
      if (data.containsKey('error')) {
        throw Exception(data['error']['message'] ?? 'Unknown API error');
      }

      // Pastikan 'choices' ada dan tidak kosong sebelum mengaksesnya
      if (data.containsKey('choices') && data['choices'] is List && data['choices'].isNotEmpty) {
        final List choices = data['choices'];
        // Pastikan item pertama di 'choices' adalah Map dan memiliki 'message'
        if (choices[0] is Map && choices[0].containsKey('message')) {
          final Map messageData = choices[0]['message'];
          // Pastikan 'message' memiliki 'content'
          if (messageData.containsKey('content') && messageData['content'] is String) {
            final String aiResponse = messageData['content'];

            _cm.add(
              ChatMessage(message: aiResponse, isUser: false, time: DateTime.now()),
            );
          } else {
            throw Exception('Content not found in AI response message.');
          }
        } else {
          throw Exception('Message not found in AI response choice.');
        }
      } else {
        throw Exception('Choices not found or empty in AI response.');
      }

    } catch (e) {
      if (kDebugMode) { // Hanya cetak di mode debug
        print('Error sending message: $e');
      }
      // Tambahkan pesan error yang lebih informatif ke UI
      _cm.add(
        ChatMessage(message: 'Terjadi kesalahan: ${e.toString()}. Coba lagi.', isUser: false, time: DateTime.now()),
      );
    } finally {
      // Pastikan _isLoading selalu direset, bahkan jika ada error
      _isLoading = false;
      notifyListeners(); // Perbarui UI setelah loading selesai
    }
  }
}