import 'package:flutter/material.dart';
import '../models/planta.dart';

class DetallePlantaScreen extends StatelessWidget {
  final Planta planta;

  DetallePlantaScreen({required this.planta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planta.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nombre: ${planta.nombre}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Tipo: ${planta.tipo}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Frecuencia de riego: cada ${planta.frecuenciaRiego} días", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Frecuencia de fertilización: cada ${planta.frecuenciaFertilizacion} días", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Condiciones de luz: ${planta.condicionesLuz}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Condiciones de temperatura: ${planta.condicionesTemperatura}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Image.network(planta.imagen), 
          ],
        ),
      ),
    );
  }
}
