import 'package:latihan_provider/Solid_OOP/interface/operation_interface.dart';

class OperasiPenjumlahan implements OperasiKalkulator{
  @override
  double hitung (double a, double b ){
    return a + b;
  }

  @override
  String simbolOperasi () {
    return '+';
  }

  @override
  String deskripsiOperasi () {
    return 'Penjumlahan';
  }
}

class OperasiPengurangan implements OperasiKalkulator{
  @override
  double hitung (double a, double b ){
    return a - b;
  }

  @override
  String simbolOperasi () {
    return '-';
  }

  @override
  String deskripsiOperasi () {
    return 'Pengurangan';
  }
}

class OperasiPerkalian implements OperasiKalkulator{
  @override
  double hitung (double a, double b ){
    return a * b;
  }

  @override
  String simbolOperasi () {
    return '*';
  }

  @override
  String deskripsiOperasi () {
    return 'Perkalian';
  }
}

class OperasiPembagian implements OperasiKalkulator{
  @override
  double hitung (double a, double b ){
    return a / b;
  }

  @override
  String simbolOperasi () {
    return '/';
  }

  @override
  String deskripsiOperasi () {
    return 'Pembagian';
  }
}