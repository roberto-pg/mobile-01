import '../entities/queue_entity.dart';
import '../repositories/queue_repository.dart';

abstract class IUpdateQueueUseCase {
  Future<void> call(QueueEntity queueEntity);
}

class UpdateQueueUseCase implements IUpdateQueueUseCase {
  final IQueueRepository repository;

  UpdateQueueUseCase({required this.repository});

  @override
  Future<void> call(QueueEntity queueEntity) async {
    await repository.updateQueue(queueEntity);
  }
}
