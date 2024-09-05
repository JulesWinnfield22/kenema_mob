import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kenema/features/equbs/api/prescription_api.dart';
import 'package:kenema/features/pages/prescription-temporary.dart';
import 'package:kenema/features/pages/prescription_screen.dart';
import 'package:kenema/features/pages/refill_screen.dart';
import 'package:kenema/features/pages/refill_temporary.dart';
import 'package:kenema/hooks/useApiRequest.dart';
import 'package:kenema/store/patient_store.dart';
import 'package:kenema/store/prescription_store.dart';
import 'package:kenema/utils/constants/colors.dart';
import 'package:kenema/utils/constants/image_string.dart';
import 'package:kenema/utils/constants/sizes.dart';

import 'package:provider/provider.dart';

class Home extends HookWidget {
  Home({super.key});

  // int _currentIndex = 0;
  final List<Widget> _pages = [
    Profile(),
    RefillTemporary(),
    // Home(),
  ];
  @override
  Widget build(BuildContext context) {
    var a = useState(_pages[0]);
    void changePage(idx) {
      a.value = _pages[idx];
      print(idx);
    }

    var req = useApiRequest<PrescriptionHistory>();

    useEffect(() {
      Future<void> fet() async {
        if (req.value.pending.value) return;
        var res = await req.value.send(
          getPrescription(Provider.of<PatientStore>(context, listen: false)
              .patient
              ?.userUuid as String),
        );
        print("object ${req.value.error.value}");

        if (res.success) {
          Provider.of<prescriptionStore>(context, listen: false)
              .changePrescription(res.data as PrescriptionHistory);
        }
        print(res.data);
        print("hhh");
      }

      fet();
      return null;
    }, []);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Announcements",
                  style: TextStyle(
                      fontSize: 18,
                      color: CColors.textLabel,
                      fontWeight: FontWeight.w100,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Image.asset(
                    CImages.ad1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "Nearest Branches",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      letterSpacing: 1),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.only(
                            left: 10, top: 20, bottom: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(CImages.group),
                            const SizedBox(width: 10),
                            const Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Bole Bulbula Branch"),
                                  Opacity(
                                    opacity: 0.6,
                                    child: Text(
                                      "New Branch opened around Bole Brace ",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 8),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(CImages.map),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: a.value == _pages[0]
                            ? CColors.primary
                            : CColors.textLabel.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                      onPressed: () {
                        changePage(0);
                      },
                      child: Text(
                        "Prescriptions",
                        style: TextStyle(
                            color: a.value == _pages[0]
                                ? CColors.accent
                                : CColors.textLabel),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: a.value == _pages[1]
                          ? CColors.primary
                          : CColors.textLabel.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                    onPressed: () {
                      changePage(1);
                    },
                    child: Text(
                      "Refills",
                      style: TextStyle(
                          color: a.value == _pages[1]
                              ? CColors.white
                              : CColors.textPrimary),
                    ),
                  ),
                ))
              ],
            ),
            !req.value.pending.value
                ? a.value
                : Container(
                    child: Center(
                      child: Text("Loading"),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
