import 'package:f1/models/circuit.dart';

class CircuitService {

  List<Circuit> circuits = [
    Circuit(name: 'Jeddah Corniche Circuit', lenght: 6.174, laps: 50, distance: 308.45),
    Circuit(name: 'Sochi Autodrom', lenght: 5.848, laps: 53, distance: 309.745),
  ];

  List<Circuit> getCircuits(){
    return circuits;
  }

   Circuit getCircuit(String name){
     for(Circuit c in circuits){
       if(c.name == name) return c;
     }
     return Circuit(name: '', lenght: 0, laps: 0, distance: 0);
   }
}