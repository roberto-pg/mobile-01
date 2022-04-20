import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue/src/checkin/blocs/checkin_bloc.dart';

final checkinModule = [
  BlocProvider(
    create: (context) => CheckinBloc(
      getAllQueuesUseCase: context.read(),
      generateOrderUseCase: context.read(),
      updateQueueUseCase: context.read(),
    ),
  ),
];
