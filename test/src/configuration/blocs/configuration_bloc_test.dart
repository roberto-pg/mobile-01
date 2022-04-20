import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue/src/configuration/blocs/configuration_bloc.dart';
import 'package:queue/src/configuration/events/configuration_event.dart';
import 'package:queue/src/configuration/states/configuration_state.dart';

import '../../../mocks/mocks.dart';

void main() {
  final entity = QueueEntityMock();

  late IGetAllQueuesUseCaseMock getAllQueuesUseCase;
  late IAddNewQueueUseCaseMock addNewQueueUseCase;
  late IRemoveQueueUseCaseMock removeQueueUseCase;
  late IRemoveAllOrdersUseCaseMock removeAllOrdersUseCase;
  late ConfigurationBloc bloc;

  setUp(() {
    getAllQueuesUseCase = IGetAllQueuesUseCaseMock();
    addNewQueueUseCase = IAddNewQueueUseCaseMock();
    removeQueueUseCase = IRemoveQueueUseCaseMock();
    removeAllOrdersUseCase = IRemoveAllOrdersUseCaseMock();
    bloc = ConfigurationBloc(
        addNewQueueUseCase: addNewQueueUseCase,
        getAllQueuesUseCase: getAllQueuesUseCase,
        removeQueueUseCase: removeQueueUseCase,
        removeAllOrdersUseCase: removeAllOrdersUseCase);
  });

  blocTest<ConfigurationBloc, ConfigurationState>(
    'fetch queues',
    build: () {
      when(() => getAllQueuesUseCase.call())
          .thenAnswer((_) => Stream.value([]));
      return bloc;
    },
    act: (bloc) => bloc.add(FetchQueuesEvent()),
    expect: () => [
      isA<LoadingConfigurationState>(),
      isA<LoadedConfigurationState>(),
    ],
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'fetch queues with error',
    build: () {
      when(() => getAllQueuesUseCase.call())
          .thenAnswer((_) => Stream.error(Exception('Error')));
      return bloc;
    },
    act: (bloc) => bloc.add(FetchQueuesEvent()),
    expect: () => [
      isA<LoadingConfigurationState>(),
      isA<ExceptionConfigurationState>(),
    ],
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'add new queues',
    build: () {
      when(() => addNewQueueUseCase.call(entity))
          .thenAnswer((_) => Future.value());
      return bloc;
    },
    act: (bloc) => bloc.add(AddNewQueueEvent(queue: entity)),
    expect: () => [],
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'remove queues',
    build: () {
      when(() => removeQueueUseCase.call(entity))
          .thenAnswer((_) => Future.value());
      return bloc;
    },
    act: (bloc) => bloc.add(RemoveQueueEvent(queue: entity)),
    expect: () => [],
  );
}
