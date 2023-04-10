import 'menu.dart';

class CartItem {
  final int totalAmount;
  final String notes;
  final Menu menuItem;

  CartItem(
      {required this.totalAmount, required this.notes, required this.menuItem});
}

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
  }

  void removeItem(CartItem item) {
    _items.remove(item);
  }

  int get totalAmount {
    int sum = 0;
    for (var item in _items) {
      sum += item.totalAmount;
    }
    return sum;
  }

  void clear() {
    _items.clear();
  }
}
