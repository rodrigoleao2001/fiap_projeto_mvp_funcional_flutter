class DeliveryRequest {
  String? id;
  String originAddress;
  String destinationAddress;
  int weight;
  String description;
  String status;

  DeliveryRequest({
    this.id,
    required this.originAddress,
    required this.destinationAddress,
    required this.weight,
    required this.description,
    this.status = 'Buscando motorista para a entrega',
  });

  factory DeliveryRequest.fromJson(Map<String, dynamic> json) {
    return DeliveryRequest(
      id: json['id'] as String?,
      originAddress: json['originAddress'] as String,
      destinationAddress: json['destinationAddress'] as String,
      weight: json['weight'] as int,
      description: json['description'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originAddress': originAddress,
      'destinationAddress': destinationAddress,
      'weight': weight,
      'description': description,
      'status': status,
    };
  }
}
