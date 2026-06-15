const String keyId = 'id';
const String keyName = 'pizzaName';
const String keyDesc = 'description';
const String keyPrice = 'price';
const String keyImage = 'imageUrl';

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  Pizza.fromJson(Map<String, dynamic> json)
      : id = int.tryParse(json[keyId]?.toString() ?? '') ?? 0,
        pizzaName = json[keyName]?.toString() ?? '',
        description = json[keyDesc]?.toString() ?? '',
        price = double.tryParse(json[keyPrice]?.toString() ?? '') ?? 0.0,
        imageUrl = json[keyImage]?.toString() ?? '';

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDesc: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}
