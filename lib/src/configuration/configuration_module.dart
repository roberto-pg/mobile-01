import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue/src/configuration/blocs/conf_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:queue/src/configuration/stores/conf_store.dart';

final configurationModule = [
  BlocProvider(create: (context) => ConfBloc(context.read()))
  // Provider<ConfStore>(
  //     create: (context) => ConfStore(getAllQueuesUsecase: context.read()))
];
