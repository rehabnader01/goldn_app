class MetalModel {
  final String name;
  final double price;
  final String symbol;
  final String updatedAt;

  MetalModel({
    required this.name,
    required this.price,
    required this.symbol,
    required this.updatedAt,
  });

  factory MetalModel.fromJson(Map<String, dynamic> json) {
    final rate = json['rate'] as Map<String, dynamic>;
    
    return MetalModel(
      name: (json['metal'] as String).toUpperCase(),
      price: (rate['price'] as num).toDouble(),
      symbol: json['currency'] as String,
      updatedAt: json['timestamp'] as String,
    );
  }

  String get formattedPrice => price.toStringAsFixed(2);
  
  String get updatedAtReadable {
    try {
      final dateTime = DateTime.parse(updatedAt);
      return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return updatedAt;
    }
  }
}