import 'package:queue/src/queue/infra/datasource/queue_datasource.dart';

class QueueFirestoreDatasource implements IQueueDatasource {

  @override
  Stream<List<Map>> getAllQueues() {
    throw UnimplementedError();
  }
}
