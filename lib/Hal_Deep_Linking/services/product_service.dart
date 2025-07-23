import 'package:latihan_provider/Hal_Deep_Linking/data/product_data.dart';

class ProductService {

  // GET Data product by ID
  Map<String, dynamic>? getProductbyId(String id){
    try{
      return daftarProduk.firstWhere((product) => product['id'] == id);
    }catch(e){
      return null;
    }
  }

  //Get Data by Search
  List<Map<String, dynamic>> getProductBySearch ({
    String? keyword,
    String? category,
    String? sortBy,
  }){
    List<Map<String, dynamic>> hasilPencarian = List.from(daftarProduk);

    //filter keyword
    if(keyword != null && keyword.isNotEmpty){
      hasilPencarian = hasilPencarian.where(
        (produk)=> 
          produk['nama'].toString().toLowerCase().contains(keyword.toLowerCase())
        ).toList();
    }

    //category
    if(category != null && category.isNotEmpty){
      hasilPencarian = hasilPencarian.where(
        (produk)=> 
          produk['category'] == category
        ).toList();
    }

    //sorting
    if(sortBy != null){
      if(sortBy == 'Harga Terendah'){
        hasilPencarian.sort((a,b){
          final hargaA = a['harga'].toString().replaceAll(
            RegExp(r'[^0-9]'), '');
          final hargaB = b['harga'].toString().replaceAll(
            RegExp(r'[^0-9]'), '');
          
          return int.parse(hargaA).compareTo(int.parse(hargaB));
        });
      }
      else if(sortBy == 'Harga Tertinggi'){
        hasilPencarian.sort((a,b){
          final hargaA = a['harga'].toString().replaceAll(
            RegExp(r'[^0-9]'), '');
          final hargaB = b['harga'].toString().replaceAll(
            RegExp(r'[^0-9]'), '');
          
          return int.parse(hargaB).compareTo(int.parse(hargaA));
        });
      }
    }

    return hasilPencarian;
  }
}