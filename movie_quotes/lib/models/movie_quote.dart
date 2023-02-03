import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_quotes/models/firestore_model_utils.dart';

const String kMovieQuoteCollectionPath = "MovieQuotes";
const String kMovieQuote_quote = "quote";
const String kMovieQuote_movie = "movie";
const String kMovieQuote_authorUid = "authorUid";
const String kMovieQuote_lastTouched = "lastTouched";

class MovieQuote {
  String authorUid;
  String? documentId;
  Timestamp lastTouched;
  String movie;
  String quote;

  MovieQuote({
    this.documentId,
    required this.authorUid,
    required this.quote,
    required this.movie,
    required this.lastTouched,
  });

  MovieQuote.from(DocumentSnapshot doc)
      : this(
          documentId: doc.id,
          authorUid:
              FirestoreModelUtils.getStringField(doc, kMovieQuote_authorUid),
          quote: FirestoreModelUtils.getStringField(doc, kMovieQuote_quote),
          movie: FirestoreModelUtils.getStringField(doc, kMovieQuote_movie),
          lastTouched: FirestoreModelUtils.getTimestampField(
              doc, kMovieQuote_lastTouched),
        );

  @override
  String toString() {
    return "$quote from the movie $movie";
  }

  Map<String, Object?> toMap() {
    return {
      kMovieQuote_quote: quote,
      kMovieQuote_movie: movie,
      kMovieQuote_lastTouched: lastTouched,
      kMovieQuote_authorUid: authorUid,
    };
  }
}
