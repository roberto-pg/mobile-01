import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:queue/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue/src/queue/domain/usecases/get_all_queues.dart';
import 'package:queue/src/queue/external/queue_firestore_datasource.dart';
import 'package:queue/src/queue/infra/datasource/queue_datasource.dart';
import 'package:queue/src/queue/infra/repositories/queue_repository.dart';

final queueModule = [
  Provider<FirebaseFirestore>.value(value: FirebaseFirestore.instance),
  Provider<IQueueDatasource>(
      create: (context) => QueueFirestoreDatasource(firestore: context.read())),
  Provider<IQueueRepository>(
      create: (context) => QueueRepository(datasource: context.read())),
  Provider<IGetAllQueues>(
      create: (context) => GetAllQueues(repository: context.read()))
];
