import 'dart:math';

import 'package:latihan_provider/Solid_OOP/interface/operation_interface.dart';

class OperasiPerpangkatan implements OperasiKalkulator{
  @override
  double hitung (double a, double b ){
    return pow(a, b).toDouble();
  }

  @override
  String simbolOperasi () {
    return '^';
  }

  @override
  String deskripsiOperasi () {
    return 'Perpangkatan';
  }
}

