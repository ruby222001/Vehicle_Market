class Vehicle{
  final String brand;
  final double price;
  final int vdate;
  final WheelerType wheelerType;
  

  Vehicle({
    required this.price,
    required this.vdate, 
    required this.brand,
    required this.wheelerType,
  });
}

// Enum for WheelerType
enum WheelerType {
  twoWheeler,
  fourWheeler,
}