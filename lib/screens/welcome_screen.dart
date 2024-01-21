import 'package:flutter/material.dart';
import 'package:khetiharii/screens/signin_screen.dart';
import 'package:khetiharii/screens/signup_screen.dart';
import 'package:khetiharii/theme/theme.dart';
import 'package:khetiharii/widgets/custom_scaffold.dart';
import 'package:khetiharii/widgets/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Welcome \n',
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w900, color: Colors.greenAccent
                            )),
                        TextSpan(
                            text:
                                '\n To Khetiharii',
                            style: TextStyle(
                              fontSize: 45.0,fontWeight: FontWeight.bold,color: Colors.greenAccent
                              // height: 0,
                            ))
                      ],
                    ),
                  ),
                ),
              )),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: SignInScreen(),
                      color: Colors.white10,
                      textColor: Colors.orange,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: const SignUpScreen(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
