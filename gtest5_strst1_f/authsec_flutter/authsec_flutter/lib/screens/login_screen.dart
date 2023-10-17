import 'package:flutter/material.dart';
import 'package:authsec_flutter/hadwin_components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Widget helpInfoContainer = Container(
      child: Center(
        child: InkWell(
          child: const Text(
            'Having trouble logging in?',
            style: TextStyle(fontSize: 14, color: Color(0xFF929BAB)),
          ),
          onTap: getLoginHelp, // FOR LOGIN HELP
        ),
      ),
      width: double.infinity,
      height: 36,
    );

    Widget signUpContainer = Container(
      child: Center(
        child: InkWell(
          child: const Text(
            'Sign up',
            style: TextStyle(fontSize: 14, color: Color(0xFF929BAB)),
          ),
          onTap: goToSignUpScreen, // FOR SIGN UP
        ),
      ),
      width: double.infinity,
      height: 36,
    );

    List<Widget> loginScreenContents = <Widget>[
      _spacing(64),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Image.asset('/images/hadwin_system/cldnsure.png'),
      ),
      _spacing(64),
      const LoginFormComponent(), // ON LOGIN SCREEN
      _spacing(30),
      helpInfoContainer,
      _spacing(10),
      signUpContainer
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: loginScreenContents,
        ),
        padding: const EdgeInsets.all(45),
      ),
    );
  }

  void getLoginHelp() {
    Navigator.push(
        context,
        SlideRightRoute(
            page: const HadWinMarkdownViewer(
                screenName: 'Login Help',
                urlRequested:
                    'https://raw.githubusercontent.com/brownboycodes/HADWIN/master/docs/HADWIN_WIKI.md')));
  }

  void goToSignUpScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  SizedBox _spacing(double height) => SizedBox(
        height: height,
      );
}
