import 'package:queue/src/queue/domain/entities/queue_entity.dart';

abstract class ConfigurationState {}

class InitialConfigurationState extends ConfigurationState {}

class LoadingConfigurationState extends ConfigurationState {}

class LoadedConfigurationState extends ConfigurationState {
  final List<QueueEntity> queues;
  LoadedConfigurationState(this.queues);
}

class ExceptionConfigurationState extends ConfigurationState {
  final String message;
  ExceptionConfigurationState(this.message);
}
