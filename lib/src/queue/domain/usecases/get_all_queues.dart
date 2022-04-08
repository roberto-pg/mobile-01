import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';

abstract class IGetAllQueues {
  Stream<List<QueueEntity>> call();
}

class GetAllQueues implements IGetAllQueues {
  final IQueueRepository repository;

  GetAllQueues({required this.repository});

  @override
  Stream<List<QueueEntity>> call() {
    return repository.getAllQueues();
  }
}
