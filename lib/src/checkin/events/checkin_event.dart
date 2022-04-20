import 'package:queue/src/queue/domain/entities/queue_entity.dart';

import '../../queue/domain/value_objects/order.dart';

abstract class CheckinEvent {}

class FetchAllQueues implements CheckinEvent {}

class GenerateOrder implements CheckinEvent {
  final QueueEntity queue;
  GenerateOrder(this.queue);
}

class PrintOrder implements CheckinEvent {
  final Order order;
  PrintOrder(this.order);
}
