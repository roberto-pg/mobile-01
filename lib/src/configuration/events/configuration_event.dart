import 'package:queue/src/queue/domain/entities/queue_entity.dart';

abstract class ConfigurationEvent {}

class FetchQueuesEvent implements ConfigurationEvent {}

class AddNewQueueEvent implements ConfigurationEvent {
  final QueueEntity queue;

  AddNewQueueEvent({required this.queue});
}

class RemoveQueueEvent implements ConfigurationEvent {
  final QueueEntity queue;

  RemoveQueueEvent({required this.queue});
}
