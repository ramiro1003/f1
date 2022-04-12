import 'dart:core';

import 'package:f1/models/driver.dart';
import 'package:f1/models/performance.dart';
import 'package:f1/models/race.dart';
import 'package:f1/services/circuit_service.dart';
import 'package:f1/services/driver_service.dart';

class RaceService{

  var drivers;

  var ham_russia;

  var ver_russia;

  var nor_russia;

  var perf;

  var races;

  RaceService() {
    drivers = DriverService().getDrivers();
    ham_russia = [
      Performance(km: 0, position: 2, tires: 'Soft'),
      Performance(km: 156, position: 6, tires: 'Medium'),
      Performance(km: 230, position: 3, tires: 'Hard'),
      Performance(km: 270, position: 2, tires: 'Hard'),
      Performance(km: 300, position: 1, tires: 'Wet'),
    ];
    ver_russia = [
      Performance(km: 0, position: 3, tires: 'Hard'),
    ];
    nor_russia = [
      Performance(km: 0, position: 1, tires: 'Soft'),
      Performance(km: 300, position: 6, tires: 'Hard')
    ];

    perf = <int, List<Performance>>{
      33: ver_russia,
      44: ham_russia,
      4: nor_russia,
    };

    races = [
      Race(name: 'Russia 2021',
          drivers: DriverService().getDrivers(),
          circuit: CircuitService().getCircuit('Sochi Autodrom'),
          performance: perf)
    ];
  }








}