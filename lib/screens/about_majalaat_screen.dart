// ignore_for_file: prefer_const_constructors, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/popup_menu_widget.dart';

class AboutMajalaatScreen extends StatelessWidget {
  const AboutMajalaatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('عن مجالات', style: GoogleFonts.almarai()),
              PopUpMenuWidget(
                currentPage: "about",
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 23),
            child: Column(
              children: [
                Text('مجالات',
                    style: GoogleFonts.almarai(
                        fontSize: 50, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 40,
                ),
                Text(
                    textAlign: TextAlign.center,
                    'مبادرة مجتمعيّة تهدف إلى مساعدة كلّ مقبل على التعليم في مجتمعنا العربي على اختيار المجال والمكان الدراسي الأنسب لميوله وطموحه وقدراته وظروفه.',
                    style: GoogleFonts.almarai(fontSize: 19, height: 1.2)),
                SizedBox(
                  height: 40,
                ),
                Container(
                    height: 0.8,
                    width: size.width * 0.7,
                    color: Colors.grey.shade400),
                SizedBox(
                  height: 60,
                ),
                Text(
                  'اختيار المجال الدراسيّ والمهنيّ هو من القرارات الحياتيّة المهمّة. ولا يخفى على أيّ منّا كم الحيرة والارتباك والتخبّط المصحوب به هكذا قرار.\n\n' +
                      'ولعّل من أفضل ما يساعد المقبل على التعليم على بلورة صورة أوضح حول المجال الذي يفكّر في دراسته هو استشارة الأشخاص من حوله وسؤال نصحهم.\n\n' +
                      'ولكّن العثور على الأشخاص المناسبين لاستشارتهم ليس بالسهل بتاتا، فالمجالات الدراسيّة والمعاهد الأكاديميّة متعدّدة جدا، وفي كثير من الأحيان يصعب على الشّخص العثور على أشخاص درسوا مجالا معيّنا في المؤسّسة التعليميّة المعني بها، أو أشخاص تشبه ظروفهم ظروفه.. أو لعلّه يبحث عن إجابات حول طبيعة العمل في المجال أو حول أمور السكن وغيرها..\n\n' +
                      'ومن هنا جاءت فكرة "مجالات"، وهي منصّة تهدف إلى مساعدة كلّ مقبل على التعليم في مجتمعنا العربي على اختيار المجال والمكان الدراسي الأنسب لميوله وطموحه وقدراته وظروفه. حيث تتيح النسخة الأولى من المنصّة إمكانيّة التشبيك والتواصل المباشر مع أشخاص خاضوا تجربة شبيهة لتلك التي يقف المقبل على التعليم على عتبتها، أو يدرسون الآن موضوعا في مؤسّسة يفكّر بالالتحاق بها، أو أشخاص تخرّجوا وعملوا في مجال لسنوات عدّة ويمكنهم تقديم النّصح حول العمل في المجال وطبيعته.\n\n' +
                      "طبعا، لا يمكن لمنصّة كهذه أن تنجح، أوأن تقوم حتّى، إلّا بتكاتف الجهود الخيّرة الكثير الموجودة داخل مجتمعنا. حيث أنّ من يقدّم يد النّصح والمشورة هم أنتم وأنتنّ أيها الأكاديميّون والأكاديميّات الأعزّاء. وهنا، نهيب بكم جميعا أن تساهموا عبر التسجيل في هذا النموذج وتكونوا عونا لطلّاب وأكاديمي المستقبل، لنخلق معا واقعا ومستقبلا أفضل لكلّ مقبل على التعليم عندنا ولمجتمعنا العربي برمّته!\n\n" +
                      "ومن يدري، فلعلّ دقيقة من وقتك تسدي بها نصيحة لمقبل على التعليم، تترك في مسيرته أثرا كبيرا، وتترك في صحيفة أعمالك خيرا كثيرا.\n\n" +
                      "بارك الله بكم، طاقم مجالات",
                  style: GoogleFonts.almarai(fontSize: 17, height: 1.3),
                  // textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    height: 0.8,
                    width: size.width * 0.7,
                    color: Colors.grey.shade400),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "ملاحظات:",
                      style: GoogleFonts.almarai(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6, right: 8),
                          child: Icon(Icons.circle, size: 12),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            'يمكن تعديل معطياتك في أي وقت بعد تسليم النموذج وذلك بالدخول إلى نفس هذا النموذج مستخدما بريدك الالكتروني.\n',
                            style:
                                GoogleFonts.almarai(fontSize: 15, height: 1.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6, right: 8),
                          child: Icon(Icons.circle, size: 12),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            'لضمان عدم إزعاجكم متطوّعينا الأعزّاء، فإنّ المنظومة تقوم بتحديد عدد الأشخاص الذين يستطيع المقبل على التعليم التواصل معهم في كلّ أسبوع.',
                            style:
                                GoogleFonts.almarai(fontSize: 15, height: 1.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                lastSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget lastSection() {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Text(
            "روابط إضافيّة:",
            style:
                GoogleFonts.almarai(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(right: 13),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6, right: 8),
                child: Icon(Icons.circle, size: 12),
              ),
              SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () async {
                  var url =
                      Uri.parse("https://majalaat.com/about/privacy-policy");
                  if (!await launchUrl(url,
                      mode: LaunchMode.externalApplication)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Text(
                    'سياسة الخصوصيّة',
                    style: GoogleFonts.almarai(
                      fontSize: 15,
                      height: 1.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(right: 13),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6, right: 8),
                child: Icon(Icons.circle, size: 12),
              ),
              SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () async {
                  var url =
                      Uri.parse("https://majalaat.com/about/terms-of-use");
                  if (!await launchUrl(url,
                      mode: LaunchMode.externalApplication)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Text(
                    'شروط الاستخدام',
                    style: GoogleFonts.almarai(
                      fontSize: 15,
                      height: 1.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
