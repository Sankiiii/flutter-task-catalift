class CartService {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<String> _cartItems = [];

  List<String> get cartItems => List.unmodifiable(_cartItems);

  bool addToCart(String courseTitle) {
    if (!_cartItems.contains(courseTitle)) {
      _cartItems.add(courseTitle);
      return true; // Successfully added
    }
    return false; // Already exists
  }

  bool removeFromCart(String courseTitle) {
    return _cartItems.remove(courseTitle);
  }

  bool isInCart(String courseTitle) {
    return _cartItems.contains(courseTitle);
  }

  int get itemCount => _cartItems.length;

  void clearCart() {
    _cartItems.clear();
  }
}
