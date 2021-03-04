class User {
  final int price;
  final String id, title, description;

  User({
    this.price,
    this.id,
    this.title,
    this.description,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      price: json['price'],
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
