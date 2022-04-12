import 'package:f1/models/driver.dart';
import 'package:f1/models/race.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DriverRaceInfo extends StatelessWidget {
  final Driver driver;
  final Race race;
  final int km;

  const DriverRaceInfo({Key? key,
    required this.driver,
    required this.race,
    required this.km}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Image.asset(
              'images/${driver.number}.png',
              height: 120.0,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              driver.name,
              style: kNameTextStyle,
            ),
            Text(driver.team),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              'Position at km $km',
              style: kLabelInfoTextStyle,
            ),
            Text(
              race.getPosition(driver.number, km).toString(),
              style: kNumberInfoTextStyle,
            ),
            const Divider(height: 10.0,
            thickness: 2,),
            const Text(
              'Tires',
              style: kLabelInfoTextStyle,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Image.asset(
              'images/${race.getTires(driver.number, km)}.png',
              height: 60.0,
            ),
            Text(race.getTires(driver.number, km).toString()),
          ],
        ),
        padding: const EdgeInsets.only(top: 3.0, left: 10.0, right: 10.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(10.0),
        ));
  }
}
