import 'dart:io';

void main(List<String> arguments) {
  //print('Hello world: ${actividad5_2.calculate()}!');
    Map <String?, double?> menu = {
    "pasta": 3.00,
    "pizza": 4.99,
  };
  opcionesMenu(menu);
}

void opcionesMenu(Map menu){
  print("****Opciones****\n1: Mostrar Menu\n2: Agregar platillo \n3: Editar platillo\n4: Buscar un platillo\n5: Salir\n");
  print("Ingresa una opcion: ");
  int opcion = int.parse(stdin.readLineSync()!);

  switch(opcion){
    case 1:
    print("\n***Menu****");
    mostrarPlatillos(menu);
    opcionesMenu(menu);
    case 2:
    agregarPlatillo(menu);
    case 3:
    editarPlatillo(menu);
    case 4:
    buscarPlatillo(menu);
    case 5:
    print("Adios");
    break;
  }
}

void mostrarPlatillos(Map menu) {
  for (var MapEntry(key: platillo, value: precio) in menu.entries) {
  print('$platillo - €$precio');
  }
}

void agregarPlatillo(Map menu) {
  try{
    print("Ingresa el nombre del nuevo platillo:");
    String? platillo = stdin.readLineSync();
    print("Ingresa el precio del platillo:");
    double? precio = double.parse(stdin.readLineSync()!);
    if (menu.containsKey(platillo)) {
      print("Este platillo ya existe en el menu");
      print("Desea editar su precio? SI/NO");
      String? respuesta = stdin.readLineSync();
      if (respuesta != null) {
        respuesta = respuesta.toUpperCase();
        if (respuesta == "SI") {
        editarPlatillo(menu);
        }else{
          print("Redirigiendo al menu principal");
          opcionesMenu(menu);
        }
      }
    }else{
        menu[platillo] = precio;
        print("Platillo agregado");
        mostrarPlatillos(menu);
        print("Desea agregar otro platillo? SI/NO");
        String? respuesta = stdin.readLineSync();
        if (respuesta != null) {
          respuesta = respuesta.toUpperCase();
        if (respuesta == "SI") {
          agregarPlatillo(menu);
          } else{
            print("Redirigiendo al menu principal");
            opcionesMenu(menu);
          }
        }
    }
  }catch(e){
    print("!!! ERROR AL AGREGAR PLATILLO !!!");
    opcionesMenu(menu);
  }
}

void editarPlatillo(Map menu) {
  try{
    print("****Menu****");
    mostrarPlatillos(menu);
    print("Ingresa el nombre del platillo que deseas editar:");
    String? platillo = stdin.readLineSync();
    if (menu.containsKey(platillo)) {
      print("Ingresa el nuevo precio del platillo:");
      double? precio = double.parse(stdin.readLineSync()!);
      menu[platillo] = precio;
      print("Platillo editado");
      mostrarPlatillos(menu);
      print("Desea modificar otro platillo? SI/NO");
      String? respuesta = stdin.readLineSync();
      if (respuesta != null) {
        respuesta = respuesta.toUpperCase();
        if (respuesta == "SI") {
          editarPlatillo(menu);
        }else{
          print("Redirigiendo al menu principal");
          opcionesMenu(menu);
        }
      }
    }else {
        print("!!! PLATILLO NO ENCONTRADO !!!");
        opcionesMenu(menu);
      }
      }catch(e){
        print("!!! ERROR AL EDITAR EL PLATILLO !!!");
        opcionesMenu(menu);
      }
}

void buscarPlatillo(Map menu) {
  try{
    print("Ingresa el platillo a buscar:");
    String? platillo = stdin.readLineSync();
    if (menu.containsKey(platillo)) {
      print("Platillo econtrado");
      print("$platillo - €${menu[platillo]}");
      print("Desea buscar otro platillo? SI/NO");
      String? respuesta = stdin.readLineSync();
      if (respuesta != null) {
        respuesta = respuesta.toUpperCase();
        if (respuesta == "SI") {
          buscarPlatillo(menu);
          }else{
          print("Redirigiendo al menu principal");
          opcionesMenu(menu);
          }
      }
    }else{
        print("!!! PLATILLO NO ENCONTRADO !!!");
        print("Redirigiendo al menu principal");
        opcionesMenu(menu);
      }
  }catch (e){
    print("!!! ERROR AL BUSCAR PLATILLO !!!");
    opcionesMenu(menu);
  }
}