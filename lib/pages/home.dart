import 'package:flutter/material.dart';
import 'package:eval2_dsw22/pages/Consulta.dart';
import 'package:eval2_dsw22/pages/AcercaDe.dart';
import 'package:eval2_dsw22/pages/Registrar.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => homeState();
}

class homeState extends State<home> {
  int ItemDrawer = 0;

  _getDrawerItem(int position) {
    switch (position) {
      case 0:
        return AcercaDe();
      case 1:
        return Registro(context: context);
      case 2:
        return Consulta();
    }
  }

  void _onSelectItemDrawer(int pos) {
    Navigator.pop(context);
    setState(() {
      ItemDrawer = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: const Text('EVALUACIÓN 2', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[100],
              ),
              child: const Center(
                child: Text('MENÚ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    )),
              ),
            ),
            Divider(color: Colors.black),
            ListTile(
              leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('img/acercaDe.png',
                    width: 35,
                    height: 35,),
                  ),
              title: const Text('ACERCA DE NOSOTRAS',
              style: TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                _onSelectItemDrawer(0);
              },
            ),
            ListTile(
                leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('img/registrar.png',
                    width: 35,
                    height: 35,),
                  ),
                title: const Text('REGISTRAR PRODUCTOS',
              style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _onSelectItemDrawer(1);
                }),
            ListTile(
                leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('img/consultar.png',
                    width: 35,
                    height: 35,),
                  ),
                title: const Text('CONSULTAR PRODUCTOS',
              style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  _onSelectItemDrawer(2);
                }),
            Divider(color: Colors.black),
          ],
        ),
      ),
      body: _getDrawerItem(ItemDrawer),
    );
  }
}
