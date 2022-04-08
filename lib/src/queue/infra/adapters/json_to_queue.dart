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
}
