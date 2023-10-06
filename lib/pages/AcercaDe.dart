import 'package:flutter/material.dart';

class AcercaDe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'DESARROLLADO POR:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20), // Separación entre la etiqueta y las personas
            _buildPersonInfo(
              imageAsset: 'img/alejandra.jpeg',
              name: 'Alejandra Jamileth Ortiz Sanchez',
            ),
            SizedBox(height: 20), // Margen entre las personas
            _buildPersonInfo(
              imageAsset: 'img/cecilia.jpeg',
              name: 'Cecilia del Carmen Otero Moralez',
            ),
            SizedBox(height: 20), // Margen entre las personas
            _buildPersonInfo(
              imageAsset: 'img/maria.jpeg',
              name: 'María José Reyes Henriquez',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonInfo({required String imageAsset, required String name}) {
    return Card(
      color: Colors.pink[50],
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
