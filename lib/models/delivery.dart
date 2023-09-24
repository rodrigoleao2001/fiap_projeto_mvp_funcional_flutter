class Delivery {
  final String description;
  final String originAddress;
  final String destinationAddress;
  final String status;
  final int weight;

  Delivery({
    required this.description,
    required this.originAddress,
    required this.destinationAddress,
    required this.status,
    required this.weight,
  });

  // Converter o mapa em um objeto Delivery
  factory Delivery.fromMap(Map<String, dynamic> map) {
    return Delivery(
      description: map['description'] ?? '',
      originAddress: map['origin_address'] ?? '',
      destinationAddress: map['destination_address'] ?? '',
      status: map['status'] ?? '',
      weight: map['weight'] ?? 0,
    );
  }

  // Converter um mapa JSON em um objeto Delivery
  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      description: json['description'] ?? '',
      originAddress: json['origin_address'] ?? '',
      destinationAddress: json['destination_address'] ?? '',
      status: json['status'] ?? '',
      weight: json['weight'] ?? 0,
    );
  }

  // Converter o objeto Delivery em um mapa
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'origin_address': originAddress,
      'destination_address': destinationAddress,
      'status': status,
      'weight': weight,
    };
  }

  // Converter o objeto Delivery em um mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'origin_address': originAddress,
      'destination_address': destinationAddress,
      'status': status,
      'weight': weight,
    };
  }
}
