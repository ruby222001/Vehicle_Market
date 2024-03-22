class Vehicle{
  final String brand;
  final double price;
  final int vdate;
  final String condition;
  final String negotiable;
  final WheelerType wheelerType;
  

  Vehicle({
    required this.price,
    required this.vdate, 
    required this.brand,
    required this.condition,
    required this.wheelerType,
    required this.negotiable,
  });
}

// Enum for WheelerType
enum WheelerType {
  twoWheeler,
  fourWheeler,
}