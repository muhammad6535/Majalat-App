// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactDialog extends StatefulWidget {
  const ContactDialog({Key? key}) : super(key: key);

  @override
  _ContactDialogState createState() => _ContactDialogState();
}

class _ContactDialogState extends State<ContactDialog> {
  bool showInformation = false;

  void toggleInformation() {
    setState(() {
      showInformation = !showInformation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "تأكيد التواصل",
                style: GoogleFonts.almarai(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
      contentPadding: const EdgeInsets.all(20),
      children: [
        Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "لراحتك، يتم إدراج رسالة معدّة مسبقا عند ضغطك على كبسة التواصل، حيث يمكنك ارسالها مباشرة.",
              style: GoogleFonts.almarai(fontSize: 16, letterSpacing: 0.5),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              "لا تقلق، لا يتم ارسال الرسالة تلقائيا. يمكنك مراجعتها وتعديلها قبل الإرسال.",
              style: GoogleFonts.almarai(fontSize: 16, letterSpacing: 0.5),
            ),
            SizedBox(
              height: 35,
            ),
            GestureDetector(
              onTap: toggleInformation, // Toggle the visibility
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
                width: MediaQuery.of(context).size.width * 0.95,
                // height: 15,
                color: Colors.grey.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.grey.shade500,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "نصيحة قبل التواصل",
                          style: GoogleFonts.almarai(),
                        ),
                      ],
                    ),
                    Icon(
                      showInformation
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height:
                    showInformation ? 135 : 0, // Set height to 0 when hidden
                width: MediaQuery.of(context).size.width * 0.91,
                child: Container(
                  child: Text(
                      "طاقم ومتطوّعو مجالات هم هنا لمساعدتك. نرجو منك احترام وقتهم وعدم التواصل معهم لأجل أسئلة يمكن العثور على اجاباتها بسهولة عبر بحث بسيط في الانترنت (مثل معدّلات القبول مثلا).",
                      style: GoogleFonts.almarai(
                          height: 1.3,
                          letterSpacing: 0.5,
                          color: Colors.grey.shade800,
                          fontSize: 16)),
                )),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "بريد الكتروني",
                    style: GoogleFonts.almarai(color: Colors.grey.shade800),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffffc107),
              ),
            ),
          ],
        )
      ],
    );
  }
}
