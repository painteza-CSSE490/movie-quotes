import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_quotes/models/movie_quote.dart';
import 'package:movie_quotes/pages/movie_quote_detail_page.dart';

import '../components/movie_quote_row_component.dart';

class MovieQuotesListPage extends StatefulWidget {
  const MovieQuotesListPage({super.key});

  @override
  State<MovieQuotesListPage> createState() => _MovieQuotesListPageState();
}

class _MovieQuotesListPageState extends State<MovieQuotesListPage> {
  final movieQuoteTextController = TextEditingController();
  final movieNameTextController = TextEditingController();
  final List<MovieQuote> quotes = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quotes.add(MovieQuote(
        quote: "Today we're going to teach fluffy how to fly!", movie: "UHF"));
    quotes.add(MovieQuote(quote: "Never Trust a Bunny!", movie: "Hoodwinked!"));
    quotes.add(MovieQuote(quote: "We've been Jammed!", movie: "Spaceballs"));
    quotes.add(MovieQuote(
        quote: "Anyone who has arms, start tying!",
        movie: "The toy who saved Christmas"));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    movieNameTextController.dispose();
    movieQuoteTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<MovieQuoteRow> movieRows = quotes
        .map((mq) => MovieQuoteRow(
            movieQuote: mq,
            onTap: () async {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return MovieQuoteDetailPage(mq);
              }));
              setState(() {});
            }))
        .toList();
    // for (final movieQuote in quotes) {
    //   movieRows.add(MovieQuoteRow(movieQuote));
    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Quotes"),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: movieRows,
        // [
        //   MovieQuoteRow(quotes[0]),
        //   MovieQuoteRow(quotes[1]),
        //   MovieQuoteRow(quotes[2]),
        // ]
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          showCreateQuoteDialog(context);
        }),
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
          content:
              //TODO: change all of this!
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Movie Name"),
                controller: movieNameTextController,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: "Quote"),
                  controller: movieQuoteTextController),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                movieNameTextController.text = "";
                movieQuoteTextController.text = "";
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
                  quotes.add(MovieQuote(
                      quote: movieQuoteTextController.text,
                      movie: movieNameTextController.text));
                  Navigator.of(context).pop();
                  movieNameTextController.text = "";
                  movieQuoteTextController.text = "";
                });
              },
            ),
          ],
        );
      },
    );
  }
}
