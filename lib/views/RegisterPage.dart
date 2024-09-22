import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final GlobalKey <FormState>_key = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Registro de Usuario",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Text("Ingresa tu nombre y apellido"),
            Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth,
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          label: Text("Nombre"), border: OutlineInputBorder()),
                      validator: (user) {
                        if (user!.isEmpty) {
                          return "Campo incompleto";
                        } else if (user.length <= 5) {
                          return "El nombre debe tener al menos 5 caracteres.";
                        }else if(!user.startsWith(RegExp(r'[A-Z]'))){
                          return "La primera letra debe ser mayuscula.";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            FilledButton(
              onPressed: () async {
                if(_key.currentState!.validate()){
                  setState(() {
                    
                  });
                }
              },
              child: const Text("Empezemos!")
            )
          ],
        ),
      ),
    );
  }
}
