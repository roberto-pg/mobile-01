import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';

abstract class IAddNewQueueUseCase {
  Future<void> call(QueueEntity queue);
}

class AddNewQueueUseCase implements IAddNewQueueUseCase {
  final IQueueRepository repository;

  AddNewQueueUseCase({required this.repository});

  @override
  Future<void> call(QueueEntity queue) async {
    return await repository.addQueue(queue);
  }
}
