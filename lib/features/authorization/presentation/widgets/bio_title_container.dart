import 'package:flutter/material.dart';

class BioTitleContainer extends StatelessWidget {
  final String bioTitle;
  final String bioSubTitle;
  const BioTitleContainer({Key? key, required this.bioTitle, required this.bioSubTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: MediaQuery.of(context).size.width*7/10,
        child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Text(
                  bioTitle,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  bioSubTitle,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            )
        ),
      ),
    );
  }
}
