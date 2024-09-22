import 'package:flutter/material.dart';
import 'package:sombrero_seleccionador/views/RegisterPage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/pngwing.com.png', scale: 3,),
            const Text(
              "El Sombrero Seleccionador",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Responde, aprende y descubre tu casa de software al instante.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            ElevatedButton(
                onPressed: () {
                  navigateToRegister(context);
                },
                child: const Text("Comenzar"))
          ],
        ),
      ),
    );
  }
}

Future navigateToRegister(BuildContext context) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Registerpage()));
}
