import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queue/src/queue/external/queue_firestore_datasource.dart';

void main() {
  test('queue firestore datasource getAllQueues', () async {
    final firestore = FakeFirebaseFirestore();
    await firestore.collection('queue').add({
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

    final datasource = QueueFirestoreDatasource(firestore: firestore);

    final result = datasource.getAllQueues();

    expect(result, emits(isA<List<Map>>()));
  });
}
