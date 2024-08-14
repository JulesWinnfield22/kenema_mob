import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kenema/features/equbs/api/equb_api.dart';
import 'package:kenema/hooks/useApiRequest.dart';
import 'package:kenema/store/patient_store.dart';
import 'package:kenema/utils/constants/colors.dart';
import 'package:kenema/utils/constants/image_string.dart';
import 'package:kenema/utils/constants/sizes.dart';
import 'package:kenema/utils/helpers/helper_function.dart';
import 'package:kenema/utils/size/size.dart';
import 'package:kenema/widgets/gradient_elevated_button/gradient_elevated_button.dart';
import 'package:provider/provider.dart';

class Test extends HookWidget {
  Test({super.key});
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var req = useApiRequest<Patient>();

    Future<void> login() async {
      if (req.value.pending.value) return;

      var res = await req.value.send(getPatient(_textController.text));
      if (res.success) {
        var pref = await CHelperFunction.getInstance();
        pref.setString("patient", jsonEncode(res.data as Patient));

        Provider.of<PatientStore>(context, listen: false)
            .changePatient(res.data as Patient);
        Navigator.of(context).pushNamed('/confirmation');
      }
      print((req.value.error.value));
      print((req.value.response?.value));
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: 100.screenHeight,
        width: 100.screenWidth,
        child: Padding(
          padding: const EdgeInsets.only(
            top: CSizes.defaultSpace,
            right: CSizes.defaultSpace,
            left: CSizes.defaultSpace,
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 95.screenHeight,
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    right: 0,
                    left: 0,
                    child: Image.asset(
                      CImages.kenema,
                      height: 170,
                    ),
                  ),
                  Positioned(
                    top: 170,
                    right: 0,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Welcome!",
                          style: TextStyle(
                            color: CColors.textSecondaryLight,
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 60.screenWidth,
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Login to Kenema pharmacy",
                            style: TextStyle(
                              color: CColors.textSecondaryLight,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 45),
                        SizedBox(
                          width: 100.screenWidth,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: CSizes.defaultSpace,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Phone number",
                                  style: TextStyle(
                                    color: CColors.textLabel,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: CColors.textPrimary,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        const Text('+251'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          height: 70,
                                          width: 50.screenWidth,
                                          child: TextField(
                                            controller: _textController,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              fillColor: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: GradientElevatedButton(
                      width: 100.screenWidth,
                      height: 55,
                      borderRadius: BorderRadius.circular(8.0),
                      onPressed: login,
                      child: req.value.pending.value
                          ? const Text("...")
                          : Text(
                              "Login ${(req.value.response?.value != null ? (req.value.response?.value as Patient).firstName : "")}",
                              style: const TextStyle(
                                color: CColors.accent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
