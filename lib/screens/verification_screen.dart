import 'package:flutter/material.dart';
import 'package:my_educational_app/Configuration/configuration.dart';
import 'package:my_educational_app/screens/studentlogin_screen.dart';
import 'package:my_educational_app/screens/updatepassword_screen.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key});

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.appBarColor,
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: MyColors.appBarColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 34,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return StudentLoginScreen();
                            },
                          ));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Text(
                        "Verification",
                        style: myCustomTextStyle(),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: MyColors.bodyColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Check Email ",
                          style: myCustomTextStyle(mycolor: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 360,
                              height: 190,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/verification.png"),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Enter the verfication code we ",
                              style: myCustomTextStyle(
                                  mycolor: Colors.black,
                                  myFontSize: 20,
                                  myFontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "just sent you on your email",
                              style: myCustomTextStyle(
                                  mycolor: Colors.black,
                                  myFontSize: 20,
                                  myFontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        VerificationCodeInput(),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: ((context) {
                                    return UpdatePasswordScreen();
                                  })));
                                },
                                child: Text(
                                  'Verify Code',
                                  style: myCustomTextStyle(
                                      mycolor: Colors.black,
                                      myFontSize: 18,
                                      myFontWeight: FontWeight.w500),
                                ),
                                style: getDynamicButtonStyle(210, 50)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerificationCodeInput extends StatefulWidget {
  @override
  _VerificationCodeInputState createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  List<String> verificationCode = List.filled(5, '');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  verificationCode[index] = value;
                  if (index < 4) {
                    // Move focus to the next TextField
                    FocusScope.of(context).nextFocus();
                  }
                }
              },
              decoration: InputDecoration(
                counterText: '', // Remove the character count
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
