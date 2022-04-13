import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue/src/queue/domain/usecases/add_new_queue.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('deve adicinar uma nova QueueEntity', () {
    final repository = QueueRepositoryMock();
    final queue = QueueEntityMock();

    when(() => repository.addQueue(queue))
        .thenAnswer((_) => Future.value());
    final usecase = AddNewQueueUseCase(repository: repository);

    expect(usecase.call(queue), completes);
  });
}
