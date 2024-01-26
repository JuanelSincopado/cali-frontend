import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/tramite_provider.dart';
import 'widget/custom_expasion_panel.dart';
import 'widget/text_link.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final tramiteProvider = Provider.of<TramiteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos los trámites'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
      ),
      body: tramiteProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: tramiteProvider.tramites.length,
              itemBuilder: (_, index) {
                final tramite = tramiteProvider.tramites[index];

                bool hasSubOptions = tramite.hasSubOptions();

                return CustomExpansionPanel(
                  title: tramite.title,
                  child: hasSubOptions
                      ? Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: tramite.options
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
                          title: tramite.options.first.title,
                          url: tramite.options.first.url,
                        ),
                );
              },
            ),
    );
  }
}
