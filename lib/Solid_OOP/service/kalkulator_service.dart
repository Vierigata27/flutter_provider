import 'package:latihan_provider/Solid_OOP/interface/operation_interface.dart';

class KalkulatorService {
  final List<OperasiKalkulator> _operasiList;

  KalkulatorService(this._operasiList);

  List <OperasiKalkulator> getKalkulatorOperasi(){
    return _operasiList;
  }

  double hitung(double a, double b, OperasiKalkulator c){
    return c.hitung(a, b);
  }

  String hasil (double h){
    return h.toString();
  }
}