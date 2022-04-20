import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/usecases/generate_order.dart';
import 'package:queue/src/queue/domain/usecases/update_queue.dart';

import '../../queue/domain/usecases/get_all_queues.dart';
import '../events/checkin_event.dart';
import '../states/checkin_state.dart';

class CheckinBloc extends Bloc<CheckinEvent, CheckinState> {
  final IGetAllQueuesUseCase getAllQueuesUseCase;
  final IGenerateOrderUseCase generateOrderUseCase;
  final IUpdateQueueUseCase updateQueueUseCase;

  CheckinBloc({
    required this.getAllQueuesUseCase,
    required this.generateOrderUseCase,
    required this.updateQueueUseCase,
  }) : super(InitialCheckinState()) {
    on<FetchAllQueues>(_fetchAllQueues);
    on<GenerateOrder>(_generateOrder);
    on<PrintOrder>(_printOrder);
  }

  Future<void> _fetchAllQueues(
      FetchAllQueues event, Emitter<CheckinState> emit) async {
    await emit.onEach<List<QueueEntity>>(getAllQueuesUseCase.call(),
        onData: (queues) {
      emit(LoadedCheckinState(queues));
    });
  }

  void _generateOrder(GenerateOrder event, Emitter<CheckinState> emit) async {
    final queue = generateOrderUseCase.call(event.queue);
    final order = queue.orders.last;
    await updateQueueUseCase.call(queue);

    emit(GeneratedOrderCheckinState(order));
  }

  void _printOrder(PrintOrder event, Emitter<CheckinState> emit) {}
}
