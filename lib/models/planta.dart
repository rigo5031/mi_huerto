class Planta {
  final int id;
  final String nombre;
  final String tipo;
  final int frecuenciaRiego;
  final int frecuenciaFertilizacion;
  final String condicionesLuz;
  final String condicionesTemperatura;
  final String imagen;

  Planta({
    required this.id,
    required this.nombre,
    required this.tipo,
    required this.frecuenciaRiego,
    required this.frecuenciaFertilizacion,
    required this.condicionesLuz,
    required this.condicionesTemperatura,
    required this.imagen,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'tipo': tipo,
      'frecuenciaRiego': frecuenciaRiego,
      'frecuenciaFertilizacion': frecuenciaFertilizacion,
      'condicionesLuz': condicionesLuz,
      'condicionesTemperatura': condicionesTemperatura,
      'imagen': imagen,
    };
  }


  factory Planta.fromJson(Map<String, dynamic> json) {
    return Planta(
      id: json['id'],
      nombre: json['nombre'],
      tipo: json['tipo'],
      frecuenciaRiego: json['frecuenciaRiego'],
      frecuenciaFertilizacion: json['frecuenciaFertilizacion'],
      condicionesLuz: json['condicionesLuz'],
      condicionesTemperatura: json['condicionesTemperatura'],
      imagen: json['imagen'],
    );
  }
}
