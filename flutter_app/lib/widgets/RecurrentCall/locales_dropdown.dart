import 'package:flutter/material.dart';

class LocaleData {
  String locale;
  String latitude;
  String longitude;

  LocaleData(
      {required this.locale, required this.latitude, required this.longitude});
}

List<LocaleData> locales = [
  LocaleData(
      locale: 'Instituto de Computação',
      latitude: '-22.90653495',
      longitude: '-43.133121874276625'),
  LocaleData(
      locale: 'Instituto de Geociências (Bloco P)',
      latitude: '-22.80653495',
      longitude: '-43.233121874276625'),
  LocaleData(
      locale: 'Instituto de Geociências (Bloco O)',
      latitude: '-22.80653495',
      longitude: '-43.233121874276625'),
  LocaleData(
      locale: 'Instituto de Física',
      latitude: '-22.80653495',
      longitude: '-43.233121874276625'),
  LocaleData(
      locale: 'Escola de Engenharia',
      latitude: '-22.80653495',
      longitude: '-43.233121874276625'),
  LocaleData(
      locale: 'Escola de Arquitetura e Urbanismo',
      latitude: '-22.80653495',
      longitude: '-43.233121874276625'),
];

Widget localesDropdown(LocaleData localeData, dynamic updateCoordinates) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: DropdownButton<String>(
      value: localeData.locale,
      onChanged: (String? value) {
        updateCoordinates(
            locales.where((element) => element.locale == value).first);
      },
      items: locales.map<DropdownMenuItem<String>>((LocaleData locales) {
        return DropdownMenuItem<String>(
            value: locales.locale,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(locales.locale),
            ));
      }).toList(),
    ),
  );
}
