import 'package:flutter/material.dart';

class StepGetEmailPassword extends StatefulWidget {
  final LabeledGlobalKey<FormState> emailPasswordFormKey;
  final Function updateSignUpDetails;

  final Function registrationDetails;
  final Function proceedToNextStep;
  const StepGetEmailPassword(
      {Key? key,
      required this.updateSignUpDetails,
      required this.registrationDetails,
      required this.emailPasswordFormKey,
      required this.proceedToNextStep})
      : super(key: key);

  @override
  _StepGetEmailPasswordState createState() => _StepGetEmailPasswordState();
}

class _StepGetEmailPasswordState extends State<StepGetEmailPassword> {
  String new_password = "";
  String confirm_password = "";
  String new_passwordErrorMessage = "";
  String confirm_passwordErrorMessage = "";
  @override
  void initState() {
    super.initState();
    Map<String, String> signUpDetails = widget.registrationDetails();
    if (mounted) {
      setState(() {
        new_password = signUpDetails['new_password']!;
        confirm_password = signUpDetails['confirm_password']!;
      });
    }
  }

  @override
  void dispose() {
    // widget.emailPasswordFormKey.currentState?.validate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.emailPasswordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: TextFormField(
                initialValue: new_password,
                validator: _validateNewPassword,
                autofocus: mounted,
                autocorrect: false,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "new_password",
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFF929BAB)),
                ),
                style: TextStyle(fontSize: 16, color: Color(0xFF929BAB)),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: Color(0xFFF5F7FA)),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 6.18,
                        spreadRadius: 0.618,
                        offset: Offset(-4, -4),
                        color: Colors.white38),
                    BoxShadow(
                        blurRadius: 6.18,
                        spreadRadius: 0.618,
                        offset: Offset(4, 4),
                        color: Colors.blueGrey.shade100)
                  ]),
            ),
            if (new_passwordErrorMessage != '')
              Container(
                child: Text(
                  "\t\t\t\t$new_passwordErrorMessage",
                  style: TextStyle(fontSize: 10, color: Colors.red),
                ),
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(2),
                width: double.infinity,
              ),
            // NEW PASSWORD CODE END HERE

            Container(
              width: double.infinity,
              child: TextFormField(
                initialValue: confirm_password,
                validator: _validateConfirmpassword,
                autofocus: mounted,
                autocorrect: false,
                obscureText: true,
                enableSuggestions: false,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => widget.proceedToNextStep(),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "confirm_password",
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFF929BAB)),
                ),
              ),
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: const Color(0xFFF5F7FA)),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    const BoxShadow(
                        blurRadius: 6.18,
                        spreadRadius: 0.618,
                        offset: Offset(-4, -4),
                        color: Colors.white38),
                    BoxShadow(
                        blurRadius: 6.18,
                        spreadRadius: 0.618,
                        offset: const Offset(4, 4),
                        color: Colors.blueGrey.shade100)
                  ]),
            ),
            if (confirm_passwordErrorMessage != '')
              Container(
                child: Text(
                  "\t\t\t\t$confirm_passwordErrorMessage",
                  style: const TextStyle(fontSize: 10, color: Colors.red),
                ),
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
              ),
          ],
        ));
  }

  void errorMessageSetter(String fieldName, String message) {
    setState(() {
      switch (fieldName) {
        case 'NEW-PASSWORD':
          new_passwordErrorMessage = message;
          break;

        case 'CONFIRM-PASSWORD':
          confirm_passwordErrorMessage = message;
          break;
      }
    });
  }

  String? _validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      errorMessageSetter('NEW-PASSWORD', 'password cannot be empty');
    } else {
      errorMessageSetter('NEW-PASSWORD', "");

      widget.updateSignUpDetails('new_password', value);
    }
    return null;
  }

  String? _validateConfirmpassword(String? value) {
    if (value == null || value.isEmpty) {
      errorMessageSetter(
          'CONFIRM-PASSWORD', 'you must provide a valid confirm-password');
    } else {
      errorMessageSetter('CONFIRM-PASSWORD', "");
      widget.updateSignUpDetails('confirm_password', value);
    }

    return null;
  }
}
