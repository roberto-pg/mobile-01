import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';

abstract class IRemoveQueueUseCase {
  Future<void> call(QueueEntity queueEntity);
}

class RemoveQueueUseCase implements IRemoveQueueUseCase {
  final IQueueRepository repository;

  RemoveQueueUseCase({required this.repository});

  @override
  Future<void> call(QueueEntity queueEntity) async {
    await repository.removeQueue(queueEntity.id);
  }
}
