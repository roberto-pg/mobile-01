import 'package:queue/src/queue/infra/adapters/json_to_order.dart';

import '../../domain/entities/queue_entity.dart';

class JsonToQueue {
  static QueueEntity fromMap(dynamic json) {
    return QueueEntity(
        id: json['id'],
        title: json['title'],
        abbreviation: json['abbreviation'],
        priority: json['priority'],
        orders: [
          if (json.containsKey('orders'))
            ...(json['orders'] as List).map(JsonToOrder.fromMap).toList(),
        ]);
  }

  static Map<String, dynamic> toMap(QueueEntity queue) {
    return {
      'id': queue.id,
      'title': queue.title,
      'abbreviation': queue.abbreviation,
      'priority': queue.priority,
      'orders': queue.orders.map((order) => JsonToOrder.toMap(order)).toList()
    };
  }
}
