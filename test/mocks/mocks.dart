import 'package:mocktail/mocktail.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue/src/queue/domain/usecases/add_new_queue.dart';
import 'package:queue/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue/src/queue/domain/usecases/remove_all_orders.dart';
import 'package:queue/src/queue/domain/usecases/remove_queue.dart';
import 'package:queue/src/queue/infra/datasource/queue_datasource.dart';

class QueueRepositoryMock extends Mock implements IQueueRepository {}

class QueueEntityMock extends Mock implements QueueEntity {}

class IQueueDatasourceMock extends Mock implements IQueueDatasource {}

class IGetAllQueuesUseCaseMock extends Mock implements IGetAllQueuesUseCase {}

class IAddNewQueueUseCaseMock extends Mock implements IAddNewQueueUseCase {}

class IRemoveQueueUseCaseMock extends Mock implements IRemoveQueueUseCase {}

class IRemoveAllOrdersUseCaseMock extends Mock implements IRemoveAllOrdersUseCase {}