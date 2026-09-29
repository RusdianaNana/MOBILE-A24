import 'package:flutter/material.dart';

void main() {
  runApp(const CampusMartApp());
}

// MaterialApp digunakan sebagai wrapper utama aplikasi
class CampusMartApp extends StatelessWidget {
  const CampusMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ThemeData digunakan untuk mengatur tema umum aplikasi
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
      ),

      // home menentukan halaman pertama aplikasi
      home: const HomePage(),
    );
  }
}

// Halaman utama CampusMart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // SafeArea menjaga tampilan agar tidak tertutup area perangkat
      body: SafeArea(
        child: SingleChildScrollView(
          // SingleChildScrollView membuat halaman dapat di-scroll
          child: Padding(
            // Padding memberikan jarak antara isi dengan sisi layar
            padding: const EdgeInsets.all(20),

            // Column menyusun widget secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // =========================
                // HEADER
                // =========================

                // Row menyusun widget secara horizontal
                Row(
                  children: [

                    // Container digunakan untuk membuat kotak logo
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(14),
                      ),

                      // Icon digunakan untuk menampilkan icon toko
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),

                    // SizedBox memberikan jarak
                    const SizedBox(width: 12),

                    // Expanded membuat bagian nama aplikasi mengisi sisa ruang pada Row
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [

                          // Text digunakan untuk menampilkan nama aplikasi
                          Text(
                            'CampusMart',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            'Kebutuhan mahasiswa, lebih mudah',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // GestureDetector digunakan untuk mendeteksi sentuhan pada icon keranjang
                    GestureDetector(
                      // onTap dijalankan ketika widget ditekan
                      onTap: () {
                        // Navigator.push digunakan untuk membuka/menambahkan halaman baru (CartPage)
                        Navigator.push(
                          context,
                          // MaterialPageRoute mengatur transisi perpindahan halaman
                          MaterialPageRoute(builder: (context) => const CartPage()),
                        );
                      },
                      // Icon digunakan untuk menampilkan icon keranjang
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 27,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // =========================
                // SAPAAN
                // =========================

                // Text menampilkan sapaan pengguna
                const Text(
                  'Halo, Nana 👋',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Cari kebutuhan kuliahmu di sini',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 20),

                // =========================
                // SEARCH
                // =========================

                // Container digunakan untuk membungkus TextField
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(14),
                  ),

                  // TextField digunakan untuk input pencarian
                  child: TextField(
                    decoration: InputDecoration(
                      // hintText menampilkan teks petunjuk
                      hintText: 'Cari kebutuhan mahasiswa...',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                      ),

                      // suffixIcon menampilkan icon di ujung kanan
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.indigo,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 15,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // =========================
                // KATEGORI
                // =========================

                // Row digunakan untuk judul dan pilihan kategori
                Row(
                  children: const [

                    // Expanded membuat Text mengambil ruang yang tersedia
                    Expanded(
                      child: Text(
                        'Kategori',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Text(
                      'Lihat semua',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.indigo,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Row digunakan untuk menyusun kategori secara horizontal
                Row(
                  children: [

                    // Expanded digunakan agar kategori membagi ruang
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: const [
                            // Icon kategori alat tulis
                            Icon(Icons.edit, color: Colors.indigo, size: 30),
                            SizedBox(height: 8),
                            Text('Alat Tulis', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: const [
                            // Icon kategori buku
                            Icon(Icons.menu_book, color: Colors.indigo, size: 30),
                            SizedBox(height: 8),
                            Text('Buku', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: const [
                            // Icon kategori fashion
                            Icon(Icons.checkroom, color: Colors.indigo, size: 30),
                            SizedBox(height: 8),
                            Text('Fashion', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // =========================
                // PROMO
                // =========================

                const Text(
                  'Promo Mahasiswa',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                // Container digunakan sebagai card promo
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Row(
                    children: [

                      // Expanded membuat informasi promo mengisi ruang
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'KHUSUS MAHASISWA',
                              style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Diskon 20%',
                              style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      // Icon promo
                      const Icon(Icons.local_offer, color: Colors.white, size: 45),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =======================================================
// HALAMAN BARU: CART PAGE (Slicing Modul 3)
// =======================================================

// Halaman CartPage menggunakan widget lanjutan dari modul
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai kerangka dasar halaman CartPage
    return Scaffold(
      backgroundColor: Colors.white,

      // SafeArea memastikan konten tidak tertutup bar notifikasi perangkat
      body: SafeArea(

        // Stack digunakan untuk menumpuk list produk dan widget Bottom Bar pada area yang sama
        child: Stack(
          children: [

            // SingleChildScrollView membuat isi keranjang dapat di-scroll
            SingleChildScrollView(

              // Padding memberikan jarak sisi layar
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100), // Ruang ekstra agar list tidak tertutup bottom bar

                // Column menyusun widget header dan list produk secara vertikal
                child: Column(
                  children: [

                    // Container sebagai ruang untuk header Cart
                    Container(
                      padding: const EdgeInsets.all(20),

                      // Row menyusun tombol kembali dan teks judul secara horizontal
                      child: Row(
                        children: [

                          // GestureDetector mendeteksi sentuhan (tap) pada tombol kembali
                          GestureDetector(

                            // onTap menjalankan navigasi saat ditekan
                            onTap: () {
                              // Navigator.pop digunakan untuk kembali ke halaman sebelumnya (HomePage)
                              Navigator.pop(context);
                            },

                            // Icon panah untuk indikasi kembali
                            child: const Icon(Icons.arrow_back, color: Colors.black87),
                          ),

                          // SizedBox memberikan jarak antara tombol kembali dan judul
                          const SizedBox(width: 15),

                          // Text untuk judul halaman
                          const Text(
                            'Keranjang',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    // Memanggil fungsi pembuat layout produk
                    _buildCartItem(),
                    _buildCartItem(),
                    _buildCartItem(),
                    _buildCartItem(),
                    _buildCartItem(),
                  ],
                ),
              ),
            ),

            // Positioned digunakan untuk mengatur posisi Bottom Bar (Total & Tombol) agar selalu di bawah dalam Stack
            Positioned(
              left: 0,
              right: 0,
              bottom: 0, // Diposisikan menempel ke bawah layar

              // Container sebagai pembungkus area Total Belanja
              child: Container(
                padding: const EdgeInsets.all(20),

                // BoxDecoration mengatur warna latar dan bayangan
                decoration: BoxDecoration(
                  color: Colors.white,
                  
                  // BoxShadow memberikan efek bayangan (shadow) agar terlihat melayang di atas list
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),

                // Row menyusun teks Total dan tombol Checkout secara horizontal
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Column menyusun teks 'Total' dan nominal secara vertikal
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        // Text label total
                        Text('Total', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        
                        // Text nominal uang
                        Text(
                          'Rp12.000.000', 
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    // Container sebagai tombol "Masukkan Keranjang"
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.indigo, // Tema indigo
                        borderRadius: BorderRadius.circular(8),
                      ),
                      
                      // Row menyusun icon keranjang dan teks dalam tombol
                      child: Row(
                        children: const [
                          // Icon keranjang
                          Icon(Icons.shopping_cart, color: Colors.white, size: 16),
                          SizedBox(width: 8),
                          // Text label tombol
                          Text(
                            'Masukkan Keranjang',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi buatan sendiri untuk membuat widget List Item
  Widget _buildCartItem() {
    // Container untuk membungkus satu baris produk
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
      
      // BoxDecoration membuat garis tepi (border) untuk tiap produk
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      
      // Row menyusun gambar, deskripsi, dan kuantitas produk secara horizontal
      child: Row(
        children: [
          
          // Image.asset digunakan untuk menampilkan gambar yang bersumber dari folder lokal assets
          Image.asset(
            'assets/product.png',
            width: 70,
            height: 70,
            fit: BoxFit.cover, // fit: BoxFit.cover mengatur gambar menyesuaikan area yang tersedia
          ),
          
          const SizedBox(width: 15),
          
          // Expanded agar kolom deskripsi memenuhi ruang yang kosong
          Expanded(
            
            // Column menyusun nama produk dan harga vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                // Text nama produk
                Text('Nama Produk', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                SizedBox(height: 6),
                
                // Text harga produk
                Text(
                  'Rp12.000.000', 
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
              ],
            ),
          ),
          
          // Container membungkus indikator angka kuantitas
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5),
            ),
            
            // Text menampilkan jumlah produk
            child: const Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}