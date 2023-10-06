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

      // Mostrar un SnackBar con el mensaje de registro exitoso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('¡Producto registrado!'),
        ),
      );

      // Limpia los controladores después de registrar el producto
      IdController.clear();
      NombreController.clear();
      PrecioController.clear();
      StockController.clear();
    } else {
      // Mostrar un SnackBar con un mensaje de error si algún campo está vacío
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, complete todos los campos.'),
        ),
      );
    }
  }

  TextEditingController IdController = TextEditingController();
  TextEditingController NombreController = TextEditingController();
  TextEditingController PrecioController = TextEditingController();
  TextEditingController StockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Text(
                'Registrar productos',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: IdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white, // Color de fondo del TextField
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'img/id.png',
                      width: 24, // Ajusta el ancho del icono
                      height: 24, // Ajusta la altura del icono
                    ),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'ID',
                  hintText: 'Ingrese el ID del producto',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink[200]!), // Borde cuando está enfocado
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink[50]!), // Borde cuando no está enfocado
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              TextField(
                controller: NombreController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white, // Color de fondo del TextField
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'img/nombre.png',
                      width: 24, // Ajusta el ancho del icono
                      height: 24, // Ajusta la altura del icono
                    ),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Nombre',
                  hintText: 'Ingrese el nombre del producto',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink[200]!), // Borde cuando está enfocado
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink[50]!), // Borde cuando no está enfocado
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: PrecioController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white, // Color de fondo del TextField
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'img/precio.png',
                      width: 24, // Ajusta el ancho del icono
                      height: 24, // Ajusta la altura del icono
                    ),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Precio',
                  hintText: 'Ingrese el precio del producto',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink[200]!), // Borde cuando está enfocado
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink[50]!), // Borde cuando no está enfocado
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: StockController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white, // Color de fondo del TextField
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'img/stock.png',
                      width: 24, // Ajusta el ancho del icono
                      height: 24, // Ajusta la altura del icono
                    ),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: 'Stock',
                  hintText: 'Ingrese el stock del producto',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink[200]!), // Borde cuando está enfocado
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink[50]!), // Borde cuando no está enfocado
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  await agregarProducto(IdController.text, NombreController.text,
                          PrecioController.text, StockController.text);
                },
                child: const Text('Agregar', style: TextStyle(fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
