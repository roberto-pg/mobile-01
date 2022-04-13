import 'package:flutter_test/flutter_test.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/value_objects/order.dart';
import 'package:queue/src/queue/infra/adapters/json_to_queue.dart';

void main() {
  test('deve converter um map em um objeto do tipo QueueEntity', () {
    final queue = JsonToQueue.fromMap({
      'id': 'jdldflfdl',
      'title': 'title',
      'priority': 1,
      'abbreviation': 'sd',
      'orders': [
        {
          'id': 'jdldflfdl',
          'position': 1,
          'status': 'attending',
          'timestamp': '2022-03-21 18:37:30'
        },
      ]
    });

    expect(queue, isA<QueueEntity>());
    expect(queue.title, 'title');
    expect(queue.priority, 1);
    expect(queue.orders.first.status, OrderStatus.attending);
  });

  test('deve converter QueueEntity em Map', () {
    final order = Order(
      id: 'dkjfflsdl',
      position: 1,
      timestamp: DateTime.now(),
      status: OrderStatus.waiting,
    );

    final queue = QueueEntity(
      id: 'kfdsala',
      title: 'title',
      abbreviation: 'abbreviation',
      priority: 1,
      orders: [order],
    );

    final map = JsonToQueue.toMap(queue);

    expect(map['id'], 'kfdsala');
    expect(map['title'], 'title');
    expect(map['orders'][0]['status'], 'waiting');
  });
}
