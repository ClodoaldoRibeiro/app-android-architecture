import 'package:equatable/equatable.dart';

abstract class CepEvent extends Equatable {
  @override
  List<Object?> get props {
    return [];
  }
}

class GetCepEvent extends CepEvent {
  final String cep;

  GetCepEvent({
    required this.cep,
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      cep,
    ];
  }
}
