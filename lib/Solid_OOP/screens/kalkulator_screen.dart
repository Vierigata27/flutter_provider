// lib/screens/kalkulator_screen.dart

import 'package:flutter/material.dart';
import 'package:latihan_provider/Solid_OOP/interface/operation_interface.dart';
import 'package:latihan_provider/Solid_OOP/service/kalkulator_service.dart';
import 'package:latihan_provider/Solid_OOP/service/operasi_factory.dart';

class KalkulatorScreen extends StatelessWidget {
  KalkulatorScreen({super.key});

  final ks = KalkulatorService(OperasiFactory.getAllOperasi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator'),
      ),
      body: KalkulatorWidget(
        ks: ks,
      ),
    );
  }
}

class KalkulatorWidget extends StatefulWidget {
  final KalkulatorService ks;
  const KalkulatorWidget({super.key, required this.ks});

  @override
  State<KalkulatorWidget> createState() => _KalkulatorWidgetState();
}

class _KalkulatorWidgetState extends State<KalkulatorWidget> {
  TextEditingController varAController = TextEditingController();
  TextEditingController varBController = TextEditingController();

  // --- PERBAIKAN UTAMA ADA DI SINI ---
  List<OperasiKalkulator> operasiList = []; // Hapus 'late' dan inisialisasi dengan list kosong
  OperasiKalkulator? selectedOperasi;
  String hasil = '';
  String errorMessage = '';

  @override
  void initState() {
    super.initState(); // Panggil super di awal (praktik terbaik)
    
    // Isi list operasi dari service
    operasiList = widget.ks.getKalkulatorOperasi();
    
    // Jika list tidak kosong, atur item pertama sebagai nilai default
    if (operasiList.isNotEmpty) {
      selectedOperasi = operasiList.first;
    }
  }
  // --- AKHIR DARI PERBAIKAN ---

  @override
  void dispose() {
    varAController.dispose();
    varBController.dispose();
    super.dispose();
  }

  void hitungHasil() {
    setState(() {
      errorMessage = '';
      hasil = '';

      if (varAController.text.isEmpty || varBController.text.isEmpty) {
        errorMessage = 'Mohon isi kedua bilangan';
        return;
      }

      if (selectedOperasi == null) {
        errorMessage = 'Mohon Operasi Dipilih';
        return;
      }

      try {
        final double a = double.parse(varAController.text);
        final double b = double.parse(varBController.text);

        final double hitung = widget.ks.hitung(a, b, selectedOperasi!);

        hasil = widget.ks.hasil(hitung);
      } catch (e) {
        errorMessage = 'Terjadi Kesalahan Saat Perhitungan $e';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Tambahkan ini agar tidak overflow saat keyboard muncul
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Agar card tidak memenuhi layar
            children: [
              TextField(
                controller: varAController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukan Angka Pertama',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<OperasiKalkulator>(
                decoration: InputDecoration(
                  labelText: 'Pilih Operasi',
                  border: OutlineInputBorder(),
                ),
                value: selectedOperasi,
                items: operasiList.map((v) {
                  return DropdownMenuItem<OperasiKalkulator>(
                      value: v,
                      child: Text(
                          '${v.deskripsiOperasi()} (${v.simbolOperasi()})'));
                }).toList(),
                onChanged: (v) {
                  setState(() {
                    selectedOperasi = v;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: varBController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukan Angka Kedua',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              FilledButton(onPressed: hitungHasil, child: Text('Hitung')),
              SizedBox(height: 20),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              if (hasil.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    hasil,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}