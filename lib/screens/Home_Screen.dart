// ignore_for_file: prefer_const_constructors, sort_child_properties_last, depend_on_referenced_packages, file_names, unused_local_variable, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:majalat_app/screens/volunteers_Screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majalat_app/widgets/app_bar_widget.dart';

import '../controller/data_controller.dart';
import '../controller/favorites_controller.dart';
import '../widgets/elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.put(DataController());

    FavoritesController favoritesController = Get.put(FavoritesController());
    Size size = MediaQuery.of(context).size;

    Widget showLoadingIcon() {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Center(
          child: SpinKitRing(
            color: Colors.blue,
            size: 100.0,
          ),
        ),
      );
    }

    Widget showPage() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 30,
            ),
            child: Text(
                "مبادرة مجتمعيّة تهدف إلى مساعدة كلّ مقبل ومقبلة على التعليم في مجتمعنا العربي على اختيار المجال والمكان الدراسي الأنسب لميولهم، طموحهم، قدراتم وظروفهم.",
                textAlign: TextAlign.center,
                style: GoogleFonts.almarai(
                  fontSize: 17,
                  color: Colors.black,
                  letterSpacing: 0.8,
                  height: 1.2,
                )),
          ),
          SizedBox(
            height: 17,
          ),
          Container(
              height: 0.7,
              color: Colors.grey.shade400,
              width: size.width * 0.75),
          SizedBox(
            height: 30,
          ),
          Obx(
            () => Text(dataController.volunteersList.length.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.almarai(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[850],
                  letterSpacing: 0.8,
                  height: 1.2,
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Text("متطوّع ومتطوّعة",
              textAlign: TextAlign.center,
              style: GoogleFonts.almarai(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0.8,
                height: 1.2,
              )),
          SizedBox(
            height: 20,
          ),
          Text("على أهبة الاستعداد لمساعدتك وتوجيهك",
              textAlign: TextAlign.center,
              style: GoogleFonts.almarai(
                fontSize: 17,
                color: Colors.black,
                letterSpacing: 0.2,
                height: 1.2,
              )),
          SizedBox(
            height: 22,
          ),
          ElevatedButtonWidget(
            id: 1,
            text: "تصفّح المتطوّعين",
            fontSize: 20,
            backgroundColor: Colors.blue.shade600,
            borderRadius: BorderRadius.circular(10),
            minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
            textColor: Colors.white,
            nextScreen: VolunteersScreen(),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              height: 0.7,
              color: Colors.grey.shade400,
              width: size.width * 0.75),
          SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 30,
            ),
            child: Obx(
              () => Text(
                  "يمكنك بسهولة الإنضمام إلى ${dataController.volunteersList.length.toString()} متطوّع ومتطوّعة في مجالات. فلعلّ دقيقة من وقتك تسدي بها نصيحة لمقبل على التعليم، تترك في مسيرته أثرا كبيرا، وتترك في صحيفة أعمالك خيرا كثيرا.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    color: Colors.black,
                    letterSpacing: 0.8,
                    height: 1.2,
                  )),
            ),
          ),
          ElevatedButtonWidget(
            id: 2,
            text: "الانضمام كمتطوّع\\ة",
            fontSize: 20,
            backgroundColor: Colors.yellow.shade800,
            borderRadius: BorderRadius.circular(10),
            textColor: Colors.grey.shade800,
            minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
            nextScreen: VolunteersScreen(),
          ),
        ],
      );
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: AppBarWidget(),
        ),
        body: Container(
          color: Color.fromARGB(183, 238, 242, 242),
          child: ListView(
            children: [
              Obx(() => dataController.volunteersList.isEmpty
                  ? showLoadingIcon()
                  : showPage())
            ],
          ),
        ),
      ),
    );
  }
}
