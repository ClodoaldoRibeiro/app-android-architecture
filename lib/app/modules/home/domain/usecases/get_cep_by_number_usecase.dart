import 'package:poc_android/app/modules/home/data/repository/get_cep_by_number_repository.dart';
import 'package:poc_android/app/modules/home/domain/entitys/cep_entity.dart';
import 'package:poc_android/app/modules/home/domain/failures/cep_failure.dart';

abstract class GetCepByNumberUseCase {
  Future<CepEntity> call({
    required String cepNumber,
  });
}

class GetCepByNumberUsecaseImpl implements GetCepByNumberUseCase {
  final GetCepByNumberRepository _getCepByNumberRepository;

  const GetCepByNumberUsecaseImpl({
    required GetCepByNumberRepository getCepByNumberRepository,
  }) : _getCepByNumberRepository = getCepByNumberRepository;

  @override
  Future<CepEntity> call({
    required String cepNumber,
  }) {
    try {
      cepNumber = _cleanCepNumber(
        cepNumber: cepNumber.trim(),
      );

      _validateCepNumber(
        cepNumber: cepNumber,
      );

      return _getCepByNumberRepository.call(
        cepNumber: cepNumber,
      );
    } on CepFailure catch (cepFailure) {
      return Future.error(cepFailure.message);
    } catch (cepFailure) {
      return Future.error(
          'Falha ao tentar obter dados, por favor tente mais tarde.');
    }
  }

  void _validateCepNumber({
    required String cepNumber,
  }) {
    if (cepNumber.isEmpty) {
      throw CepFailure(
        message: 'Cep não informado',
      );
    }

    if (cepNumber.length != 8) {
      throw CepFailure(
        message: 'Cep com formato inválido',
      );
    }

    if (cepNumber == '00000000' ||
        cepNumber == '11111111' ||
        cepNumber == '22222222' ||
        cepNumber == '44444444' ||
        cepNumber == '55555555' ||
        cepNumber == '66666666' ||
        cepNumber == '77777777' ||
        cepNumber == '88888888' ||
        cepNumber == '99999999' ||
        cepNumber == '12345678') {
      throw CepFailure(message: 'Cep inválido');
    }
  }

  String _cleanCepNumber({
    required String cepNumber,
  }) {
    cepNumber = cepNumber.replaceAll('.', '');
    cepNumber = cepNumber.replaceAll('-', '');
    return cepNumber;
  }
}
