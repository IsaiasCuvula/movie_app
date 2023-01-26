// import 'package:billify/controllers/auth_controller.dart';
// import 'package:billify/utils/utils_class.dart';
// import 'package:billify/widgets/add_bill_screen/custom_bill_header.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../utils/constants.dart';
// import '../../widgets/custom_container.dart';
// import '../../widgets/text_field_container.dart';
//
// class ForgotPasswordScreen extends StatelessWidget {
//   ForgotPasswordScreen({Key? key}) : super(key: key);
//
//   final _formKey = GlobalKey<FormState>();
//   final AuthController _auth = Get.put(AuthController());
//   final TextEditingController _emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomBillHeader(title: 'Forgot Password'),
//       body: SingleChildScrollView(
//         padding: kPadding20,
//         child: Column(
//           children: [
//             Text(
//               'Enter your email address to reset your password.',
//               style: kTextStyle(18.0),
//             ),
//             kVerticalSpace30,
//             Form(
//               key: _formKey,
//               child: TextFieldContainer(
//                 child: TextFormField(
//                   key: ValueKey(kEmailText),
//                   controller: _emailController,
//                   autocorrect: false,
//                   style: kTextStyle(18.0),
//                   keyboardType: TextInputType.emailAddress,
//                   textInputAction: TextInputAction.done,
//                   decoration: InputDecoration(
//                     hintText: kEnterYourEmail,
//                     hintStyle: kTextStyle(16.0).copyWith(
//                       color: kColorPurple.withOpacity(0.4),
//                     ),
//                     border: InputBorder.none,
//                   ),
//                   validator: (value) {
//                     if (value != null) {
//                       if (value.isEmpty || !value.contains('@')) {
//                         return 'Please enter a valid email address.';
//                       }
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             kVerticalSpace50,
//             Obx(() {
//               final bool isLoading = _auth.isLoading.value;
//
//               return isLoading
//                   ? Center(child: Utils.progressIndicator())
//                   : InkWell(
//                       onTap: () => _resetPassword(context),
//                       borderRadius: BorderRadius.circular(12.0),
//                       child: CustomContainer(
//                         height: 45,
//                         width: Get.width,
//                         color: kColorDarkPurple,
//                         child: Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Icon(Icons.email_outlined,
//                                   color: Colors.white),
//                               kHorizontalSpace8,
//                               Text(
//                                 'Reset Password',
//                                 style: kTextStyleBoldWhite(18.0),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _resetPassword(BuildContext context) async {
//     final bool? isValid = _formKey.currentState?.validate();
//     FocusScope.of(context).unfocus();
//     if (isValid != null) {
//       if (isValid) {
//         _formKey.currentState?.save();
//         final String email = _emailController.text.trim();
//         await _auth.resetPassword(email).then((value) {
//           Get.back();
//           Utils.generalSnackBar('Reset Password Email Sent',
//               "We've sent an email to reset your password, check your inbox or spam folder.");
//         }).catchError((error) {
//           Utils.errorSnackBar(error);
//         });
//       }
//     }
//   }
// }
