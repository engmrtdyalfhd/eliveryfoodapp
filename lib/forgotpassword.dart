import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 70),

            Container(
              alignment: Alignment.topCenter,
              child: Text(
                " Password Recovery",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Enter your email ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Form(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),

                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 2),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) =>
                              value!.isEmpty ? "Email cannot be empty" : null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.person_2_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        margin: EdgeInsets.only(left: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Container(
                              width: 140,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  " Send Email ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
