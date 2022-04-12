import 'package:f1/models/circuit.dart';
import 'package:f1/models/driver.dart';
import 'package:f1/models/performance.dart';

import 'driver.dart';

class Race{
  String name;
  List<Driver> drivers;
  Circuit circuit;
  Map<int, List<Performance>> performance;

  Race({
    required this.name,
    required this.drivers,
    required this.circuit,
    required this.performance
});

  int getPosition(int driver, int km){

    List<Performance>? lp = performance[driver];

    int currentPos = 0;

    for (int i = 0; i < lp!.length; i++){
      Performance p = lp[i];
      if(km >= p.km) currentPos = p.position;
    }
    return currentPos;
  }

  getTires(int driver, int km) {
    List<Performance>? lp = performance[driver];

    String currentTir = '';

    for (int i = 0; i < lp!.length; i++){
      Performance p = lp[i];
      if(km >= p.km) currentTir = p.tires;
    }
    return currentTir;
  }

}