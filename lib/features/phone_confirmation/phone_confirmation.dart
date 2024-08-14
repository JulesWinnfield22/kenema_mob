import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kenema/features/pages/home_screen.dart';
import 'package:kenema/store/patient_store.dart';
import 'package:kenema/utils/constants/image_string.dart';
import 'package:kenema/utils/constants/sizes.dart';
import 'package:kenema/utils/helpers/helper_function.dart';
import 'package:kenema/utils/size/size.dart';
import 'package:kenema/utils/constants/colors.dart';
import 'package:kenema/widgets/gradient_elevated_button/gradient_elevated_button.dart';
import 'package:provider/provider.dart';

class PhoneConfirmationScreen extends StatefulWidget {
  const PhoneConfirmationScreen({super.key});

  @override
  State<PhoneConfirmationScreen> createState() =>
      _PhoneConfirmationScreenState();
}

class _PhoneConfirmationScreenState extends State<PhoneConfirmationScreen> {
  final List<TextEditingController> _inputControllers = [];
  final List<FocusNode> _inputFocusNodes = [];

  @override
  void initState() {
    super.initState();
    _createInputControllers();
    _createFocusNodes();
  }

  void _createInputControllers() {
    for (int i = 0; i < 6; i++) {
      _inputControllers.add(TextEditingController());
    }
  }

  void _createFocusNodes() {
    for (int i = 0; i < 6; i++) {
      _inputFocusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    _disposeFocusNodesAndInputControllers();
    super.dispose();
  }

  void _disposeFocusNodesAndInputControllers() {
    for (int i = 0; i < 6; i++) {
      _inputFocusNodes[i].dispose();
      _inputControllers[i].dispose();
    }
  }

  _onTextChanged(index) {
    if (_inputControllers[index].text.length == 1) {
      if (index < (_inputControllers.length - 1)) {
        FocusScope.of(context).requestFocus(_inputFocusNodes[index + 1]);
      } else if (index == (_inputControllers.length - 1)) {
        _inputFocusNodes[index].unfocus();
      }
    } else if (_inputControllers[index].text.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_inputFocusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SizedBox(
        height: 100.screenHeight,
        width: 100.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Consumer<PatientStore>(builder: (a, patient, c) {
            return Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  height: 50.screenHeight,
                  child: Image.asset(
                    CImages.pattern1,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Confirmation",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          color: CColors.textLabel),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 19.0,
                            color: CColors.textSecondaryLight,
                            fontWeight: FontWeight.w300,
                            height: 1.4),
                        children: <TextSpan>[
                          const TextSpan(
                              text:
                                  'Please enter the 6-digit code sent to your phone number '),
                          TextSpan(
                            text: '+291 ${patient.patient?.mobilePhone}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: ' for verification.'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 36.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < _inputControllers.length; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            width:
                                (90.screenWidth - (2 * CSizes.defaultSpace)) /
                                    6,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: CColors.textPrimary),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: TextField(
                              controller: _inputControllers[i],
                              focusNode: _inputFocusNodes[i],
                              onChanged: (value) => _onTextChanged(i),
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 20),
                              decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  fillColor: Colors.white),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 36.0,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Didn’t receive any code?",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: CColors.lightBlack),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: GradientElevatedButton(
                    width: 100.screenWidth,
                    height: 55,
                    borderRadius: BorderRadius.circular(8.0),
                    onPressed: () {
                      CHelperFunction.navigateSlideToScreen(
                          context, const HomeScreen());
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        color: CColors.accent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
