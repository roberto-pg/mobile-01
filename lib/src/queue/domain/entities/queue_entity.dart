import '../value_objects/order.dart';

class QueueEntity {
  final String id;
  final String title;
  final String abbreviation;
  final int priority;
  final List<Order> orders;

  const QueueEntity(
      {required this.id,
      required this.title,
      required this.abbreviation,
      required this.priority,
      required this.orders});
}
