import 'package:flutter/material.dart';
import 'package:sombrero_seleccionador/views/Home.dart';

/*
 * EJERCICIO:
 * Cada 1 de septiembre, el Hogwarts Express parte hacia la escuela de programación de Hogwarts para magos y brujas del código.
 * En ella, su famoso sombrero seleccionador ayuda a los programadores a encontrar su camino...
 * Desarrolla un programa que simule el comportamiento del sombrero.
 * 
 * Requisitos:
 * 1. El sombrero realizará 10 preguntas para determinar la casa del alumno.
 * 2. Deben existir 4 casas. Por ejemplo: Frontend, Backend, Mobile y Data. (Puedes elegir las que quieras)
 * 
 * Acciones:
 * 1. Crea un programa que solicite el nombre del alumno y realice 10 preguntas, con cuatro posibles respuestas cada una.
 * 2. Cada respuesta asigna puntos a cada una de las casas (a tu elección).
 * 3. Una vez finalizado, el sombrero indica el nombre del alumno y a qué casa pertenecerá (resuelve el posible empate de manera aleatoria, pero indicándole al alumno que la decisión ha sido complicada).
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

