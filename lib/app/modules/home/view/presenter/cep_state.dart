import 'package:equatable/equatable.dart';
import 'package:poc_android/app/modules/home/domain/entitys/cep_entity.dart';

abstract class CepState extends Equatable {
  InitialCepState initialCepState() {
    return InitialCepState();
  }

  LoadingCepState loadingCepState() {
    return LoadingCepState();
  }

  SucceedCepState succeedCepState({
    required CepEntity cepEntity,
  }) {
    return SucceedCepState(
      cepEntity: cepEntity,
    );
  }

  ErrorCepState errorCepState({
    required String messege,
  }) {
    return ErrorCepState(messege: messege);
  }

  @override
  List<Object?> get props {
    return [];
  }
}

class InitialCepState extends CepState {}

class LoadingCepState extends CepState {}

class SucceedCepState extends CepState {
  final CepEntity cepEntity;

  SucceedCepState({
    required this.cepEntity,
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      cepEntity,
    ];
  }
}

class ErrorCepState extends CepState {
  final String messege;

  ErrorCepState({
    required this.messege,
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      messege,
    ];
  }
}
