import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:queue/src/configuration/events/configuration_event.dart';
import 'package:queue/src/configuration/states/configuration_state.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/usecases/add_new_queue.dart';
import 'package:queue/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue/src/queue/domain/usecases/remove_queue.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IGetAllQueuesUseCase getAllQueuesUsecase;
  final IAddNewQueueUseCase addNewQueueUsecase;
  final IRemoveQueueUseCase removeQueueUseCase;

  ConfigurationBloc(
      {required this.getAllQueuesUsecase,
      required this.addNewQueueUsecase,
      required this.removeQueueUseCase})
      : super(EmptyConfigurationState()) {
    on<FetchQueuesEvent>(_fetchQueues, transformer: restartable());
    on<AddNewQueueEvent>(_addNewQueues, transformer: sequential());
    on<RemoveQueueEvent>(_removeQueue, transformer: sequential());
  }

  Future<void> _fetchQueues(event, emit) async {
    emit(LoadingConfigurationState());

    await emit.forEach<List<QueueEntity>>(getAllQueuesUsecase.call(),
        onData: (queues) => LoadedConfigurationState(queues));
  }

  Future<void> _addNewQueues(AddNewQueueEvent event, emit) async {
    await addNewQueueUsecase.call(event.queue);
  }

  Future<void> _removeQueue(RemoveQueueEvent event, emit) async {
    await removeQueueUseCase.call(event.queue);
  }
}
