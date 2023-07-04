import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../widgets/Volunteer_Card.dart';

class DataController extends GetxController {
  List volunteers = [].obs;
  RxList<VolunteerCard> volunteersList = <VolunteerCard>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      final uri = Uri.parse(
          "https://script.googleusercontent.com/macros/echo?user_content_key=bmWYgq7fc1-KhKMjX4T6mlQWz-qM13OeJ7DJvq_nGOlhKMZgMIIbRM1pxYqwiknCpBdIRa8Y3b9U4eVtMr2bBPMd91PIySCJOJmA1Yb3SEsKFZqtv3DaNYcMrmhZHmUMWojr9NvTBuBLhyHCd5hHawEWDM8EPhJ2zFOeshOKUcOcj4rbst4RBwHvK2knwHrWgcmbpCasxocYk2KUeg7z6UnbuUjv142WQJ9bV1QhVOA__-sXW75bhT3E3kYt1sMjTVkcu_ZVxVFQ5BTrN9IDYGOIC7gsDTYl01fY5YxzMK_Y4H7_OZILEGMSNSk7-Ltf72FxovwMOQKD-t5WvKpjt9D8AW0jUIFI&lib=MfSIUdNeHWSw9vH6Lawe1aPGWYEKb6JDU");
      final response = await http.get(uri);

      if (response.statusCode >= 200 && response.statusCode <= 205) {
        var jsonResponse = jsonDecode(response.body);
        for (var volunteer in jsonResponse) {
          volunteers.add(volunteer);
        }
        processVolunteers();
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  void processVolunteers() {
    volunteersList.clear();

    for (var v in volunteers) {
      if (v['approved'] != null &&
          v['approved']!.toString().contains('نعم') &&
          v['isshow'] != null &&
          v['isshow'].toString().contains("نعم") &&
          v['isacceptterms'] != null &&
          v['isacceptterms'].toString().contains("نعم")) {
        String? firstname = v['firstname'];
        String? lastname = v['lastname'];
        String? bio = v['bio'];
        String? field = v['field'];
        String? town = v['town'];
        String? institute = v['institute'];
        String photoId = "";
        String profileLink = "";
        if (firstname != null &&
            lastname != null &&
            bio != null &&
            field != null &&
            town != null &&
            institute != null) {
          if (v['photourl'] != null) {
            photoId = v['photourl'].toString().split("=").last;
          }
          if (v['profilelink'] != null) {
            profileLink = v['profilelink'];
          }
          VolunteerCard vc = VolunteerCard(
            name: '$firstname $lastname',
            description: "$field - $institute",
            majodOfStudy: field,
            summary: bio,
            city: town,
            universityName: institute,
            photoId: photoId,
            profileLink: profileLink,
          );
          volunteersList.add(vc);
        }
      }
    }
  }
}
