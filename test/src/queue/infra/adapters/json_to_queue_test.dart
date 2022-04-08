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
}
