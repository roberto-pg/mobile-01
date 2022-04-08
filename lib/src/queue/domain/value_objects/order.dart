class Order {
  final String id;
  final int position;
  final DateTime timestamp;
  final OrderStatus status;

  Order({
    required this.id,
    required this.position,
    required this.timestamp,
    required this.status,
  });
}

enum OrderStatus {
  waiting,
  attending,
  notAnswered,
}
