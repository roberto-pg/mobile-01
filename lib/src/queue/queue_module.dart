import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue/src/queue/domain/usecases/add_new_queue.dart';
import 'package:queue/src/queue/domain/usecases/generate_order.dart';
import 'package:queue/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue/src/queue/domain/usecases/remove_all_orders.dart';
import 'package:queue/src/queue/domain/usecases/remove_queue.dart';
import 'package:queue/src/queue/domain/usecases/update_queue.dart';
import 'package:queue/src/queue/external/queue_firestore_datasource.dart';
import 'package:queue/src/queue/infra/datasource/queue_datasource.dart';
import 'package:queue/src/queue/infra/repositories/queue_repository.dart';

final queueModule = [
  Provider<FirebaseFirestore>.value(value: FirebaseFirestore.instance),
  Provider<IQueueDatasource>(
      create: (context) => QueueFirestoreDatasource(firestore: context.read())),
  Provider<IQueueRepository>(
      create: (context) => QueueRepository(datasource: context.read())),
  // usecase
  Provider<IGetAllQueuesUseCase>(
      create: (context) => GetAllQueuesUseCase(repository: context.read())),
  Provider<IAddNewQueueUseCase>(
      create: (context) => AddNewQueueUseCase(repository: context.read())),
  Provider<IRemoveQueueUseCase>(
      create: (context) => RemoveQueueUseCase(repository: context.read())),
  Provider<IRemoveAllOrdersUseCase>(
      create: (context) => RemoveAllOrdersUseCase(repository: context.read())),
  Provider<IGenerateOrderUseCase>(create: (context) => GenerateOrderUseCase()),
  Provider<IRemoveAllOrdersUseCase>(
      create: (context) => RemoveAllOrdersUseCase(repository: context.read())),
  Provider<IUpdateQueueUseCase>(
      create: (context) => UpdateQueueUseCase(repository: context.read())),
];
