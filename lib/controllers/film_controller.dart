// lib/controllers/film_controller.dart
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:app_graphql/models/film.dart';
import 'package:app_graphql/services/film_service.dart'; // Si usas el servicio, mantén esta importación

class FilmController extends GetxController {
  final RxList<Film> films = <Film>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  final GraphQLClient _client; // Necesitamos el cliente de GraphQL

  FilmController(this._client); // Inyectamos el cliente de GraphQL

  @override
  void onInit() {
    super.onInit();
    fetchFilms();
  }

  Future<void> fetchFilms() async {
    isLoading.value = true;
    error.value = '';

    // Consulta GraphQL
    final QueryOptions options = QueryOptions(
      document: gql('''
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
      '''), 
    );

    try {
      // Realizar la consulta con el cliente GraphQL
      final result = await _client.query(options);
      
      if (result.hasException) {
        error.value = result.exception.toString();
      } else {
        // Comprobación de null para evitar el error
        final filmsData = result.data?['allFilms']?['films'] as List? ?? [];
        films.value = filmsData.map((film) => Film.fromJson(film)).toList();
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
