import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:latihan_provider/Hal_Deep_Linking/data/product_data.dart';
import 'package:latihan_provider/Hal_Deep_Linking/services/product_service.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, this.keyword, this.category, this.sortBy});

  final String? keyword;
  final String? category;
  final String? sortBy;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController searchController = TextEditingController();

  String? selectedCategory;
  String? selectedSortBy;

  late List<String> categories;
  final List<String> sortOption = ['Harga terendah', 'Harga Tertinggi'];

  late List<Map<String, dynamic>> daftarProdukHasil;

  final ProductService ps = ProductService();

  @override
  void initState() {
    super.initState(); // Panggil super.initState() terlebih dahulu

    categories = ['semua'];
    categories.addAll(
      daftarProduk.map((produk) => produk['category'] as String).toSet().toList(),
    );

    searchController = TextEditingController(text: widget.keyword ?? '');
    // Perbaikan: Hapus spasi ekstra dari 'semua'
    selectedCategory = widget.category ?? 'semua';
    selectedSortBy = widget.sortBy ?? 'Harga Tertinggi';

    // Inisialisasi daftarProdukHasil di sini
    updateProductList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void updateProductList() {
    daftarProdukHasil = ps.getProductBySearch(
      keyword: searchController.text,
      category: selectedCategory != 'semua' ? selectedCategory : null,
      sortBy: selectedSortBy,
    );
  }

  void submitSearch() {
    setState(() {
      updateProductList();
    });
    final Map<String, String> queryParams = {};

    if (searchController.text.isNotEmpty) {
      queryParams['keyword'] = searchController.text;
    }

    if (selectedCategory != null && selectedCategory != 'semua') {
      queryParams['category'] = selectedCategory!;
    }

    if (selectedSortBy != null) {
      queryParams['sortBy'] = selectedSortBy!;
    }

    context.go(Uri(path: '/produk', queryParameters: queryParams).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk'),
      ),
      body: Column(
        children: [
          Padding( // Menambahkan Padding untuk UI yang lebih baik
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Cari Produk',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onSubmitted: (value) => submitSearch(),
            ),
          ),
          const SizedBox(height: 20),
          Padding( // Menambahkan Padding untuk UI yang lebih baik
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                // kategori
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Kategori',
                      border: OutlineInputBorder(),
                    ),
                    items: categories.map((c) {
                      return DropdownMenuItem<String>(
                        value: c,
                        child: Text(c),
                      );
                    }).toList(),
                    value: selectedCategory,
                    onChanged: (v) {
                      setState(() {
                        selectedCategory = v;
                        submitSearch();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10), // Tambahkan sedikit spasi antar dropdown
                // urutkan
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Urut Berdasarkan',
                      border: OutlineInputBorder(),
                    ),
                    items: sortOption.map((c) {
                      return DropdownMenuItem<String>(
                        value: c,
                        child: Text(c),
                      );
                    }).toList(),
                    value: selectedSortBy,
                    onChanged: (v) {
                      setState(() {
                        selectedSortBy = v;
                        submitSearch();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: daftarProdukHasil.isEmpty
                ? const Center(child: Text('Produk Kosong'))
                : ListView.builder(
                    itemCount: daftarProdukHasil.length,
                    itemBuilder: (context, index) {
                      final p = daftarProdukHasil[index]; // Perbaikan: Ganti 'daftarProduukHasil' menjadi 'daftarProdukHasil'
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Menambahkan margin
                        child: ListTile(
                          title: Text(p['nama']),
                          subtitle: Text('Rp ${p['harga']}'), // Format harga
                          onTap: () {
                            // TODO: Implement navigasi detail produk
                            context.go('/produk/${p['id']}');
                          },
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}