import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/film.dart';

class GraphQLService {
  final GraphQLClient client;

  GraphQLService({GraphQLClient? client})
      : client = client ??
            GraphQLClient(
              cache: GraphQLCache(store: HiveStore()),
              link: HttpLink('https://swapi-graphql.netlify.app/.netlify/functions/index'),
            );

  Future<List<Film>> fetchFilms() async {
    const String readFilms = """
      query Query {
        allFilms {
          films {
            title
            director
            releaseDate
            speciesConnection {
              species {
                name
                classification
                homeworld {
                  name
                }
              }
            }
          }
        }
      }
    """;

    final result = await client.query(QueryOptions(document: gql(readFilms)));

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    List<Film> films = (result.data?['allFilms']['films'] as List)
        .map((filmJson) => Film.fromJson(filmJson))
        .toList();

    return films;
  }
}
