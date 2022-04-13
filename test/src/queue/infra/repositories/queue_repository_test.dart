import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/infra/repositories/queue_repository.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('queue repository getAllQueues', () {
    final datasource = IQueueDatasourceMock();

    when(() => datasource.getAllQueues()).thenAnswer(
      (_) => Stream.value(
        [
          {
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
          }
        ],
      ),
    );

    final repository = QueueRepository(datasource: datasource);

    final result = repository.getAllQueues();
    expect(result, emits(isA<List<QueueEntity>>()));
  });

  test('deve adicionar uma nova queue', () {
    final datasource = IQueueDatasourceMock();
    const queue = QueueEntity(
        id: 'djhfjjf',
        title: 'title',
        abbreviation: 'abbreviation',
        priority: 1,
        orders: []);
    when(() => datasource.addQueue(any())).thenAnswer((_) => Future.value());
    final repository = QueueRepository(datasource: datasource);

    expect(repository.addQueue(queue), completes);
  });
}
