// import 'package:deliveryfoodapp/bottmnav.dart';
// import 'package:deliveryfoodapp/signup.dart';
// import 'package:deliveryfoodapp/widget/widget_supper.dart';
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class LogIn extends StatefulWidget {
//   const LogIn({super.key});

//   @override
//   State<LogIn> createState() => _LogInState();
// }

// class _LogInState extends State<LogIn> {
//   String email = "", password = "";

//   TextEditingController useremailController = TextEditingController();
//   TextEditingController userpasswordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   Future<void> userLogin() async {
//     if (email != null &&
//         password != null &&
//         email!.isNotEmpty &&
//         password!.isNotEmpty) {
//       try {
//         AuthResponse response = await Supabase.instance.client.auth
//             .signInWithPassword(email: email!, password: password!);

//         if (response.user != null && response.session != null) {
//           print("Login Successful");
//           print("User ID: ${response.user!.id}");
//           print("User Email: ${response.user!.email}");

//           _showSnackBar("Login Successful", context, Colors.green);

//           // الانتقال للصفحة الرئيسية
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => Bottmnav()),
//           );
//         } else {
//           _showSnackBar("فشل في تسجيل الدخول", context, Colors.orange);
//         }
//       } on AuthException catch (e) {
//         print("Auth Error: ${e.message}");

//         // رسائل مخصصة للأخطاء الشائعة
//         String errorMsg = e.message ?? "خطأ غير معروف";
//         if (e.message?.contains("Email not confirmed") == true) {
//           errorMsg = "البريد غير مؤكد. تحقق من بريدك الإلكتروني أو قم بتأكيده.";
//         } else if (e.message?.contains("Invalid login credentials") == true) {
//           errorMsg = "الإيميل أو كلمة المرور خاطئة";
//         }

//         _showSnackBar(errorMsg, context, Colors.red);
//       } catch (e) {
//         _showSnackBar("حدث خطأ. حاول مرة أخرى.", context, Colors.red);
//       }
//     } else {
//       _showSnackBar("الإيميل وكلمة المرور مطلوبة", context, Colors.orange);
//     }
//   }

//   // دالة مساعدة (ضعها في الكلاس)
//   void _showSnackBar(String message, BuildContext context, Color bgColor) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//         ),
//         backgroundColor: bgColor,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height / 2.5,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFFff5c30), Color(0xFFe74b1a)],
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(
//                 top: MediaQuery.of(context).size.height / 3.5,
//               ),
//               height: MediaQuery.of(context).size.height / 2.5,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//               ),
//               child: Text(""),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 60, left: 20, right: 20),
//               child: Column(
//                 children: [
//                   Center(
//                     child: Image.asset(
//                       "assets/images/logo.png",
//                       width: MediaQuery.of(context).size.width / 1.5,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(height: 50),
//                   Material(
//                     elevation: 5,
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(
//                       padding: EdgeInsets.only(left: 20, right: 20),
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height / 2,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                       ),

//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           children: [
//                             Text(
//                               "LogIn ",
//                               style: AppWidget.HaedlineTextFiledStyle(),
//                             ),
//                             SizedBox(height: 20),
//                             TextFormField(
//                               controller: useremailController,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return "Please enter your email";
//                                 } else if (!RegExp(
//                                   r'\S+@\S+\.\S+',
//                                 ).hasMatch(value)) {
//                                   return "Please enter a valid email address";
//                                 }
//                                 return null;
//                               },
//                               decoration: InputDecoration(
//                                 hintText: "Email",
//                                 prefixIcon: Icon(Icons.email_outlined),
//                                 helperStyle: AppWidget.semiboldTextFiledStyle(),

//                                 // prefixIconColor: Colors.deepOrange,
//                               ),
//                             ),
//                             SizedBox(height: 30),
//                             TextFormField(
//                               controller: userpasswordController,
//                               validator: (value) => value!.isEmpty
//                                   ? "Please enter your password"
//                                   : null,
//                               obscureText: true,
//                               decoration: InputDecoration(
//                                 hintText: "Password",
//                                 prefixIcon: Icon(Icons.password_outlined),
//                                 helperStyle: AppWidget.semiboldTextFiledStyle(),
//                                 // prefixIconColor: Colors.deepOrange,
//                               ),
//                             ),
//                             SizedBox(height: 30),
//                             Container(
//                               alignment: Alignment.topRight,
//                               child: Text(
//                                 "Forgot Password?",
//                                 style: AppWidget.HaedlineTextFiledStyle(),
//                               ),
//                             ),
//                             SizedBox(height: 80),

//                             GestureDetector(
//                               onTap: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   setState(() {
//                                     email = useremailController.text;
//                                     password = userpasswordController.text;
//                                   });
//                                   userLogin();
//                                 }
//                               },

//                               child: Material(
//                                 elevation: 5,
//                                 borderRadius: BorderRadius.circular(20),
//                                 child: Container(
//                                   width: 200,
//                                   decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         Color(0xFFff5c30),
//                                         Color(0xFFe74b1a),
//                                       ],
//                                     ),
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),

