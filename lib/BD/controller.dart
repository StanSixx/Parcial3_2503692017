import 'package:cloud_firestore/cloud_firestore.dart';

//* Collection GENERAL
CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("clientes");

List listC = [];

//**** SELECT Clientes */
void getClientes() async {
  QuerySnapshot clientes = await collectionReference.get();
  if (clientes.docs.isNotEmpty) {
    listC.clear();
    for (var doc in clientes.docs) {
      listC.add("ID Clientes: " +
          doc.id +
          " | Nombre: " +
          doc["nombre"] +
          " " +
          doc["apellido"]);
    }
  }
}

//**** INSERT Clientes */
void setClientes(nombre, apellido, obs) async {
  if (nombre != "" && apellido != "" && obs != "") {
    return collectionReference
        //.doc(((clientes.docs.length) + 1).toString())
        .add({'nombre': nombre, 'apellido': apellido, 'observaciones': obs})
        .then((value) => print("Registro agregado"))
        .catchError((error) => print("Fallo en insertar registro"));
  } else {
    print("Falta registros");
  }
}

//**** DELETE */
void delClientes(idClie) async {
  return collectionReference
      .doc(idClie)
      .delete()
      .then((value) => print("Registro eliminado"))
      .catchError((error) => print("Fallo en eliminar registro"));
}

//**** UPDATE */
void updtClientes(idClie, nombre, apellido, obs) async {
  return collectionReference
      .doc(idClie)
      .update({'nombre': nombre, 'apellido': apellido, 'observaciones': obs})
      .then((value) => print("Registro actualizado"))
      .catchError((error) => print("Fallo en actualizar registro"));
}
