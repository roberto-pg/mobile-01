import 'package:flutter_test/flutter_test.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/usecases/generate_order.dart';

void main() {
  test('deve gerar uma nova order', () {
    final useCase = GenerateOrderUseCase();
    const queueEntity = QueueEntity(
      id: 'dfdddddd',
      title: 'title',
      abbreviation: 'abbreviation',
      priority: 1,
      orders: [],
    );

    final result = useCase.call(queueEntity);

    expect(result.orders.length, 1);
    expect(result.orders.first.id, '0001');
    expect(result.orders.first.position, 1);
  });
}
