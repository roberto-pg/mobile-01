import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue/src/configuration/blocs/configuration_bloc.dart';

final configurationModule = [
  BlocProvider(
      create: (context) => ConfigurationBloc(
            getAllQueuesUsecase: context.read(),
            addNewQueueUsecase: context.read(),
            removeQueueUseCase: context.read(),
          ))
];
