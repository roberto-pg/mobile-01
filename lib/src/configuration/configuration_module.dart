import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue/src/configuration/blocs/configuration_bloc.dart';

final configurationModule = [
  BlocProvider(
      create: (context) => ConfigurationBloc(
            getAllQueuesUseCase: context.read(),
            addNewQueueUseCase: context.read(),
            removeQueueUseCase: context.read(),
            removeAllOrdersUseCase: context.read(),
          ))
];
