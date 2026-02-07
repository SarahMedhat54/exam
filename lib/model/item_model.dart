class ItemModel {
  final String name;

  final String image;

  final String title;

  final String rate;

  final double price;

  int quantity;
  bool isSelected;

  ItemModel({
    required this.title,
    required this.rate,
    required this.price,
    required this.image,
    required this.name,
    this.quantity = 0,
    this.isSelected = false ,
  });
}
