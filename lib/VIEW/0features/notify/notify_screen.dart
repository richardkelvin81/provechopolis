import 'dart:ui';

import 'package:flutter/material.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Stack con Efecto de Desenfoque')),
        body: Center(
          child: Stack(
            children: [
              // Fondo (contenido principal)
              Container(color: Colors.blue),

              // Contenedor con efecto de desenfoque
              SizedBox.expand(
                child: Container(
                    color: Colors.white.withOpacity(0.2),
                    child: const Text('Elemento en el Stack'),  
                  )),

              // Otros elementos en el Stack
              const Positioned(
                top: 100,
                left: 50,
                child: Text('Elemento en el Stack'),
              ),
            ],
          ),
        ),
      );
  }
}