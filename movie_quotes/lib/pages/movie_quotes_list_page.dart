import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_quotes/components/movie_quote_row_component.dart';
import 'package:movie_quotes/managers/movie_quotes_collection_manager.dart';
import 'package:movie_quotes/models/movie_quote.dart';
import 'package:movie_quotes/pages/movie_quote_detail_page.dart';

class MovieQuotesListPage extends StatefulWidget {
  const MovieQuotesListPage({super.key});

  @override
  State<MovieQuotesListPage> createState() => _MovieQuotesListPageState();
}

class _MovieQuotesListPageState extends State<MovieQuotesListPage> {
  final quotes = <MovieQuote>[]; // Later we will remove this and use Firestore
  final quoteTextController = TextEditingController();
  final movieTextController = TextEditingController();

  StreamSubscription? movieQuotesSubscription;

  @override
  void initState() {
    super.initState();

    movieQuotesSubscription =
        MovieQuotesCollectionManager.instance.startListening(() {
      print("There are new quotes!!!!");
      setState(() {});
    });
  }

  @override
  void dispose() {
    quoteTextController.dispose();
    movieTextController.dispose();
    MovieQuotesCollectionManager.instance
        .stopListening(movieQuotesSubscription);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final List<MovieQuoteRow> movieRows = [];
    // for (final movieQuote in quotes) {
    //   movieRows.add(MovieQuoteRow(movieQuote));
    // }

    final List<MovieQuoteRow> movieRows =
        MovieQuotesCollectionManager.instance.latestMovieQuotes
            .map((mq) => MovieQuoteRow(
                  movieQuote: mq,
                  onTap: () async {
                    print(
                        "You clicked on the movie quote ${mq.quote} - ${mq.movie}");
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return MovieQuoteDetailPage(
                              mq.documentId!); // In Firebase use a documentId
                        },
                      ),
                    );
                    setState(() {});
                  },
                ))
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Quotes"),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        // children: [
        //   MovieQuoteRow(quotes[0]),
        //   MovieQuoteRow(quotes[1]),
        //   MovieQuoteRow(quotes[2]),
        // ],
        children: movieRows,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCreateQuoteDialog(context);
        },
        tooltip: 'Create',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showCreateQuoteDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create a Movie Quote'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
                child: TextFormField(
                  controller: quoteTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the quote',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
                child: TextFormField(
                  controller: movieTextController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the movie',
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Create'),
              onPressed: () {
                setState(() {
                  // TODO: Add quotes with firebase!

                  MovieQuotesCollectionManager.instance.add(
                    quote: quoteTextController.text,
                    movie: movieTextController.text,
                  );
                  quoteTextController.text = "";
                  movieTextController.text = "";
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
