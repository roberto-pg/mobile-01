import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue/src/configuration/events/conf_event.dart';
import 'package:queue/src/configuration/states/conf_state.dart';
import 'package:queue/src/queue/domain/usecases/get_all_queues.dart';

class ConfBloc extends Bloc<ConfEvent, ConfState> {
  final IGetAllQueues getAllQueuesUsecase;
  late final StreamSubscription _sub;

  ConfBloc(this.getAllQueuesUsecase) : super(EmptyConfState()) {
    _sub = getAllQueuesUsecase.call().listen((data) {
      add(AddQueues(data));
    });

    on<AddQueues>((event, emit) => emit(LoadedConfState(event.queues)));
  }

  @override
  Future<void> close() async {
    await _sub.cancel();
    await super.close();
  }
}
