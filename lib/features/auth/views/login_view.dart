import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo_mobx_app/core/constants/constants_asset.dart';
import 'package:mytodo_mobx_app/core/constants/constants_text.dart';
import 'package:mytodo_mobx_app/core/style/style_color.dart';
import 'package:mytodo_mobx_app/core/style/style_text.dart';
import 'package:mytodo_mobx_app/features/auth/stores/auth_store.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  static const introPage = "into_page";
  LoginView({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Gap(34.h),
              Image.asset(
                ConstantsAsset.imglogoApp,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              Gap(24.h),
              Text(
                ConstantText.welcomeTo,
                style: h3Reguler(),
              ),
              Text(
                ConstantText.myTodo,
                style: h3Bold(),
              ),
              Gap(6.h),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15),
                child: Text(
                  ConstantText.discriptionTodo,
                  style: b3Reguler(),
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(40.h),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: b2Medium(),
                decoration: InputDecoration(
                    hintText: "enter your email",
                    labelText: "Email",
                    labelStyle: b2Medium(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(),
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w)),
              ),
              Gap(20.h),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: "enter your email",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(),
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.2),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w)),
              ),
              Gap(20.h),
              Row(
                children: [
                  if (store.isLoading) const CircularProgressIndicator(),
                  if (!store.isLoading)
                    Expanded(
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        onPressed: () {
                          store.loginUser(_emailController.text,
                              _passwordController.text, context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Colors.blue.shade700,
                        child: Text(
                          "Login",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
              Gap(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont't any account?",
                    style: b3Medium(colorText: CustomColor.netral400),
                  ),
                  const Gap(12),
                  GestureDetector(
                    onTap: () => context.go("/sign_up"),
                    child: Text(
                      "Sign Up",
                      style: b3Medium(colorText: CustomColor.primary800),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
