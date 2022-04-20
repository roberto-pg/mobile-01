import '../repositories/queue_repository.dart';

abstract class IRemoveAllOrdersUseCase {
  Future<void> call();
}

class RemoveAllOrdersUseCase implements IRemoveAllOrdersUseCase {
  final IQueueRepository repository;

  RemoveAllOrdersUseCase({required this.repository});

  @override
  Future<void> call() async {
    await repository.removeAllOrders();
  }
}
