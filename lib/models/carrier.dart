class Carrier {
  String? id;
  String nome = '';
  String placaVeiculo = '';
  final String idCliente;

  // Construtor padrão
  Carrier({
    this.id,
    required this.nome,
    required this.placaVeiculo,
    required this.idCliente,
  });

  // Construtor para deserialização de um objeto JSON
  factory Carrier.fromJson(Map<String, dynamic> json) {
    return Carrier(
      id: json['id'] as String?,
      nome: json['nome'] as String,
      placaVeiculo: json['placa_veiculo'] as String,
      idCliente: json['id_cliente'] as String,
    );
  }

  // Método para serialização para formato JSON
  Map<String, dynamic> toJson() {
    return {

      'nome': nome,
      'placa_veiculo': placaVeiculo,
      'id_cliente': idCliente,
    };
  }
}
