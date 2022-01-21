// To parse this JSON data, do
//
//     final UserModels = UserModelsFromJson(jsonString);

import 'dart:convert';

List<UserModels> UserModelsFromJson(String str) =>
    List<UserModels>.from(json.decode(str).map((x) => UserModels.fromJson(x)));

String UserModelsToJson(List<UserModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModels {
  UserModels({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        username: json["username"] ?? null,
        email: json["email"] ?? null,
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        phone: json["phone"] ?? null,
        website: json["website"] ?? null,
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name ?? null,
        "username": username ?? null,
        "email": email ?? null,
        "address": address == null ? null : address!.toJson(),
        "phone": phone ?? null,
        "website": website ?? null,
        "company": company == null ? null : company!.toJson(),
      };
}

class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"] ?? null,
        suite: json["suite"] ?? null,
        city: json["city"] ?? null,
        zipcode: json["zipcode"] ?? null,
        geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street ?? null,
        "suite": suite ?? null,
        "city": city ?? null,
        "zipcode": zipcode ?? null,
        "geo": geo == null ? null : geo!.toJson(),
      };
}

class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  String? lat;
  String? lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"] ?? null,
        lng: json["lng"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "lat": lat ?? null,
        "lng": lng ?? null,
      };
}

class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  String? name;
  String? catchPhrase;
  String? bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"] ?? null,
        catchPhrase: json["catchPhrase"] ?? null,
        bs: json["bs"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? null,
        "catchPhrase": catchPhrase ?? null,
        "bs": bs ?? null,
      };
}
