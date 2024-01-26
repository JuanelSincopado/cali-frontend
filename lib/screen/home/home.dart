import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/procedure/presentation/providers/procedure_provider.dart';
import 'widget/custom_expasion_panel.dart';
import 'widget/text_link.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final procedureProvider = Provider.of<ProcedureProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos los trámites'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
      ),
      body: procedureProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: procedureProvider.procedures.length,
              itemBuilder: (_, index) {
                final procedure = procedureProvider.procedures[index];

                bool hasSubOptions = procedure.hasSubOptions();

                return CustomExpansionPanel(
                  title: procedure.title,
                  child: hasSubOptions
                      ? Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: procedure.options
                                .map(
                                  (e) => CustomExpansionPanel(
                                    title: e.title,
                                    color: Colors.white,
                                    childColor: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: e.options
                                          .map(
                                            (e) => TextLink(
                                              title: e.title,
                                              url: e.url,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      : TextLink(
                          title: procedure.options.first.title,
                          url: procedure.options.first.url,
                        ),
                );
              },
            ),
    );
  }
}
