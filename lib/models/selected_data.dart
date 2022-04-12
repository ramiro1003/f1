import 'package:f1/models/driver.dart';
import 'package:f1/models/race.dart';
import 'package:flutter/foundation.dart';

class SelectedData extends ChangeNotifier{
  late Driver selectedDriver1;
  late Driver selectedDriver2;
  late Race selectedRace;

  selectDriver1(Driver driver1){
    selectedDriver1 = driver1;
    notifyListeners();
  }

  selectDriver2(Driver driver2){
    selectedDriver2 = driver2;
    notifyListeners();
  }

  selectRace(Race race){
    selectedRace = race;
    notifyListeners();
  }
}