import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../widgets/backward_FAB.dart';
import '../widgets/bio_item_container.dart';
import '../widgets/bio_title_container.dart';
import '../widgets/bio_img_picked.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/initial_screen.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/button_type_one.dart';

class RegisterUserImage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String phoneNumber;

  const RegisterUserImage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber
  }) : super(key: key);

  @override
  State<RegisterUserImage> createState() => _RegisterUserImageState();
}

class _RegisterUserImageState extends State<RegisterUserImage> {
  PlatformFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: BackwardButton(
        icon: new Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.orange,
        ),
        onPress: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Initial_Screen(
            widget: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100.0,
                  ),
                  BioTitleContainer(
                    bioTitle: "Upload Your Photo Profile",
                    bioSubTitle: "This data will be display in your account profile for security",
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  pickedFile == null? Column(
                    children: [
                      BioItemContainer(
                          onTap: selectFile,
                          widget: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.photo_camera_back, color: Theme.of(context).primaryColor, size: 60.0,),
                                Text('From Gallery', style: Theme.of(context).textTheme.subtitle1,)
                              ],
                            ),
                          )
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      BioItemContainer(
                          widget: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.camera_alt_outlined, color: Theme.of(context).primaryColor, size: 50.0,),
                                Text('Take Photo', style: Theme.of(context).textTheme.subtitle1,)
                              ],
                            ),
                          )
                      ),
                    ],
                  ) : BioImagePickedWidget(
                      onTap: cancelPicker,
                      image: Image.file(
                        File(pickedFile!.path!),
                        fit: BoxFit.cover,
                      )
                  ),
                  Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ButtonTypeOne(
                          inputText: 'Next',
                          buttonMarginValue: EdgeInsets.fromLTRB(80, 20, 80, 20),
                          onPress: () {},
                        ),
                      )
                  ),
                ],
              ),
            )
        ),),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  void cancelPicker() {
    setState(() {
      pickedFile = null;
    });
  }
}
