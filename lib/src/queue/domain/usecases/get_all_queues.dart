import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';

abstract class IGetAllQueuesUseCase {
  Stream<List<QueueEntity>> call();
}

class GetAllQueuesUseCase implements IGetAllQueuesUseCase {
  final IQueueRepository repository;

  GetAllQueuesUseCase({required this.repository});

  @override
  Stream<List<QueueEntity>> call() {
    return repository.getAllQueues();
  }
}
