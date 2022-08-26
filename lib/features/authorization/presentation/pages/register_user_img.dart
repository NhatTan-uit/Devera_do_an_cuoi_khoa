import 'dart:io';

import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/register_user_completed.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/backward_FAB.dart';
import '../widgets/bio_item_container.dart';
import '../widgets/bio_title_container.dart';
import '../widgets/bio_img_picked.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/initial_screen.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/button_type_one.dart';

class RegisterUserImage extends StatefulWidget {
  final String userId;
  final String userEmail;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  const RegisterUserImage({
    Key? key,
    required this.userId,
    required this.userEmail,
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
                          onPress: toCompleteBio,
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

  void toCompleteBio() {
    if (pickedFile == null) {
      showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('Image has not been picked'),
              content: Text('If you dont pick a image, your profile image will be default user image'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (_) => RegisterUserBioCompletedScreen(
                              userId: widget.userId,
                              userEmail: widget.userEmail,
                              firstName: widget.firstName,
                              lastName: widget.lastName,
                              phoneNumber: widget.phoneNumber
                          )));
                    },
                    child: Text('Confirm')),
              ],
            );
          }
      );
    }
    else {
      Navigator.push(context, MaterialPageRoute(
          builder: (_) => RegisterUserBioCompletedScreen(
            userId: widget.userId,
            userEmail: widget.userEmail,
            firstName: widget.firstName,
            lastName: widget.lastName,
            phoneNumber: widget.phoneNumber,
            userImg: pickedFile,
          )));
    }
  }
}
