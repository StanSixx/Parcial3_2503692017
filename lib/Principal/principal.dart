import 'package:flutter/material.dart';
import 'package:parcial3/BD/controller.dart';

class ClieOpc extends StatelessWidget {
  const ClieOpc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          btnInsert(context),
          const SizedBox(
            height: 10,
          ),
          btnListar(context),
          const SizedBox(
            height: 10,
          ),
          btnActualizar(context),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}

class ClieInsert extends StatelessWidget {
  ClieInsert({Key? key}) : super(key: key);
  final TextEditingController _nomb = TextEditingController();
  final TextEditingController _apell = TextEditingController();
  final TextEditingController _observ = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente'),
      ),
      body: ListView(
        children: [
          TextField(
            controller: _nomb,
            decoration: const InputDecoration(
                hintText: "Tu Nombre",
                labelText: "Nombre",
                labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _apell,
            decoration: const InputDecoration(
                hintText: "Tu Apellido",
                labelText: "Apellido",
                labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _observ,
            decoration: const InputDecoration(
                labelText: "Observaciones",
                labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
            keyboardType: TextInputType.multiline,
            minLines: 2,
            maxLines: 3,
          ),
          const SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text("Guardar"),
            onPressed: () {
              setClientes(_nomb.text, _apell.text, _observ.text);
              getClientes();
            },
          ),
        ],
      ),
    );
  }
}

class ClieList extends StatelessWidget {
  final TextEditingController _idClie = TextEditingController();
  int tamanio = listC.length;

  ClieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
      ),
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _idClie,
            decoration: const InputDecoration(
                labelText: "ID Cliente",
                labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: const Text("Eliminar"),
            onPressed: () {
              delClientes(_idClie.text);
              getClientes();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          for (var i = 0; i < listC.length; i++)
            Card(
              child: ListTile(
                title: Text(
                  listC[i],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.green,
            ),
        ],
      ),
    );
  }
}

class ClieActu extends StatelessWidget {
  ClieActu({Key? key}) : super(key: key);
  final TextEditingController _idClie = TextEditingController();
  final TextEditingController _nomb = TextEditingController();
  final TextEditingController _apell = TextEditingController();
  final TextEditingController _observ = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente'),
      ),
      body: ListView(
        children: [
          TextField(
            controller: _idClie,
            decoration: const InputDecoration(
                hintText: "Tu ID",
                labelText: "ID Clie",
                labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _nomb,
            decoration: const InputDecoration(
                hintText: "Tu Nombre",
                labelText: "Nombre",
                labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _apell,
            decoration: const InputDecoration(
                hintText: "Tu Apellido",
                labelText: "Apellido",
                labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _observ,
            decoration: const InputDecoration(
                labelText: "Observaciones",
                labelStyle: TextStyle(fontSize: 15, color: Colors.black)),
            keyboardType: TextInputType.multiline,
            minLines: 2,
            maxLines: 3,
          ),
          const SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text("Actualizar"),
            onPressed: () {
              updtClientes(_idClie.text, _nomb.text, _apell.text, _observ.text);
              getClientes();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          for (var i = 0; i < listC.length; i++)
            Card(
              child: ListTile(
                title: Text(
                  listC[i],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.green,
            ),
        ],
      ),
    );
  }
}

Widget btnInsert(contexto) {
  return MaterialButton(
      height: 40.0,
      minWidth: 200.0,
      color: Colors.greenAccent,
      onPressed: () {
        Navigator.of(contexto)
            .push(MaterialPageRoute(builder: (context) => ClieInsert()));
        //getClientes();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: const Text(
        "Insertar",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ));
}

Widget btnListar(contexto) {
  return MaterialButton(
      height: 40.0,
      minWidth: 200.0,
      color: Colors.greenAccent,
      onPressed: () {
        Navigator.of(contexto)
            .push(MaterialPageRoute(builder: (context) => ClieList()));
        //getClientes();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: const Text(
        "Listar y eliminar",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ));
}

Widget btnActualizar(contexto) {
  return MaterialButton(
      height: 40.0,
      minWidth: 200.0,
      color: Colors.greenAccent,
      onPressed: () {
        Navigator.of(contexto)
            .push(MaterialPageRoute(builder: (context) => ClieActu()));
        //getClientes();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: const Text(
        "Listar y actualizar",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ));
}
/* 
class Mesero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesero'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

class Mesa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mesa'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

class Platillo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Platillo'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

class Bebida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bebida'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {},
        ),
      ),
    );
  }
}
 */