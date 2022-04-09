import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue/src/configuration/blocs/conf_bloc.dart';
import 'package:queue/src/configuration/states/conf_state.dart';

import '../../../mocks/mocks.dart';

void main() {
  blocTest('conf bloc ...',
      build: () {
        final usecase = IGetAllQueuesMock();
        when(() => usecase.call()).thenAnswer((_) => Stream.value([]));
        return ConfBloc(usecase);
      },
      expect: () => [isA<LoadedConfState>()]);
}
