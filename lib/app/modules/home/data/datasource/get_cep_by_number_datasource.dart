import 'package:dio/dio.dart';

import '../../domain/entitys/cep_entity.dart';
import '../../domain/failures/cep_failure.dart';
import '../mappers/cep_mapper.dart';

abstract class GetCepByNumberDataSource {
  Future<CepEntity> call({
    required String cepNumber,
  });
}

class GetCepByNumberDataSourceImpl implements GetCepByNumberDataSource {
  final Dio _apiRequestService;
  final CepMapper _cepMapper;

  GetCepByNumberDataSourceImpl({
    required Dio apiRequestService,
    required CepMapper cepMapper,
  })  : _apiRequestService = apiRequestService,
        _cepMapper = cepMapper;

  @override
  Future<CepEntity> call({
    required String cepNumber,
  }) async {
    var response = await _apiRequestService
        .get('https://viacep.com.br/ws/$cepNumber/json/');

    if (response.statusCode == 200) {
      return _cepMapper.fromMap(
        cepMap: response.data,
      );
    }

    return throw CepFailure(
      message: 'Error ao tentar buscar cep,',
    );
  }
}
