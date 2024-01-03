class Products {
  final int id;
  final String title;
  final String description;
  final int price;
  final String thumbnail;

  const Products(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.thumbnail});

  @override
  String toString() {
    return 'Products{id: $id, title: $title, description: $description, price: $price, thumbnail: $thumbnail}';
  }
}
