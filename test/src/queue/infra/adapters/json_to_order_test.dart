import 'package:flutter_test/flutter_test.dart';
import 'package:queue/src/queue/domain/value_objects/order.dart';
import 'package:queue/src/queue/infra/adapters/json_to_order.dart';

void main() {
  test('deve converter um map em um objeto do tipo Order', () {
    final order = JsonToOrder.fromMap({
      'id': 'jdldflfdl',
      'position': 1,
      'status': 'attending',
      'timestamp': '2022-03-21 18:37:30'
    });

    expect(order, isA<Order>());
    expect(order.status, OrderStatus.attending);
  });
}
