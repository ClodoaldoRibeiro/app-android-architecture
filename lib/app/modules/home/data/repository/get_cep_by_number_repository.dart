import '../../domain/entitys/cep_entity.dart';
import '../datasource/get_cep_by_number_datasource.dart';

abstract class GetCepByNumberRepository {
  Future<CepEntity> call({
    required String cepNumber,
  });
}

class GetCepByNumberRepositoryImpl implements GetCepByNumberRepository {
  final GetCepByNumberDataSource _getCepByNumberDataSource;

  const GetCepByNumberRepositoryImpl({
    required GetCepByNumberDataSource getCepByNumberDataSource,
  }) : _getCepByNumberDataSource = getCepByNumberDataSource;

  @override
  Future<CepEntity> call({
    required String cepNumber,
  }) {
    try {
      return _getCepByNumberDataSource.call(
        cepNumber: cepNumber,
      );
    } catch (e) {
      return Future.error(
        e.toString(),
      );
    }
  }
}
