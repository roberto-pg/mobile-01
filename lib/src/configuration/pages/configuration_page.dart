import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:provider/provider.dart';
import 'package:queue/src/configuration/states/conf_state.dart';
import 'package:queue/src/configuration/stores/conf_store.dart';
import 'package:queue/src/queue/domain/entities/queue_entity.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<ConfStore>();

    setState(() {
      store.getStream();
    });

    return Scaffold(
      body: Scaffold(
        appBar: AppBar(title: const Text('Configurações')),
        body: ScopedBuilder<ConfStore, Exception, List<QueueEntity>>(
          store: store,
          onState: (_, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('FILAS'),
                      Spacer(),
                      Icon(
                        Icons.add,
                      ),
                    ],
                  ),
                  if (state is LoadedConfState)
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        final queue = state[index];
                        return ListTile(
                          title: Text('${queue.title} - ${queue.abbreviation}'),
                          subtitle: Text('${queue.priority} de prioridade'),
                          trailing: const Icon(
                            Icons.remove,
                            color: Colors.redAccent,
                          ),
                        );
                      },
                    ),
                  const SizedBox(height: 10),
                  const Text('CONTROLE'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {},
                    child: const Text('Reiniciar filas'),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
