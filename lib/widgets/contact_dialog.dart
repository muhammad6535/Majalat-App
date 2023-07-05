// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDialog extends StatefulWidget {
  final String name;
  final String howToContact;
  final String phoneNumber;
  final String volEmail;
  const ContactDialog(
      {required this.name,
      required this.howToContact,
      required this.phoneNumber,
      required this.volEmail,
      Key? key})
      : super(key: key);

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
              onTap: toggleInformation,
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
                height: showInformation ? 135 : 0,
                width: MediaQuery.of(context).size.width * 0.91,
                child: Text(
                    "طاقم ومتطوّعو مجالات هم هنا لمساعدتك. نرجو منك احترام وقتهم وعدم التواصل معهم لأجل أسئلة يمكن العثور على اجاباتها بسهولة عبر بحث بسيط في الانترنت (مثل معدّلات القبول مثلا).",
                    style: GoogleFonts.almarai(
                        height: 1.3,
                        letterSpacing: 0.5,
                        color: Colors.grey.shade800,
                        fontSize: 16))),
            buildElevatedButton()
          ],
        )
      ],
    );
  }

  Widget buildElevatedButton() {
    bool isWhatsApp = widget.howToContact.contains("الوتسأب");
    String firstName = widget.name.split(" ").first;
    String firstText =
        "سلام $firstName، وصلت إليك عن طريق موقع مجالات وأريد من فضلك أن أستشيرك بخصوص مجال دراستك وعملك. أرجو منك إخباري بالوقت المناسب للتواصل. شكرا جزيلا لك!";

    sendWhatsApp() async {
      Uri url =
          Uri.parse("https://wa.me/972${widget.phoneNumber}?text=$firstText");
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }

    sendEmail() async {
      Email email = Email(
          body: firstText,
          subject: "مجالات - مساعدة من فضلك",
          recipients: [widget.volEmail],
          isHTML: false);
      await FlutterEmailSender.send(email);
    }

    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          isWhatsApp ? sendWhatsApp() : sendEmail();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isWhatsApp ? FontAwesomeIcons.whatsapp : Icons.email,
              color: isWhatsApp ? Colors.white : Colors.grey.shade600,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              isWhatsApp
                  ? "رسالة وتسأب ل$firstName "
                  : "بريد الكتروني ل$firstName",
              style: GoogleFonts.almarai(
                  color: isWhatsApp ? Colors.white : Colors.grey.shade800),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isWhatsApp
              ? Color.fromARGB(255, 37, 211, 102)
              : Color(0xffffc107),
        ),
      ),
    );
  }
}
