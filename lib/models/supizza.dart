// To parse this JSON data, do
//
//     final supizzaModel = supizzaModelFromJson(jsonString);

import 'dart:convert';

SupizzaModel supizzaModelFromJson(String str) =>
    SupizzaModel.fromJson(json.decode(str));

String supizzaModelToJson(SupizzaModel data) => json.encode(data.toJson());

class SupizzaModel {
  SupizzaModel({
    this.promos,
    this.pizzas,
    this.complementos,
    this.combos,
    this.bebidas,
    this.tamanos,
  });

  List<Combo> promos;
  List<PizzaElement> pizzas;
  List<Bebida> complementos;
  List<Combo> combos;
  List<Bebida> bebidas;
  List<Bebida> tamanos;

  factory SupizzaModel.fromJson(Map<String, dynamic> json) => SupizzaModel(
        promos: List<Combo>.from(json["Promos"].map((x) => Combo.fromJson(x))),
        pizzas: List<PizzaElement>.from(
            json["Pizzas"].map((x) => PizzaElement.fromJson(x))),
        complementos: List<Bebida>.from(
            json["Complementos"].map((x) => Bebida.fromJson(x))),
        combos: List<Combo>.from(json["Combos"].map((x) => Combo.fromJson(x))),
        bebidas:
            List<Bebida>.from(json["Bebidas"].map((x) => Bebida.fromJson(x))),
        tamanos:
            List<Bebida>.from(json["Tamanos"].map((x) => Bebida.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Promos": List<dynamic>.from(promos.map((x) => x.toJson())),
        "Pizzas": List<dynamic>.from(pizzas.map((x) => x.toJson())),
        "Complementos": List<dynamic>.from(complementos.map((x) => x.toJson())),
        "Combos": List<dynamic>.from(combos.map((x) => x.toJson())),
        "Bebidas": List<dynamic>.from(bebidas.map((x) => x.toJson())),
        "Tamanos": List<dynamic>.from(tamanos.map((x) => x.toJson())),
      };
}

class Bebida {
  Bebida({
    this.urlImg,
    this.id,
    this.stock,
    this.precio,
    this.nombre,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.rebanadas,
    this.tamano,
    this.peso,
    this.descripcion,
  });

  UrlImg urlImg;
  String id;
  int stock;
  int precio;
  String nombre;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int rebanadas;
  int tamano;
  int peso;
  String descripcion;

  factory Bebida.fromJson(Map<String, dynamic> json) => Bebida(
        urlImg: UrlImg.fromJson(json["urlImg"]),
        id: json["_id"],
        stock: json["stock"] == null ? null : json["stock"],
        precio: json["precio"],
        nombre: json["nombre"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        rebanadas: json["rebanadas"] == null ? null : json["rebanadas"],
        tamano: json["tamano"] == null ? null : json["tamano"],
        peso: json["peso"] == null ? null : json["peso"],
        descripcion: json["descripcion"] == null ? null : json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "urlImg": urlImg.toJson(),
        "_id": id,
        "stock": stock == null ? null : stock,
        "precio": precio,
        "nombre": nombre,
        "created_at": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "rebanadas": rebanadas == null ? null : rebanadas,
        "tamano": tamano == null ? null : tamano,
        "peso": peso == null ? null : peso,
        "descripcion": descripcion == null ? null : descripcion,
      };
}

class UrlImg {
  UrlImg({
    this.large,
    this.medium,
    this.small,
    this.verySmall,
  });

  String large;
  String medium;
  String small;
  String verySmall;

  factory UrlImg.fromJson(Map<String, dynamic> json) => UrlImg(
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        verySmall: json["very_small"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "small": small,
        "very_small": verySmall,
      };
}

class Combo {
  Combo({
    this.urlImg,
    this.validDays,
    this.pizzas,
    this.bebidas,
    this.complementos,
    this.id,
    this.modificar,
    this.nombre,
    this.precio,
    this.tipo,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  UrlImg urlImg;
  List<ValidDay> validDays;
  List<Pizza> pizzas;
  List<Bebida> bebidas;
  List<dynamic> complementos;
  String id;
  bool modificar;
  String nombre;
  double precio;
  String tipo;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Combo.fromJson(Map<String, dynamic> json) => Combo(
        urlImg: UrlImg.fromJson(json["urlImg"]),
        validDays: List<ValidDay>.from(
            json["valid_days"].map((x) => ValidDay.fromJson(x))),
        pizzas: List<Pizza>.from(json["pizzas"].map((x) => Pizza.fromJson(x))),
        bebidas:
            List<Bebida>.from(json["bebidas"].map((x) => Bebida.fromJson(x))),
        complementos: List<dynamic>.from(json["complementos"].map((x) => x)),
        id: json["_id"],
        modificar: json["modificar"],
        nombre: json["nombre"],
        precio: json["precio"].toDouble(),
        tipo: json["tipo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "urlImg": urlImg.toJson(),
        "valid_days": List<dynamic>.from(validDays.map((x) => x.toJson())),
        "pizzas": List<dynamic>.from(pizzas.map((x) => x.toJson())),
        "bebidas": List<dynamic>.from(bebidas.map((x) => x.toJson())),
        "complementos": List<dynamic>.from(complementos.map((x) => x)),
        "_id": id,
        "modificar": modificar,
        "nombre": nombre,
        "precio": precio,
        "tipo": tipo,
        "created_at": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Pizza {
  Pizza({
    this.urlImg,
    this.ingredientes,
    this.nombre,
    this.descripcion,
    this.limiteIngr,
    this.tamanos,
  });

  UrlImg urlImg;
  List<Bebida> ingredientes;
  Nombre nombre;
  Descripcion descripcion;
  int limiteIngr;
  List<Bebida> tamanos;

  factory Pizza.fromJson(Map<String, dynamic> json) => Pizza(
        urlImg: UrlImg.fromJson(json["urlImg"]),
        ingredientes: List<Bebida>.from(
            json["ingredientes"].map((x) => Bebida.fromJson(x))),
        nombre: nombreValues.map[json["nombre"]],
        descripcion: descripcionValues.map[json["descripcion"]],
        limiteIngr: json["limite_ingr"],
        tamanos:
            List<Bebida>.from(json["tamanos"].map((x) => Bebida.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "urlImg": urlImg.toJson(),
        "ingredientes": List<dynamic>.from(ingredientes.map((x) => x.toJson())),
        "nombre": nombreValues.reverse[nombre],
        "descripcion": descripcionValues.reverse[descripcion],
        "limite_ingr": limiteIngr,
        "tamanos": List<dynamic>.from(tamanos.map((x) => x.toJson())),
      };
}

enum Descripcion { DELICIOSA_PIZZA_AL_GUSTO, DELICIOSA_PIZZA_HAWAIANA }

final descripcionValues = EnumValues({
  "Deliciosa pizza Al Gusto ": Descripcion.DELICIOSA_PIZZA_AL_GUSTO,
  "Deliciosa pizza Hawaiana": Descripcion.DELICIOSA_PIZZA_HAWAIANA
});

enum Nombre { AL_GUSTO, HAWAIANA }

final nombreValues =
    EnumValues({"Al Gusto ": Nombre.AL_GUSTO, "Hawaiana": Nombre.HAWAIANA});

class ValidDay {
  ValidDay({
    this.status,
    this.dia,
  });

  bool status;
  String dia;

  factory ValidDay.fromJson(Map<String, dynamic> json) => ValidDay(
        status: json["status"],
        dia: json["dia"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "dia": dia,
      };
}

class PizzaElement {
  PizzaElement({
    this.urlImg,
    this.tamanos,
    this.ingredientes,
    this.id,
    this.limiteIngr,
    this.descripcion,
    this.nombre,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  UrlImg urlImg;
  List<Bebida> tamanos;
  List<Bebida> ingredientes;
  String id;
  int limiteIngr;
  String descripcion;
  String nombre;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory PizzaElement.fromJson(Map<String, dynamic> json) => PizzaElement(
        urlImg: UrlImg.fromJson(json["urlImg"]),
        tamanos:
            List<Bebida>.from(json["tamanos"].map((x) => Bebida.fromJson(x))),
        ingredientes: List<Bebida>.from(
            json["ingredientes"].map((x) => Bebida.fromJson(x))),
        id: json["_id"],
        limiteIngr: json["limite_ingr"],
        descripcion: json["descripcion"],
        nombre: json["nombre"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "urlImg": urlImg.toJson(),
        "tamanos": List<dynamic>.from(tamanos.map((x) => x.toJson())),
        "ingredientes": List<dynamic>.from(ingredientes.map((x) => x.toJson())),
        "_id": id,
        "limite_ingr": limiteIngr,
        "descripcion": descripcion,
        "nombre": nombre,
        "created_at": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
