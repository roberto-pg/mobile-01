import 'package:queue/src/checkin/events/checkin_event.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/value_objects/order.dart';

abstract class IGenerateOrderUseCase {
  QueueEntity call(QueueEntity queueEntity);
}

class GenerateOrderUseCase implements IGenerateOrderUseCase {
  @override
  QueueEntity call(QueueEntity queueEntity) {
    final orders = List<Order>.from(queueEntity.orders);

    final totalOrders = orders.length;
    final order = Order(
      id: _generateId(totalOrders + 1),
      position: totalOrders + 1,
      timestamp: DateTime.now(),
      status: OrderStatus.waiting,
    );

    orders.add(order);

    return QueueEntity(
      id: queueEntity.id,
      title: queueEntity.title,
      abbreviation: queueEntity.abbreviation,
      priority: queueEntity.priority,
      orders: orders,
    );
  }

  String _generateId(int id) {
    return id.toString().padLeft(4, '0');
  }
}
