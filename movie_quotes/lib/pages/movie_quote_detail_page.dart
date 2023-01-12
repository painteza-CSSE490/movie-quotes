import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/movie_quote.dart';

class MovieQuoteDetailPage extends StatefulWidget {
  final MovieQuote mq;
  const MovieQuoteDetailPage(this.mq, {super.key});

  @override
  State<MovieQuoteDetailPage> createState() => _MovieQuoteDetailPageState();
}

class _MovieQuoteDetailPageState extends State<MovieQuoteDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie Quotes"),
        ),
        backgroundColor: Colors.grey[100],
        body: Center(
          child: LabelledTextDisplay(
            movie: widget.mq.movie,
            quote: widget.mq.quote,
          ),
        ));
  }
}

class LabelledTextDisplay extends StatelessWidget {
  final movie;
  final quote;
  const LabelledTextDisplay(
      {super.key, required this.movie, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Card(
            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 100),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.format_quote),
                      ),
                      Text(
                        "Quote: ",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Text(quote),
                ],
              ),
            )),
        Card(
            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40, horizontal: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.movie),
                      ),
                      Text(
                        "Movie: ",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Text(movie),
                ],
              ),
            )),
      ],
    ));
  }
}
