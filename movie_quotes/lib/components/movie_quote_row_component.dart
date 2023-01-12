import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/movie_quote.dart';

class MovieQuoteRow extends StatelessWidget {
  final MovieQuote movieQuote;
  final Function() onTap;
  const MovieQuoteRow(
      {super.key, required this.movieQuote, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
        child: Card(
          child: ListTile(
              leading: const Icon(Icons.movie_creation_outlined),
              title: Text(
                movieQuote.quote,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                movieQuote.movie,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.chevron_right)),
        ),
      ),
    );
  }
}
