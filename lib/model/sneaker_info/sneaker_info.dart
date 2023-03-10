import 'dart:ui';

class SneakerInfo {
  String name;
  String brand;
  double price;
  String image;
  Color? color;
  int sneakerNumber;
  SneakerInfo({
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    this.color,
    this.sneakerNumber = 0,
  });

  @override
  int get hashCode => image.hashCode;

  @override
  bool operator ==(dynamic other) {
    return image == other.image;
  }
}
