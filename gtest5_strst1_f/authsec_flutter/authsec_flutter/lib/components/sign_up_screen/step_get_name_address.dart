import 'package:flutter/material.dart';

class StepGetNameAddress extends StatefulWidget {
  final LabeledGlobalKey<FormState> nameAddressFormKey;
  final Function updateSignUpDetails;

  final Function registrationDetails;
  final Function proceedToNextStep;
  const StepGetNameAddress(
      {Key? key,
      required this.updateSignUpDetails,
      required this.nameAddressFormKey,
      required this.registrationDetails,
      required this.proceedToNextStep})
      : super(key: key);

  @override
  _StepGetNameAddressState createState() => _StepGetNameAddressState();
}

class _StepGetNameAddressState extends State<StepGetNameAddress> {
  String first_name = "";
  String first_nameErrorMessage = "";
  String last_name = "";
  String last_nameErrorMessage = "";
  String mob_no = "";
  String mob_noErrorMessage = "";

  @override
  void initState() {
    super.initState();
    Map<String, String> signUpDetails = widget.registrationDetails();
    if (mounted) {
      setState(() {
        first_name = signUpDetails['first_name']!;
        last_name = signUpDetails['last_name']!;
        mob_no = signUpDetails['mob_no']!;
      });
    }
  }

  @override
  void dispose() {
    // widget.nameAddressFormKey.currentState?.validate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.nameAddressFormKey,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: TextFormField(
                initialValue: first_name,
                validator: _validatefirstName,
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
                  hintText: "first_name",
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
            if (first_nameErrorMessage != '')
              Container(
                child: Text(
                  "\t\t\t\t$first_nameErrorMessage",
                  style: TextStyle(fontSize: 10, color: Colors.red),
                ),
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(2),
                width: double.infinity,
              ),
// FIRST NAME CODE END HERE
            Container(
              width: double.infinity,
              child: TextFormField(
                initialValue: last_name,
                validator: _validatelastName,
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
                  hintText: "last_name",
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
            if (last_nameErrorMessage != '')
              Container(
                child: Text(
                  "\t\t\t\t$last_nameErrorMessage",
                  style: TextStyle(fontSize: 10, color: Colors.red),
                ),
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(2),
                width: double.infinity,
              ),

            // input field for Last name ends here

            Container(
              width: double.infinity,
              child: TextFormField(
                initialValue: mob_no,
                validator: _validatemobno,
                autofocus: mounted,
                autocorrect: false,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.only(
                      left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "mob_no",
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFF929BAB)),
                ),
                style: TextStyle(fontSize: 16, color: Color(0xFF929BAB)),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => widget.proceedToNextStep(),
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
            if (mob_noErrorMessage != '')
              Container(
                child: Text(
                  "\t\t\t\t$mob_noErrorMessage",
                  style: TextStyle(fontSize: 10, color: Colors.red),
                ),
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(2),
                width: double.infinity,
              ),
            // input field for Mob No ends here
          ],
        ));
  }

  void errorMessageSetter(String fieldName, String message) {
    setState(() {
      switch (fieldName) {
        case 'FIRST-NAME':
          first_nameErrorMessage = message;
          break;

        case 'LAST-NAME':
          last_nameErrorMessage = message;
          break;

        case 'MOB-NO':
          mob_noErrorMessage = message;
          break;
      }
    });
  }

  String? _validatefirstName(String? value) {
    if (value == null || value.isEmpty) {
      errorMessageSetter('FIRST-NAME', 'you must provide your first name');
    } else if (value.length > 100) {
      errorMessageSetter(
          'FIRST-NAME', 'name cannot contain more than 100 characters');
    } else {
      errorMessageSetter('FIRST-NAME', "");

      widget.updateSignUpDetails('first_name', value);
    }

    return null;
  }

  String? _validatelastName(String? value) {
    if (value == null || value.isEmpty) {
      errorMessageSetter('LAST-NAME', 'you must provide your last name');
    } else if (value.length > 100) {
      errorMessageSetter(
          'LAST-NAME', 'name cannot contain more than 100 characters');
    } else {
      errorMessageSetter('LAST-NAME', "");

      widget.updateSignUpDetails('last_name', value);
    }

    return null;
  }

  String? _validatemobno(String? value) {
    if (value == null || value.isEmpty) {
      errorMessageSetter('MOB-NO', 'you must provide your MOB-NO');
    } else if (value.length > 100) {
      errorMessageSetter(
          'MOB-NO', 'name cannot contain more than 100 characters');
    } else {
      errorMessageSetter('MOB-NO', "");

      widget.updateSignUpDetails('mob_no', value);
    }

    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      errorMessageSetter(
          'RESIDENTIAL-ADDRESS', 'you must provide your residential address');
    } else if (value.length > 300) {
      errorMessageSetter('RESIDENTIAL-ADDRESS',
          'address cannot contain more than 300 characters');
    } else {
      errorMessageSetter('RESIDENTIAL-ADDRESS', "");

      widget.updateSignUpDetails('address', value);
    }

    return null;
  }
}
