// ignore_for_file: prefer_const_constructors, unused_field

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySelection extends StatefulWidget {
  const CategorySelection({super.key});

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  String? categorySelection;

  final List<String> _category = ['Diseño Gráfico', 'Programación', 'Gamer', 'Aleatorio'];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.65;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Categorías",
            style: GoogleFonts.merriweather(
                fontWeight: FontWeight.w600, fontSize: 15)),
        centerTitle: true,
      ),
      body: Stack(children: [
        Positioned.fill(
            child: Image.asset(
          'assets/howards.jpg',
          fit: BoxFit.cover,
        )),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black
                  .withOpacity(0.3), // Filtro oscuro sutil para mejor contraste
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(214, 201, 174, 152),
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            width: screenWidth,
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Selecciona tu categoría de interés",
                  style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Column(
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.color_lens_rounded),
                              const SizedBox(width: 8,),
                              Text(
                                "Diseño Gráfico",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.computer_rounded),
                              const SizedBox(width: 8,),
                              Text(
                                "Programación",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.gamepad_rounded),
                              const SizedBox(width: 8,),
                              Text(
                                "Gamer",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.question_mark_rounded),
                              const SizedBox(width: 8,),
                              Text(
                                "Aletorio",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ),
                      ],
                    )
                  ),
                FilledButton(
                  onPressed: () {}, 
                  child: const Text("Empezemos!")
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