//                                   padding: EdgeInsets.symmetric(
//                                     vertical: 8,
//                                     horizontal: 8,
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "LOGIN",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontFamily: "Poppins1",
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 70),
//                   GestureDetector(
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Signup()),
//                     ),
//                     child: Text(
//                       "don't have an account? Sign Up",
//                       style: AppWidget.semiboldTextFiledStyle(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:deliveryfoodapp/bottmnav.dart';
import 'package:deliveryfoodapp/forgotpassword.dart';
import 'package:deliveryfoodapp/signup.dart';
import 'package:deliveryfoodapp/widget/widget_supper.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // State
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ==================== Login Function ====================
  Future<void> userLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final String email = emailController.text.trim().toLowerCase();
    final String password = passwordController.text;

    print("🔄 Attempting login with: $email");

    try {
      AuthResponse response = await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);

      print("✅ Response received");
      print("User: ${response.user}");
      print("Session: ${response.session}");

      if (response.user != null && response.session != null) {
        print("✅ Login Successful!");

        _showSnackBar("تم تسجيل الدخول بنجاح ✅", Colors.green);

        // انتظر قليلاً ثم انتقل
        await Future.delayed(Duration(milliseconds: 500));

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Bottmnav()),
          );
        }
      } else {
        print("⚠️ User or Session is null");
        _showSnackBar("فشل في تسجيل الدخول", Colors.orange);
      }
    } on AuthException catch (e) {
      print("❌ AuthException: ${e.message}");

      String errorMsg = _getArabicError(e.message);
      _showSnackBar(errorMsg, Colors.red);
    } catch (e) {
      print("❌ General Error: $e");
      _showSnackBar("حدث خطأ غير متوقع", Colors.red);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // ==================== Arabic Error Messages ====================
  String _getArabicError(String? message) {
    if (message == null) return "خطأ غير معروف";

    if (message.contains("Email not confirmed")) {
      return "البريد غير مؤكد! تحقق من بريدك أو أوقف التأكيد من Supabase";
    }
    if (message.contains("Invalid login credentials")) {
      return "البريد أو كلمة المرور غير صحيحة";
    }
    if (message.contains("User not found")) {
      return "هذا الحساب غير موجود";
    }
    if (message.contains("Too many requests")) {
      return "محاولات كثيرة. انتظر دقيقة وحاول مجدداً";
    }

    return message;
  }

  // ==================== SnackBar ====================
  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(20),
      ),
    );
  }

  // ==================== Build ====================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Background
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFff5c30), Color(0xFFe74b1a)],
                  ),
                ),
              ),

              // White Container
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3.5,
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),

              // Content
              Container(
                margin: EdgeInsets.only(top: 60, left: 20, right: 20),
                child: Column(
                  children: [
                    // Logo
                    Center(
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 50),

                    // Form Card
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFe74b1a),
                                ),
                              ),
                              SizedBox(height: 30),

                              // Email Field
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "البريد الإلكتروني مطلوب";
                                  }
                                  if (!RegExp(
                                    r'\S+@\S+\.\S+',
                                  ).hasMatch(value)) {
                                    return "أدخل بريد إلكتروني صحيح";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "البريد الإلكتروني",
                                  hintText: "example@email.com",
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Color(0xFFe74b1a),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Color(0xFFe74b1a),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),

                              // Password Field
                              TextFormField(
                                controller: passwordController,
                                obscureText: _obscurePassword,
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "كلمة المرور مطلوبة";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "كلمة المرور",
                                  hintText: "أدخل كلمة المرور",
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Color(0xFFe74b1a),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(
                                        () => _obscurePassword =
                                            !_obscurePassword,
                                      );
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Color(0xFFe74b1a),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),

                              // Forgot Password   forgotpassword.dart
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (Context) => Forgotpassword(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Foegor Passwoed  ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 30),

                              // Login Button
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: _isLoading ? null : userLogin,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFe74b1a),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    elevation: 5,
                                  ),
                                  child: _isLoading
                                      ? SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 3,
                                          ),
                                        )
                                      : Text(
                                          "تسجيل الدخول",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    // Sign Up Link
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: "ليس لديك حساب؟ ",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: "إنشاء حساب",
                              style: TextStyle(
                                color: Color(0xFFe74b1a),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
    );
  }
}
