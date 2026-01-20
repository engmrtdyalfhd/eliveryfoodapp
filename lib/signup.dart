// import 'package:deliveryfoodapp/bottmnav.dart';
// import 'package:deliveryfoodapp/login.dart';
// import 'package:deliveryfoodapp/widget/widget_supper.dart';
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   String email = '', password = '', name = '';

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   // regesteration() async {
//   //   print("Regesteration started");

//   //   if (password != null) {
//   //     print("Password matched");
//   //     try {
//   //       UserCredential userCredential = await Supabase.instance.client.auth
//   //           .signUp(email: email, password: password);
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(
//   //           content: Text(
//   //             "Regesteration Successful",
//   //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//   //           ),
//   //         ),
//   //       );
//   //     } on SupabaseAuthException catch (e) {
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(
//   //           content: Text(
//   //             e.message,
//   //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//   //           ),
//   //         ),
//   //       );
//   //     } catch (e) {
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(
//   //           content: Text(
//   //             "An error occurred. Please try again.",
//   //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//   //           ),
//   //         ),
//   //       );
//   //     }
//   //   }
//   // }

//   registration() async {
//     print("Registration started");
//     print("Email: $email");
//     print("Password: $password");

//     if (password != null && email != null) {
//       try {
//         AuthResponse response = await Supabase.instance.client.auth.signUp(
//           email: email!.trim().toLowerCase(), // ⬅️ مهم جداً
//           password: password!,
//         );

//         print("=== SignUp Response ===");
//         print("User: ${response.user}");
//         print("User ID: ${response.user?.id}");
//         print("Email Confirmed: ${response.user?.emailConfirmedAt}");

//         if (response.user != null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text("Registration Successful"),
//               backgroundColor: Colors.green,
//             ),
//           );

//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => LogIn()),
//           );
//         }
//       } on AuthException catch (e) {
//         print("❌ SignUp Error: ${e.message}");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(e.message), backgroundColor: Colors.red),
//         );
//       }
//     }
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
//                       height: MediaQuery.of(context).size.height / 1.5,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                       ),

//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           children: [
//                             Text(
//                               "Sign Up ",
//                               style: AppWidget.HaedlineTextFiledStyle(),
//                             ),
//                             SizedBox(height: 20),
//                             TextFormField(
//                               controller: nameController,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your name';
//                                 }
//                                 return null;
//                               },
//                               decoration: InputDecoration(
//                                 hintText: "Name",
//                                 prefixIcon: Icon(Icons.person_2_outlined),
//                                 helperStyle: AppWidget.semiboldTextFiledStyle(),

//                                 // prefixIconColor: Colors.deepOrange,
//                               ),
//                             ),
//                             SizedBox(height: 20),
//                             TextFormField(
//                               controller: emailController,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your email';
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
//                               controller: passwordController,
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your password';
//                                 }
//                                 return null;
//                               },
//                               obscureText: true,
//                               decoration: InputDecoration(
//                                 hintText: "Password",
//                                 prefixIcon: Icon(Icons.password_outlined),
//                                 helperStyle: AppWidget.semiboldTextFiledStyle(),
//                                 // prefixIconColor: Colors.deepOrange,
//                               ),
//                             ),
//                             SizedBox(height: 30),
//                             // Container(
//                             //   alignment: Alignment.topRight,
//                             //   child: Text(
//                             //     "Forgot Password?",
//                             //     style: AppWidget.HaedlineTextFiledStyle(),
//                             //   ),
//                             // ),
//                             SizedBox(height: 80),

//                             GestureDetector(
//                               onTap: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   setState(() {
//                                     email = emailController.text;
//                                     password = passwordController.text;
//                                     name = nameController.text;
//                                   });
//                                   registration();
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
//                                       "SIGN UP",
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
//                       MaterialPageRoute(builder: (context) => LogIn()),
//                     ),
//                     child: Text(
//                       "Already have an account? Log In",
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
import 'package:deliveryfoodapp/login.dart';
import 'package:deliveryfoodapp/widget/widget_supper.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Form Key
  final _formKey = GlobalKey<FormState>();

  // State Variables
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  double _passwordStrength = 0;
  String _passwordStrengthText = '';
  Color _passwordStrengthColor = Colors.grey;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // ==================== Password Strength Checker ====================
  void _checkPasswordStrength(String password) {
    double strength = 0;
    String text = '';
    Color color = Colors.grey;

    if (password.isEmpty) {
      strength = 0;
      text = '';
    } else if (password.length < 6) {
      strength = 0.2;
      text = 'ضعيفة جداً';
      color = Colors.red;
    } else if (password.length < 8) {
      strength = 0.4;
      text = 'ضعيفة';
      color = Colors.orange;
    } else {
      // Check for different character types
      bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
      bool hasLowercase = password.contains(RegExp(r'[a-z]'));
      bool hasDigits = password.contains(RegExp(r'[0-9]'));
      bool hasSpecialChars = password.contains(
        RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
      );

      int criteria = 0;
      if (hasUppercase) criteria++;
      if (hasLowercase) criteria++;
      if (hasDigits) criteria++;
      if (hasSpecialChars) criteria++;

      if (criteria == 1) {
        strength = 0.4;
        text = 'ضعيفة';
        color = Colors.orange;
      } else if (criteria == 2) {
        strength = 0.6;
        text = 'متوسطة';
        color = Colors.yellow[700]!;
      } else if (criteria == 3) {
        strength = 0.8;
        text = 'قوية';
        color = Colors.lightGreen;
      } else if (criteria == 4) {
        strength = 1.0;
        text = 'قوية جداً';
        color = Colors.green;
      }
    }

    setState(() {
      _passwordStrength = strength;
      _passwordStrengthText = text;
      _passwordStrengthColor = color;
    });
  }

  // ==================== Email Validator ====================
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'أدخل بريد إلكتروني صحيح';
    }
    return null;
  }

  // ==================== Password Validator ====================
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    return null;
  }

  // ==================== Registration Function ====================
  Future<void> registration() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final String name = nameController.text.trim();
    final String email = emailController.text.trim().toLowerCase();
    final String password = passwordController.text;

    try {
      // 1️⃣ إنشاء الحساب في Supabase Auth
      AuthResponse response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name, // حفظ الاسم في metadata
        },
      );

      if (response.user != null) {
        // 2️⃣ حفظ بيانات المستخدم في جدول users (اختياري)
        await _saveUserToDatabase(
          userId: response.user!.id,
          name: name,
          email: email,
        );

        _showSnackBar('تم إنشاء الحساب بنجاح! ✅', Colors.green);

        // 3️⃣ الانتقال لصفحة تسجيل الدخول
        await Future.delayed(Duration(seconds: 1));
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LogIn()),
          );
        }
      }
    } on AuthException catch (e) {
      String errorMsg = _getArabicErrorMessage(e.message);
      _showSnackBar(errorMsg, Colors.red);
    } catch (e) {
      _showSnackBar('حدث خطأ غير متوقع. حاول مرة أخرى.', Colors.red);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // ==================== Save User to Database ====================
  Future<void> _saveUserToDatabase({
    required String userId,
    required String name,
    required String email,
  }) async {
    try {
      await Supabase.instance.client.from('users').insert({
        'id': userId,
        'name': name,
        'email': email,
        'created_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      print('Error saving user to database: $e');
      // لا نوقف العملية إذا فشل الحفظ في الجدول
    }
  }

  // ==================== Arabic Error Messages ====================
  String _getArabicErrorMessage(String? message) {
    if (message == null) return 'حدث خطأ غير معروف';

    if (message.contains('already registered') ||
        message.contains('already exists')) {
      return 'هذا البريد الإلكتروني مسجل مسبقاً';
    }
    if (message.contains('Invalid email')) {
      return 'البريد الإلكتروني غير صالح';
    }
    if (message.contains('Password should be at least')) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    if (message.contains('rate limit')) {
      return 'محاولات كثيرة. انتظر قليلاً ثم حاول مجدداً';
    }

    return message;
  }

  // ==================== Show SnackBar ====================
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

  // ==================== Build Method ====================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Background Gradient
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

              // Main Content
              Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Column(
                  children: [
                    // Logo
                    Center(
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: MediaQuery.of(context).size.width / 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 30),

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
                                "إنشاء حساب جديد",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFe74b1a),
                                ),
                              ),
                              SizedBox(height: 20),

                              // ========== Name Field ==========
                              TextFormField(
                                controller: nameController,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'الاسم مطلوب';
                                  }
                                  if (value.length < 2) {
                                    return 'الاسم قصير جداً';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "الاسم الكامل",
                                  hintText: "أدخل اسمك",
                                  prefixIcon: Icon(
                                    Icons.person_outline,
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
                              SizedBox(height: 15),

                              // ========== Email Field ==========
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                validator: _validateEmail,
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
                              SizedBox(height: 15),

                              // ========== Password Field ==========
                              TextFormField(
                                controller: passwordController,
                                obscureText: _obscurePassword,
                                textInputAction: TextInputAction.next,
                                validator: _validatePassword,
                                onChanged: _checkPasswordStrength,
                                decoration: InputDecoration(
                                  labelText: "كلمة المرور",
                                  hintText: "أدخل كلمة مرور قوية",
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

                              // ========== Password Strength Indicator ==========
                              if (passwordController.text.isNotEmpty) ...[
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value: _passwordStrength,
                                        backgroundColor: Colors.grey[300],
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              _passwordStrengthColor,
                                            ),
                                        minHeight: 5,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      _passwordStrengthText,
                                      style: TextStyle(
                                        color: _passwordStrengthColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              SizedBox(height: 15),

                              // ========== Confirm Password Field ==========
                              TextFormField(
                                controller: confirmPasswordController,
                                obscureText: _obscureConfirmPassword,
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'تأكيد كلمة المرور مطلوب';
                                  }
                                  if (value != passwordController.text) {
                                    return 'كلمات المرور غير متطابقة';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "تأكيد كلمة المرور",
                                  hintText: "أعد إدخال كلمة المرور",
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Color(0xFFe74b1a),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureConfirmPassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(
                                        () => _obscureConfirmPassword =
                                            !_obscureConfirmPassword,
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
                              SizedBox(height: 25),

                              // ========== Sign Up Button ==========
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: _isLoading ? null : registration,
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
                                          "إنشاء حساب",
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

                    SizedBox(height: 20),

                    // ========== Login Link ==========
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: "لديك حساب بالفعل؟ ",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: "تسجيل الدخول",
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
