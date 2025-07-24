import 'package:latihan_provider/Solid_OOP/interface/operation_interface.dart';
import 'package:latihan_provider/Solid_OOP/operations/operasi_dasar.dart';
import 'package:latihan_provider/Solid_OOP/operations/operasi_lanjutan.dart';

class OperasiFactory {
  static final Map<String, OperasiKalkulator> operasiRegistry = {
    'tambah' : OperasiPenjumlahan(),
    'kurang' : OperasiPengurangan(),
    'kali' : OperasiPerkalian(),
    'bagi' : OperasiPembagian(),
    'pangkat' : OperasiPerpangkatan(),
  };

  static List<OperasiKalkulator>getAllOperasi (){
   return operasiRegistry.values.toList(); 
  }
}