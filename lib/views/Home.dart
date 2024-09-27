// ignore_for_file: prefer_const_constructors, await_only_futures

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sombrero_seleccionador/views/RegisterPage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/howards.jpg', fit: BoxFit.cover,)
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.3), // Filtro oscuro sutil para mejor contraste
                ),
              ),
            ),
            FutureBuilder(
              future: _loadFonts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error al cargar las fuentes"));
                } else {
                  return _buildHomeContent(context);
                }
              },
            ),
          ]
        ),
      ),
    );
  }

  Future<void> _loadFonts() async {
    // Cargar las fuentes de Google Fonts
    GoogleFonts.getFont('Merriweather');
    GoogleFonts.getFont('Roboto');
  }

  Widget _buildHomeContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/pngwing.com.png', scale: 3),
          Text(
            "El Sombrero Seleccionador",
            style: GoogleFonts.merriweather(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Responde, aprende y descubre tu casa mágica al instante.",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              navigateToRegister(context);
            },
            child: const Text("Comenzar"),
          ),
          Text("1.0.0", 
            style: GoogleFonts.roboto(
              fontSize: 10,
              color: Colors.white
              )
            )

        ],
      ),
    );
  }
}

Future navigateToRegister(BuildContext context) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Registerpage()));
}