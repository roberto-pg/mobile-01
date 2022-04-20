import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/value_objects/order.dart';

abstract class CheckinState {}

class InitialCheckinState implements CheckinState {}

class LoadingCheckinState implements CheckinState {}

class LoadedCheckinState implements CheckinState {
  final List<QueueEntity> queues;
  LoadedCheckinState(this.queues);
}

class GeneratedOrderCheckinState implements CheckinState {
  final Order order;

  GeneratedOrderCheckinState(this.order);
}

class ExceptionCheckinState implements CheckinState {
  final String message;
  ExceptionCheckinState(this.message);
}
