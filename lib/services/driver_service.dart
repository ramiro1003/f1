import 'package:f1/models/driver.dart';

class DriverService {

  List<Driver> getDrivers(){
    return [
      Driver(number: 33, name: 'Max Verstappen', position: 1, team: 'Red Bull Racing',
      country: 'Netherlands', points: 395.5, podiums: 18, standing: 1, fastestLaps: 4,
      birth: DateTime(1997, 9, 30)),
      Driver(number: 44, name: 'Lewis Hamilton',  position: 2, team: 'Mercedes',
          country: 'England', points: 387.5, podiums: 17, standing: 2, fastestLaps: 3,
          birth: DateTime(1985, 1, 7)),
      Driver(number: 4, name: 'Lando Norris', position: 6, team: 'McLaren',
          country: 'England', points: 160, podiums: 4, standing: 6, fastestLaps: 0,
          birth: DateTime(1999, 11, 13))
    ];
  }
}