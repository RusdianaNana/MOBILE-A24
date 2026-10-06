import 'package:flutter/material.dart';

void main() {
  runApp(const CampusMartApp());
}

// ---------------------------------------------------------
// DATA MODEL (Merepresentasikan kerangka data produk)
// ---------------------------------------------------------
class Product {
  final String id;
  final String name;
  final int price;
  int stock;
  int quantityInCart;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.stock = 10,
    this.quantityInCart = 0,
  });
}

// MaterialApp sebagai pembungkus utama aplikasi
class CampusMartApp extends StatelessWidget {
  const CampusMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomePage(),
    );
  }
}

// =======================================================
// HALAMAN UTAMA (STATEFUL WIDGET)
// =======================================================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // State untuk menyimpan teks pencarian yang diketik user
  String searchQuery = '';

  // State Daftar Produk (Dummy Data)
  final List<Product> allProducts = [
    Product(id: '1', name: 'Tas Kuliah Minimalis', price: 85000),
    Product(id: '2', name: 'Notebook A5', price: 18000),
    Product(id: '3', name: 'Pulpen Gel Hitam (Pack)', price: 25000),
    Product(id: '4', name: 'Kemeja Flanel Mahasiswa', price: 120000),
  ];

  // KONSEP STATE: Fungsi untuk mengubah state jumlah barang di keranjang
  void _addToCart(Product product) {
    setState(() {
      product.quantityInCart++;
    });
    // Menampilkan pesan notifikasi pop-up (konsep UI interaktif)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} dimasukkan ke keranjang!'), 
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.indigo,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // KONSEP STATE: Turunan state untuk menyaring produk berdasarkan pencarian
    final visibleProducts = allProducts.where((product) {
      return product.stock > 0 && product.name.toLowerCase().contains(searchQuery);
    }).toList();

    // Menghitung jumlah item untuk ditampilkan di badge keranjang merah
    int cartItemCount = allProducts.where((p) => p.quantityInCart > 0).length;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // --- HEADER ---
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 50, height: 50,
                    decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(14)),
                    child: const Icon(Icons.shopping_bag, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('CampusMart', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                        Text('Kebutuhan mahasiswa', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                  // Stack digunakan untuk membuat badge notifikasi keranjang
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartPage(
                                // Mengirim data produk yang hanya ada di keranjang
                                cartItems: allProducts.where((p) => p.quantityInCart > 0).toList(),
                                // KONSEP STATE DI LUAR MODUL: Lifting State Up via Callback
                                // Menggunakan fungsi callback agar saat halaman keranjang ditutup, 
                                // HomePage otomatis memanggil setState untuk memperbarui badge angka keranjang.
                                onCartUpdated: () => setState(() {}),
                              ),
                            ),
                          );
                        },
                        child: const Icon(Icons.shopping_cart_outlined, size: 30, color: Colors.black87),
                      ),
                      // Tampilkan badge angka hanya jika ada barang di keranjang
                      if (cartItemCount > 0)
                        Positioned(
                          right: 0, top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                            child: Text(
                              '$cartItemCount',
                              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            
            // --- SEARCH BAR ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(14)),
                child: TextField(
                  // State pencarian diperbarui setiap kali ada ketikan
                  onChanged: (value) => setState(() => searchQuery = value.toLowerCase()),
                  decoration: const InputDecoration(
                    hintText: 'Cari kebutuhan mahasiswa...',
                    prefixIcon: Icon(Icons.search, color: Colors.indigo),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            
            // --- LIST PRODUK ---
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: visibleProducts.length,
                itemBuilder: (context, index) {
                  final product = visibleProducts[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        // Kotak abu-abu dummy
                        Container(
                          width: 60, height: 60,
                          decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              const SizedBox(height: 5),
                              Text('Rp${product.price}', style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                // Jika stok > 0, tombol menyala. Jika tidak, tombol mati (null).
                                onPressed: product.stock > 0 ? () => _addToCart(product) : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(double.infinity, 35),
                                ),
                                child: const Text('Masukkan Keranjang'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =======================================================
// HALAMAN KERANJANG (STATEFUL WIDGET)
// =======================================================
class CartPage extends StatefulWidget {
  final List<Product> cartItems;
  final VoidCallback onCartUpdated;

  const CartPage({super.key, required this.cartItems, required this.onCartUpdated});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // KONSEP STATE: Computed property (properti turunan) untuk menghitung Grand Total real-time
  int get currentGrandTotal {
    int total = 0;
    for (var item in widget.cartItems) {
      total += (item.price * item.quantityInCart);
    }
    return total;
  }

  void _onCheckout() {
    // Mengosongkan keranjang
    for (var item in widget.cartItems) {
      item.quantityInCart = 0;
    }
    widget.onCartUpdated();
    
    // Ganti layar saat ini dengan halaman sukses agar tidak bisa di-back ke keranjang kosong
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SuccessPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Memanggil fungsi pembaruan state di HomePage sebelum kembali
            widget.onCartUpdated();
            Navigator.pop(context);
          },
        ),
        title: const Text('Keranjang', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 100, top: 10),
            itemCount: widget.cartItems.length,
            itemBuilder: (context, index) {
              final product = widget.cartItems[index];
              return CartProductCard(
                product: product,
                // Callback ketika jumlah diubah lewat tombol + atau -
                onQuantityChanged: (newQuantity) {
                  setState(() {
                    product.quantityInCart = newQuantity;
                    if (newQuantity == 0) {
                      widget.cartItems.removeAt(index);
                    }
                  });
                },
              );
            },
          ),
          
          // BOTTOM BAR TOTAL & CHECKOUT
          Positioned(
            left: 0, right: 0, bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10, offset: const Offset(0, -3))],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text('Rp$currentGrandTotal', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  ElevatedButton(
                    // Tombol mati jika currentGrandTotal adalah 0
                    onPressed: currentGrandTotal > 0 ? _onCheckout : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: const Text('Checkout', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =======================================================
// WIDGET KARTU PRODUK (MENGELOLA STATE TEXTFIELD)
// =======================================================
class CartProductCard extends StatefulWidget {
  final Product product;
  final ValueChanged<int> onQuantityChanged;

  const CartProductCard({super.key, required this.product, required this.onQuantityChanged});

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  // Controller untuk menyimpan state input teks angka
  late TextEditingController quantityController;

  @override
  void initState() {
    super.initState();
    quantityController = TextEditingController(text: '${widget.product.quantityInCart}');
  }

  @override
  void didUpdateWidget(covariant CartProductCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.product.quantityInCart != widget.product.quantityInCart &&
        quantityController.text != '${widget.product.quantityInCart}') {
      quantityController.text = '${widget.product.quantityInCart}';
    }
  }

  void updateQuantity(String value) {
    final parsed = int.tryParse(value);
    if (parsed == null || parsed < 0) return;
    widget.onQuantityChanged(parsed.clamp(1, widget.product.stock));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 70, height: 70,
            decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.product.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text('Rp${widget.product.price}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.indigo)),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => widget.onQuantityChanged(widget.product.quantityInCart - 1),
                icon: const Icon(Icons.remove_circle_outline, color: Colors.indigo),
              ),
              SizedBox(
                width: 35,
                child: TextField(
                  controller: quantityController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  onSubmitted: updateQuantity,
                  decoration: const InputDecoration(contentPadding: EdgeInsets.zero, isDense: true, border: InputBorder.none),
                ),
              ),
              IconButton(
                onPressed: () => widget.onQuantityChanged(widget.product.quantityInCart + 1),
                icon: const Icon(Icons.add_circle_outline, color: Colors.indigo),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =======================================================
// HALAMAN SUKSES (STATELESS WIDGET)
// =======================================================
class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.black),
            const SizedBox(height: 20),
            const Text('Total Pembayaran', style: TextStyle(fontSize: 18, color: Colors.grey)),
            const SizedBox(height: 5),
            const Text('Sukses', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Kembali', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}