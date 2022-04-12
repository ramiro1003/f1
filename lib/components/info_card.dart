import 'package:f1/components/reusable_card.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String description;

  const InfoCard({Key? key, 
    required this.title, 
    required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
        color: Colors.black54, 
        cardChild: Column(
          children: [
            Text(title),
            SizedBox(
              height: 10.0,
            ),
            Text(description)
          ],
        )
    );
  }
}
