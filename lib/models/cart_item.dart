class CartItem {
  final String id;
  final String title;
  final String image;
  final double price;
  final int quantity;
  final bool isInStock;
  final String? size;

  CartItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.quantity = 1,
    this.isInStock = true,
    this.size,
  });

  // Optional: Factory constructor to create from Supabase or other DB
  factory CartItem.fromSupabase(Map<String, dynamic> data) {
    return CartItem(
      id: data['id'] as String,
      title: data['title'] as String,
      image: data['image'] as String,
      price: (data['price'] as double).toDouble(),
      quantity: data['quantity'] as int,
      isInStock: data['is_in_stock'] as bool,
      size: data['size'],
    );
  }
}
