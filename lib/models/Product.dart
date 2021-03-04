class Product {
  final int price;
  final String id, title, description;

  Product({
    this.price,
    this.id,
    this.title,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      price: json['price'],
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Product product = Product(
    id: '1',
    price: 350,
    title: 'Chair',
    description:
        'This aramchair is an elegant and fucnctional piece of forniture',
  );
}
