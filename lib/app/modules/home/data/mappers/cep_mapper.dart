import '../../domain/entitys/cep_entity.dart';

class CepMapper {
  CepEntity fromMap({
    required Map<String, dynamic> cepMap,
  }) {
    return CepEntity(
      cep: cepMap['cep'] ?? '',
      logradouro: cepMap['logradouro'] ?? '',
      complemento: cepMap['complemento'] ?? '',
      bairro: cepMap['bairro'] ?? '',
      localidade: cepMap['localidade'] ?? '',
      uf: cepMap['uf'] ?? '',
      ibge: cepMap['ibge'] ?? '',
      gia: cepMap['gia'] ?? '',
      ddd: cepMap['ddd'] ?? '',
      siafi: cepMap['siafi'] ?? '',
    );
  }
}
