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
  final movieQuoteTextController = TextEditingController();
  final movieNameTextController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    movieNameTextController.dispose();
    movieQuoteTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                // Navigator.pop(context);
                showEditQuoteDialog(context, widget.mq);
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                icon: Icon(Icons.delete))
          ],
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

  Future<void> showEditQuoteDialog(BuildContext context, MovieQuote quote) {
    movieNameTextController.text = quote.movie;
    movieQuoteTextController.text = quote.quote;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit a Movie Quote'),
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
                // movieNameTextController.text = "";
                // movieQuoteTextController.text = "";
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                  // movieNameTextController.text = "";
                  // movieQuoteTextController.text = "";
                  quote.movie = movieNameTextController.text;
                  quote.quote = movieQuoteTextController.text;
                });
              },
            ),
          ],
        );
      },
    );
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

const snackbar = SnackBar(content: Text("Deleted!"));
