// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({super.key});

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
                    fontSize: 22, fontWeight: FontWeight.bold),
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
            Container(
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
                    Icons.keyboard_arrow_down,
                    color: Colors.grey.shade500,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.91,
                child: ElevatedButton(
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
                      backgroundColor: Color(0xffffc107)),
                ))
          ],
        )
      ],
    );
  }
}
