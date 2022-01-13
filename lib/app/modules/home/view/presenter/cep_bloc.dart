import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_android/app/modules/home/domain/usecases/get_cep_by_number_usecase.dart';

import 'cep_event.dart';
import 'cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  final GetCepByNumberUseCase _getCepByNumberUseCase;

  CepBloc({
    required GetCepByNumberUseCase getCepByNumberUseCase,
  })  : _getCepByNumberUseCase = getCepByNumberUseCase,
        super(InitialCepState()) {
    on<GetCepEvent>(_getCepEvent);
  }

  Future<void> _getCepEvent(
    GetCepEvent event,
    Emitter<CepState> emit,
  ) async {
    emit(state.loadingCepState());
    try {
      final _cepEncontrado = await _getCepByNumberUseCase.call(
        cepNumber: event.cep,
      );

      emit(state.succeedCepState(
        cepEntity: _cepEncontrado,
      ));
    } catch (error) {
      emit(state.errorCepState(
        messege: error.toString(),
      ));
    }
  }
}
