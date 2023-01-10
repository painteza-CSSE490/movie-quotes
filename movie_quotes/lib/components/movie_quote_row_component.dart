import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/movie_quote.dart';

class MovieQuoteRow extends StatelessWidget {
  final MovieQuote mq;
  const MovieQuoteRow(this.mq, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
      child: Card(
        child: ListTile(
            leading: const Icon(Icons.movie_creation_outlined),
            title: Text(
              mq.quote,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              mq.movie,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.chevron_right)),
      ),
    );
  }
}
