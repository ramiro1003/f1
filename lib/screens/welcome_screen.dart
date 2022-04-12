import 'package:f1/components/reusable_card.dart';
import 'package:f1/constants.dart';
import 'package:f1/models/driver.dart';
import 'package:f1/models/race.dart';
import 'package:f1/models/selected_data.dart';
import 'package:f1/screens/faceoff_screen.dart';
import 'package:f1/services/driver_service.dart';
import 'package:f1/services/race_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Driver> drivers = [];
  List<Race> races = [];
  late Driver selected_driver1;
  late Driver selected_driver2;
  late Race selectedRace;


  @override
  void initState() {
    drivers = DriverService().getDrivers();
    races = RaceService().races;
    try{
      selected_driver1 = drivers.first;
      selected_driver2 = drivers[1];
      selectedRace = races.first;
    } on Exception {
      throw Exception('Error receiving data');
    }
    super.initState();

    Future.delayed(Duration.zero, () async {
      context.read<SelectedData>().selectRace(races.first);
      context.read<SelectedData>().selectDriver1(selected_driver1);
      context.read<SelectedData>().selectDriver2(selected_driver2);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formula 1 Face-off'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kCardColor,
                    cardChild: Column(children: [
                      const Text('Choose driver 1:', style: kNumberInfoTextStyle,),
                      const SizedBox(
                        height: 10.0,
                      ),
                      DropdownButton<Driver>(
                        items: drivers
                            .where(
                                (Driver driver) => driver != selected_driver2)
                            .map((Driver driver) {
                          return DropdownMenuItem<Driver>(
                            child: Text(driver.name),
                            value: driver,
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState((){
                            context.read<SelectedData>().selectDriver1(newVal!);
                            selected_driver1 = newVal;});
                        },
                        value: selected_driver1,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Image.asset(
                        'images/${selected_driver1.number}.png',
                        height: 150.0,
                      )
                    ]),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kCardColor,
                    cardChild: Column(children: [
                      const Text('Choose driver 2:', style: kNumberInfoTextStyle,),
                      const SizedBox(
                        height: 10.0,
                      ),
                      DropdownButton<Driver>(
                        items: drivers
                            .where(
                                (Driver driver) => driver != selected_driver1)
                            .map((Driver driver) {
                          return DropdownMenuItem<Driver>(
                            child: Text(driver.name),
                            value: driver,
                          );
                        }).toList(),
                        onChanged: (newVal) {

                          setState((){
                            context.read<SelectedData>().selectDriver2(newVal!);
                            selected_driver2 = newVal;
                          });
                        },
                        value: selected_driver2,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Image.asset(
                        'images/${selected_driver2.number}.png',
                        height: 150.0,
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  color: kCardColor,
                  cardChild: Column(children: [
                    const Text('Choose a race:', style: kNumberInfoTextStyle,),
                    DropdownButton<Race>(
                      items: races.map((Race race) {
                        return DropdownMenuItem<Race>(
                          child: Text(race.name),
                          value: race,
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState((){
                          context.read<SelectedData>().selectRace(newVal!);
                          selectedRace = newVal;});
                      },
                      value: selectedRace,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Image.asset(
                      'images/${selectedRace.name}.png',
                      height: 190.0,
                    ),
                  ]),
                ),
              ),
            ],
          )),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    print(context.read<SelectedData>().selectedDriver1.name);
                    print(context.read<SelectedData>().selectedDriver2.name);
                    print(context.read<SelectedData>().selectedRace.name);
                    return FaceoffScreen();}));
            },
            child: Container(
              child: const Center(
                  child: Text(
                'FACE-OFF',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              )),
              color: kF1OfficialColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              padding: const EdgeInsets.only(bottom: 15.0),
            ),
          ),
        ],
      ),
    );
  }
}
