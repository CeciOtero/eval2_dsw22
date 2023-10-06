import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registro extends StatelessWidget {
  final BuildContext context;

  Registro({required this.context});
  

  Future<void> agregarProducto(
      String idproducto, String nombre, String precio, String stock) async {
    if (idproducto.isNotEmpty && nombre.isNotEmpty && precio.isNotEmpty && stock.isNotEmpty) {
      await FirebaseFirestore.instance.collection('tb_productos').add({
        "idproducto": idproducto,
        "nombre": nombre,
        "precio": precio,
        "stock": stock
      });
