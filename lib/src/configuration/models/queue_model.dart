import 'package:queue/src/queue/domain/entities/queue_entity.dart';
import 'package:queue/src/queue/domain/value_objects/order.dart';

class QueueModel extends QueueEntity {
  const QueueModel(
      {required String id,
      required String title,
      required String abbreviation,
      required int priority,
      required List<Order> orders})
      : super(
            id: id,
            title: title,
            abbreviation: abbreviation,
            priority: priority,
            orders: orders);

  factory QueueModel.empty() => const QueueModel(
        id: '',
        title: '',
        abbreviation: '',
        priority: 0,
        orders: [],
      );

  QueueModel copyWith(
      {String? id,
      String? title,
      String? abbreviation,
      int? priority,
      List<Order>? orders}) {
    return QueueModel(
      id: id ?? this.id,
      title: title ?? this.title,
      abbreviation: abbreviation ?? this.abbreviation,
      priority: priority ?? this.priority,
      orders: orders ?? this.orders,
    );
  }
}
