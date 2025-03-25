import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:app_graphql/config/graphql_config.dart'; 
import 'package:app_graphql/controllers/film_controller.dart'; 
import 'package:app_graphql/screens/home_screen.dart'; 

void main() async {
 
  await initHiveForFlutter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    Get.put(FilmController(GraphQLConfig.clientToQuery().value));
    return GraphQLProvider(
      client: GraphQLConfig.clientToQuery(), 
      child: GetMaterialApp(
        title: 'Star Wars GraphQL App',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
        home: HomeScreen(), 
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
