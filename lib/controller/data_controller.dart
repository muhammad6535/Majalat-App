import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../widgets/Volunteer_Card.dart';

class DataController extends GetxController {
  List volunteers = [].obs;
  RxList<VolunteerCard> volunteersList = <VolunteerCard>[].obs;
  var helpfulLinks = [].obs;

  @override
  void onInit() {
    fetchVolunteers();
    fetchHelpfulLinks();
    super.onInit();
  }

  Future<void> fetchVolunteers() async {
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
        Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      Exception('Exception: $e');
    }
  }

  Future<void> fetchHelpfulLinks() async {
    try {
      final uri = Uri.parse(
          "https://script.google.com/macros/s/AKfycbwxsIeAByq256rUMcO300BJ5-clapa3oscEpUx5VQS7brxO9uETyFoyBDj98BSDDYE/exec?documentId=1mdCz50w0GuKWxGU9PEuvV-o614aAXksYELF4LCr1PX4&sheetName=useful-links");
      final response = await http.get(uri);
      if (response.statusCode >= 200 && response.statusCode <= 205) {
        var jsonResponse = jsonDecode(response.body);
        for (var link in jsonResponse) {
          helpfulLinks.add(link);
        }
      } else {
        Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      Exception('Exception: $e');
    }
  }

  void processVolunteers() {
    volunteersList.clear();

    for (var v in volunteers) {
      String? isApproved = v['approved'].toString();
      String? isShow = v['isshow'].toString();
      if (isApproved.contains("نعم") && isShow.contains("نعم")) {
        String? firstname = v['firstname'].toString();
        String? lastname = v['lastname'].toString();
        String? bio = v['bio'].toString();
        String? field = v['field'].toString();
        String? town = v['town'].toString();
        String? institute = v['institute'].toString();
        String photoId = "";
        String profileLink = "";
        String howToContact = "";
        String? phoneNumber = v['phone'].toString();
        if (true) {
          if (v['photourl'] != null) {
            photoId = v['photourl'].toString().split("=").last;
          }
          if (v['profilelink'] != null) {
            profileLink = v['profilelink'];
          }
          if (v['howtocontact'] != null) {
            howToContact = v['howtocontact'];
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
            howToContact: howToContact,
            phoneNumber: phoneNumber,
            email: v['email'].toString(),
          );
          volunteersList.add(vc);
        }
      }
    }
  }
}
