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

                    // Expanded membuat bagian nama aplikasi
                    // mengisi sisa ruang pada Row
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

                    // Icon digunakan untuk menampilkan icon keranjang
                    const Icon(
                      Icons.shopping_cart_outlined,
                      size: 27,
                      color: Colors.black87,
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
                            Icon(
                              Icons.edit,
                              color: Colors.indigo,
                              size: 30,
                            ),

                            SizedBox(height: 8),

                            Text(
                              'Alat Tulis',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
                            Icon(
                              Icons.menu_book,
                              color: Colors.indigo,
                              size: 30,
                            ),

                            SizedBox(height: 8),

                            Text(
                              'Buku',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
                            Icon(
                              Icons.checkroom,
                              color: Colors.indigo,
                              size: 30,
                            ),

                            SizedBox(height: 8),

                            Text(
                              'Fashion',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // =========================
                // PRODUK
                // =========================

                Row(
                  children: const [

                    Expanded(
                      child: Text(
                        'Produk Pilihan',
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

                // =========================
                // PRODUK 1
                // =========================

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Row(
                    children: [

                      // Container digunakan sebagai area icon produk
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: const Icon(
                          Icons.backpack,
                          color: Colors.indigo,
                          size: 34,
                        ),
                      ),

                      const SizedBox(width: 15),

                      // Expanded membuat informasi produk mengisi ruang
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [

                            Text(
                              'Tas Kuliah Minimalis',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Tas • Perlengkapan Kuliah',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),

                            SizedBox(height: 7),

                            Text(
                              'Rp85.000',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Icon untuk menuju detail produk
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                        color: Colors.indigo,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // =========================
                // PRODUK 2
                // =========================

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Row(
                    children: [

                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: const Icon(
                          Icons.note_alt,
                          color: Colors.indigo,
                          size: 34,
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [

                            Text(
                              'Notebook A5',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Alat Tulis • 100 halaman',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),

                            SizedBox(height: 7),

                            Text(
                              'Rp18.000',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                        color: Colors.indigo,
                      ),
                    ],
                  ),
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
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              'Diskon 20%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Untuk pembelian produk pilihan',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Icon promo
                      const Icon(
                        Icons.local_offer,
                        color: Colors.white,
                        size: 45,
                      ),
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