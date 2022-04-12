import 'package:f1/components/info_card.dart';
import 'package:f1/constants.dart';
import 'package:f1/models/selected_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DriverInfo extends StatelessWidget {
  const DriverInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedData>(
      builder: (context, selectedData, child) {
        return Container(
          color: Colors.black,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/${selectedData.selectedDriver1.number}.png',
                          height: 120.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          selectedData.selectedDriver1.name,
                          style: kTitleTextStyle,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'images/${selectedData.selectedDriver1.team}.png',
                          height: 20.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(selectedData.selectedDriver1.team),
                        const SizedBox(
                          height: 85.0,
                        ),
                        Text(selectedData.selectedDriver1.number.toString(),style: kNumberTextStyle,)
                      ],
                    )
                  ],
                ),
                Divider(
                  thickness: 3.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        InfoCard(
                            title: 'Standing',
                            description: selectedData.selectedDriver1.standing
                                .toString()),
                        InfoCard(
                            title: 'Points',
                            description:
                                selectedData.selectedDriver1.points.toString()),
                      ],
                    ),
                    Column(
                      children: [
                        InfoCard(
                            title: 'Podiums',
                            description: selectedData.selectedDriver1.podiums
                                .toString()),
                        InfoCard(
                            title: 'Fastest Laps',
                            description:
                            selectedData.selectedDriver1.fastestLaps.toString()),
                      ],
                    ),
                    Column(
                      children: [
                        InfoCard(
                            title: 'Country',
                            description: selectedData.selectedDriver1.country),
                        InfoCard(
                            title: 'Date of birth',
                            description:'${selectedData.selectedDriver1.birth.day}/'
                                '${selectedData.selectedDriver1.birth.month}/'
                                '${selectedData.selectedDriver1.birth.year}'
                            ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
