import 'package:flutter/material.dart';

class BioImagePickedWidget extends StatelessWidget {
  final Image image;
  final VoidCallback? onTap;

  const BioImagePickedWidget({Key? key, required this.image, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: image,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: GestureDetector(
              onTap: onTap,
              child: Icon(Icons.cancel, color: Colors.white70, size: 40.0,),
            ),
          ),
        ],
      )
    );
  }
}
