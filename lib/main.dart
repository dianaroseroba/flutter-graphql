import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:app_graphql/config/graphql_config.dart';
import 'package:app_graphql/controllers/character_controller.dart';
import 'package:app_graphql/screens/home_screen.dart';

void main() async {
  // Inicializar Hive para GraphQL
  await initHiveForFlutter();

  // Inicializar el controlador de personajes como un singleton global
  Get.put(CharacterController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLConfig.clientToQuery(),
      child: GetMaterialApp(
        title: 'Rick and Morty Characters',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
        home: HomeScreen(), // Pantalla principal
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
