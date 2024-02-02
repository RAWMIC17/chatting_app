import 'package:chatting_app_1/utils/routes.dart';
import 'package:chatting_app_1/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double turns = 0.0;
  final _formkey = GlobalKey<FormState>();
  bool changebutton = false;
  var image = Image.asset("lib/assets/header.png",);
  double _size = 100;

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      //await Navigator.pushNamed(context, MyRoutes.loginRoute);

      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.creamcolor,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 90, left: 33),
            child: Image.asset("lib/assets/woman.png"),
          ),
          Container(
            padding: EdgeInsets.only(top: 60, left: 33),
              child: AnimatedRotation(
                turns: turns,
                duration: Duration(seconds: 1),
                child: image,
              ),
            
          ),
          /*Transform.rotate(
            alignment: Alignment.center,
            angle: finalAngle,
            origin: Offset(0, 0),
            child: Container(
                padding: EdgeInsets.only(top: 60, left: 33),
                child: Image.asset("lib/assets/header.png")),
          ),*/
          Container(
            padding: EdgeInsets.only(
              top: 486,
            ),
            child: "Solution for your chat application system"
                .text
                .xl4
                .fontWeight(FontWeight.w400)
                .fontFamily('Mulish')
                //.wide
                .align(TextAlign.center)
                .make(),
          ),
          Container(
            padding: EdgeInsets.only(top: 590, left: 27, right: 27),
            child:
                ' "Now it is very easy to find your people. We have a solution for your experience" '
                    .text
                    .xl
                    .align(TextAlign.center)
                    .make(),
          ),
          Container(
            width: 371,
            padding: EdgeInsets.only(top: 690, left: 22),
            child: ElevatedButton(
              onPressed: () {
                setState(() => turns = turns == 0 ? -1 / 4:0);
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Mycolors.creamcolor,
                    showDragHandle: true,
                    enableDrag: true,
                    useSafeArea: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(18))),
                    elevation: 10,
                    barrierColor: Mycolors.creamcolor.withOpacity(0),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 400,
                        child: Form(
                          key: _formkey,
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 276),
                                    height: 18,
                                    child: "Username"
                                        .text
                                        .color(Mycolors.textcolor)
                                        .fontFamily('Mulish')
                                        .xl2
                                        .make(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 18),
                                    child: TextFormField(
                                      style: TextStyle(fontSize: 16),
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      decoration: InputDecoration(
                                        //enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                                        filled: true,
                                        fillColor: Mycolors.textboxcolor,
                                        hintText: "Enter Username",
                                        //labelText: "Username"
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Username can't be empty";
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 276, top: 8),
                                    height: 25,
                                    child: "Password"
                                        .text
                                        .color(Mycolors.textcolor)
                                        .fontFamily('Mulish')
                                        .xl2
                                        .make(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 18),
                                    child: TextFormField(
                                      style: TextStyle(fontSize: 16),
                                      autofocus: true,
                                      //textCapitalization: TextCapitalization.none,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        fillColor: Mycolors.textboxcolor,
                                        filled: true,
                                        hintText: "Enter Password",
                                        //labelText: "Password"
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Password can't be empty";
                                        } else if (value.length < 8) {
                                          return "Password must be atleast 8 alphanumeric code";
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 25),
                                    height: 80,
                                    width: 356,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        //Navigator.pop(context);
                                        moveToHome(context);
                                      },
                                      child: "Login"
                                          .text
                                          .xl
                                          .fontFamily('Mulish')
                                          .normal
                                          .wide
                                          .make(),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Mycolors.buttoncolor),
                                        //fixedSize: MaterialStateProperty.all(Size(100, 70)),
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                                Size(100, 55)),
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                13.0), // Adjust the radius as needed
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                                //"Close".text.make()
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                /*setState(() {
                    finalAngle = -495 / 360;
                    Offset(0, 0); // Set the desired rotation angle
                  });*/
                //_showBottomSheet(context);//BottomSheet;
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Mycolors.buttoncolor),
                //fixedSize: MaterialStateProperty.all(Size(100, 70)),
                minimumSize: MaterialStateProperty.all<Size>(Size(100, 55)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        13.0), // Adjust the radius as needed
                  ),
                ),
              ),
              child: " Get Started"
                  .text
                  .xl
                  .fontFamily('Mulish')
                  .normal
                  .wide
                  .make(),
            ),
          )
        ],
      ),
    );
  }
}
