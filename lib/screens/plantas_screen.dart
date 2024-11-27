import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/planta.dart';
import '../screens/DetallesScreen.dart';

class PlantasScreen extends StatefulWidget {
  @override
  _PlantasScreenState createState() => _PlantasScreenState();
}

class _PlantasScreenState extends State<PlantasScreen> {
  late Future<List<Planta>> _plantas;

  @override
  void initState() {
    super.initState();
    _plantas = ApiService().obtenerPlantas(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plantas de mi Huerto"),
      ),
      body: FutureBuilder<List<Planta>>(
        future: _plantas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay plantas registradas.'));
          } else {
            List<Planta> plantas = snapshot.data!;
            return ListView.builder(
              itemCount: plantas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(plantas[index].nombre),
                  subtitle: Text(plantas[index].tipo),
                  leading: Icon(Icons.nature), 
                  onTap: () {
                   
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetallePlantaScreen(planta: plantas[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
