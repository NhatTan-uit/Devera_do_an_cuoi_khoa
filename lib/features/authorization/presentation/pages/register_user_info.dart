import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/register_user_img.dart';
import 'package:flutter/material.dart';
import '../widgets/backward_FAB.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/initial_screen.dart';
import '../widgets/bio_title_container.dart';
import '../widgets/text_form_field_widget.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/button_type_one.dart';

class RegisterUserInfo extends StatefulWidget {
  final String userId;
  final String userEmail;
  const RegisterUserInfo({Key? key, required this.userEmail, required this.userId}) : super(key: key);

  @override
  State<RegisterUserInfo> createState() => _RegisterUserInfoState();
}

class _RegisterUserInfoState extends State<RegisterUserInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100.0,
                    ),
                    BioTitleContainer(
                      bioTitle: "Fill in your bio to get started ",
                      bioSubTitle: "This data will be display in your account profile for security",
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormFieldWidget(
                      isEmailValidation: false,
                      isObscured: false,
                      name: "first name...",
                      controller: _firstNameController,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormFieldWidget(
                      isEmailValidation: false,
                      isObscured: false,
                      name: "last name...",
                      controller: _lastNameController,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormFieldWidget(
                      textInputType: TextInputType.number,
                      isEmailValidation: false,
                      isObscured: false,
                      name: "phone number...",
                      controller: _phoneNumberController,
                    ),
                    Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ButtonTypeOne(
                            inputText: 'Next',
                            buttonMarginValue: EdgeInsets.fromLTRB(80, 20, 80, 20),
                            onPress: toGetUserImg,
                          ),
                        )
                    ),
                  ],
                ),
              )
            )
        ),),
    );
  }

  void toGetUserImg() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      );
      await Future.delayed(const Duration(seconds: 1), (){});

      Navigator.pop(context);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => RegisterUserImage(
                  userId: widget.userId,
                  userEmail: widget.userEmail,
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  phoneNumber: _phoneNumberController.text
              )));
    }
  }
}

