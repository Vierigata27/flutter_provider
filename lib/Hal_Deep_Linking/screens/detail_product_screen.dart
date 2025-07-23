import 'package:flutter/material.dart';
import 'package:latihan_provider/Hal_Deep_Linking/services/product_service.dart';

class DetailProductScreen extends StatelessWidget {
    final String id;
  const DetailProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final ProductService ps = ProductService();
    final produk = ps.getProductbyId(id);
    final namaProduk = produk?['nama'];
    final hargaProduk = produk?['harga'];
    final deskripsiProduk = produk?['deskripsi'];
    final kategoriProduk = produk?['category'];

    return Scaffold(
        appBar: AppBar(title: Text('Detail Produk'),
        centerTitle: true,
        ),
        body: Center(
          child: Column(
              children: [
                  Text('nama produk $namaProduk'),
                  Text('harga Produk $hargaProduk'),
                  Text('deskripsi Produk $deskripsiProduk'),
                  Text('kategori $kategoriProduk'),
              ],
          ),
        ),
    );
  }
}