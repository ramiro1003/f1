import 'package:f1/components/driver_race_info.dart';
import 'package:f1/components/reusable_card.dart';
import 'package:f1/constants.dart';
import 'package:f1/models/selected_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'driver_info_screen.dart';

class FacadeFaceoffScreen extends StatelessWidget {
  const FacadeFaceoffScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class FaceoffScreen extends StatefulWidget {
  static String id = 'faceoff_screen';

  const FaceoffScreen(
      {Key? key,}) : super(key: key);

  @override
  _FaceoffScreenState createState() => _FaceoffScreenState();
}

class _FaceoffScreenState extends State<FaceoffScreen> {
  int km = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedData>(
      builder: (context, selectedData, child){
        km = selectedData.selectedRace.circuit.distance.round() - 1;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Formula 1 Face-off'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: ReusableCard(
                    color: kCardColor,
                    cardChild: Column(
                      children: [
                        Text(selectedData.selectedRace.name, style: kTitleTextStyle,),
                        Text(selectedData.selectedRace.circuit.name),
                        Image.asset(
                          'images/${selectedData.selectedRace.name}.png',
                          height: 180.0,
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: const Color(0xFF8D8E98),
                              thumbColor: kF1OfficialColor,
                              activeTrackColor: Colors.white,
                              overlayColor: const Color(0x15EB1555),
                              thumbShape:const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0,
                              ),
                              overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 30.0)),
                          child: Slider(
                              value: km.toDouble(),
                              min: 0.0,
                              max: selectedData.selectedRace.circuit.distance,
                              onChanged: (double h) {
                                setState(() {
                                  if(h.round() < selectedData.selectedRace.circuit.distance.round()){
                                    km = h.round();
                                  }
                                });
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              km.toString(),
                              style: kNumberTextStyle,
                            ),
                            const Text(
                              ' km',
                              style: kLabelTextStyle,
                            ),
                            const SizedBox(
                              width: 100.0,
                            ),
                            const Text(
                              'Lap ',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              (km / selectedData.selectedRace.circuit.lenght).round().toString(),
                              style: kNumberTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              Expanded(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) => SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom),
                              child: DriverInfo(),
                            ),
                          ),
                        );
                      },
                      child: DriverRaceInfo(driver: selectedData.selectedDriver1, race: selectedData.selectedRace, km: km),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: DriverRaceInfo(driver: selectedData.selectedDriver2, race: selectedData.selectedRace, km: km),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
