import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kenema/features/equbs/api/prescription_api.dart';
import 'package:kenema/features/equbs/api/refill_api.dart';
import 'package:kenema/hooks/useApiRequest.dart';
import 'package:kenema/store/prescription_store.dart';
import 'package:kenema/store/refill_store.dart';
import 'package:kenema/utils/constants/colors.dart';
import 'package:kenema/utils/constants/sizes.dart';
import 'package:kenema/utils/size/size.dart';
import 'package:provider/provider.dart';

class RefillTemporary extends StatefulWidget {
  RefillTemporary({super.key});

  @override
  State<RefillTemporary> createState() => _RefillTemporaryState();
}

class _RefillTemporaryState extends State<RefillTemporary> {
  @override
  Widget build(BuildContext context) {
    var refill = Provider.of<RefillStore>(context, listen: false);

    var req = useApiRequest<Refill>();

    useEffect(() {
      Future<void> fetch() async {
        if (req.value.pending.value) return;
        var res = await req.value.send(
          getRefill(Provider.of<prescriptionStore>(context, listen: false)
              .prescriptions
              ?.prescriptions![0]
              .prescriptionUuid as String),
        );
        print("object ${req.value.error.value}");

        if (res.success) {
          Provider.of<RefillStore>(context, listen: false)
              .changePrescription(res.data as Refill);
        }
        print(res.data);
        print("xxx");
      }

      fetch();
      return null;
    }, []);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Container(
            child: GridView.builder(
              shrinkWrap: true, // Allow GridView to wrap its contents
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                mainAxisSpacing: 10.0, // Spacing between rows
                crossAxisSpacing: 10.0, // Spacing between columns
                childAspectRatio: 5, // Adjust the aspect ratio as needed
              ),
              itemCount: refill.refill?.drugPrescription?.length ?? 0,
              itemBuilder: (context, index) {
                final refillHistory = refill.refill?.drugPrescription![index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white, // Background color for each item
                  ),
                  padding: EdgeInsets.all(6), // Padding of 6
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${refillHistory?.productName}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${refillHistory?.instruction}',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
