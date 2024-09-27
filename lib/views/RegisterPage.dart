// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sombrero_seleccionador/views/Category_selection.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genreController = TextEditingController();

  String? genreValue;
  final List<String> _options = ['Hombre', 'Mujer', 'Prefiero no decirlo'];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.65;

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de Usuario",
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
                  "Ingresa tus datos personales",
                  style: GoogleFonts.roboto(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              label: Text("Nombre"),
                              border: OutlineInputBorder()),
                          validator: (user) {
                            if (user!.isEmpty) {
                              return "Campo incompleto";
                            } else if (user.length <= 5) {
                              return "El nombre debe tener al menos 5 caracteres.";
                            } else if (!user.startsWith(RegExp(r'[A-Z]'))) {
                              return "La primera letra debe ser mayuscula.";
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: ageController,
                          decoration: const InputDecoration(
                              label: Text("Edad"),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.cake)),
                          validator: (age) {
                            // Intentar convertir el texto a un entero
                            int? ageValue = int.tryParse(age!);

                            if (age.isEmpty) {
                              return "Campo incompleto";
                            } else if (age.length > 2) {
                              return "Tu edad no debe tener más de dos dígitos.";
                            } else if (ageValue! < 12) {
                              return "La edad mínima es de 12 años";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Selecciona una opción',
                            border: OutlineInputBorder(),
                          ),
                          value: genreValue,
                          items: _options.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              genreValue = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor selecciona una opción';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                FilledButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        setState(() {});

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CategorySelection()));
                      }
                    },
                    child: const Text("Siguiente"))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
