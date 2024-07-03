import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:bgsearchapp/3_presentation/pages/search_results/search_results_body.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final NumberPaginatorController _controller = NumberPaginatorController();

  @override
  Widget build(BuildContext context) {
    int index = context.watch<StateManager>().pageIndex;
    return Scaffold(
      body: const ResultsPageBody(),
      bottomNavigationBar: Card(
        child: Row(
          children: [const BackButton(),
            Expanded(
              child: NumberPaginator(
                numberPages: 10,
                controller: _controller,
                initialPage: index,
                contentBuilder: (index) => Expanded(
                  child: Center(
                    child: Text("Search Results Page: ${index + 1}"),
                  ),
                ),
                onPageChange: (int index) {
                  print(index);
                  context.read<StateManager>().changeResultsPage(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
