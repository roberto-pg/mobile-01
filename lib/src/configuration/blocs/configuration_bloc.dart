import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:queue/src/configuration/events/configuration_event.dart';
import 'package:queue/src/configuration/states/configuration_state.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/usecases/add_new_queue.dart';
import 'package:queue/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue/src/queue/domain/usecases/remove_all_orders.dart';
import 'package:queue/src/queue/domain/usecases/remove_queue.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IGetAllQueuesUseCase getAllQueuesUseCase;
  final IAddNewQueueUseCase addNewQueueUseCase;
  final IRemoveQueueUseCase removeQueueUseCase;
  final IRemoveAllOrdersUseCase removeAllOrdersUseCase;

  ConfigurationBloc(
      {required this.getAllQueuesUseCase,
      required this.addNewQueueUseCase,
      required this.removeQueueUseCase,
      required this.removeAllOrdersUseCase})
      : super(InitialConfigurationState()) {
    on<FetchQueuesEvent>(_fetchQueuesEvent, transformer: restartable());
    on<AddNewQueueEvent>(_addNewQueuesEvent, transformer: sequential());
    on<RemoveQueueEvent>(_removeQueueEvent, transformer: sequential());
    on<RemoveAllOrdersEvent>(_removeAllOrdersEvent, transformer: droppable());
  }

  Future<void> _fetchQueuesEvent(event, Emitter emit) async {
    emit(LoadingConfigurationState());

    await emit.forEach<List<QueueEntity>>(
      getAllQueuesUseCase.call(),
      onData: (queues) => LoadedConfigurationState(queues),
      onError: (error, stackTrace) =>
          ExceptionConfigurationState(error.toString()),
    );
  }

  Future<void> _addNewQueuesEvent(AddNewQueueEvent event, emit) async {
    await addNewQueueUseCase.call(event.queue);
  }

  Future<void> _removeQueueEvent(RemoveQueueEvent event, emit) async {
    await removeQueueUseCase.call(event.queue);
  }

  FutureOr<void> _removeAllOrdersEvent(RemoveAllOrdersEvent event, emit) async {
    await removeAllOrdersUseCase.call();
  }
}
