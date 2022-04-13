import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue/src/configuration/blocs/configuration_bloc.dart';
import 'package:queue/src/configuration/events/configuration_event.dart';
import 'package:queue/src/configuration/states/configuration_state.dart';

import '../../../mocks/mocks.dart';

void main() {
  blocTest<ConfigurationBloc, ConfigurationState>(
    'conf bloc ...',
    build: () {
      final getAllQueuesUseCase = IGetAllQueuesMock();
      final addNewQueueUseCase = IAddNewQueueMock();
      final removeQueueUseCase = IRemoveQueueUseCaseMock();

      when(() => getAllQueuesUseCase.call())
          .thenAnswer((_) => Stream.value([]));
      return ConfigurationBloc(
          getAllQueuesUsecase: getAllQueuesUseCase,
          addNewQueueUsecase: addNewQueueUseCase,
          removeQueueUseCase: removeQueueUseCase);
    },
    act: (bloc) => bloc.add(FetchQueuesEvent()),
    expect: () => [
      isA<LoadingConfigurationState>(),
      isA<LoadedConfigurationState>(),
    ],
  );
}
