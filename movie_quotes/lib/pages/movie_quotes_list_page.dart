import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_quotes/models/movie_quote.dart';

import '../components/movie_quote_row_component.dart';

class MovieQuotesListPage extends StatefulWidget {
  const MovieQuotesListPage({super.key});

  @override
  State<MovieQuotesListPage> createState() => _MovieQuotesListPageState();
}

class _MovieQuotesListPageState extends State<MovieQuotesListPage> {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<MovieQuoteRow> movieRows =
        quotes.map((mq) => MovieQuoteRow(mq)).toList();
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
          print("You pressed the FAB!");
        }),
        tooltip: 'Create',
        child: const Icon(Icons.add),
      ),
    );
  }
}
