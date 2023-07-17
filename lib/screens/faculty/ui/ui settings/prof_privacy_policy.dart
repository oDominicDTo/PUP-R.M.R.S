import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final String privacyPolicy = '''
Our team built the PUPBC Room Reservation app as a Free app. This SERVICE is provided by us at no cost and is intended for use to the Polytechnic University of the Philippines Biñan Campus.

This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.

If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.

The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at PUPBC Room Reservation App unless otherwise defined in this Privacy Policy.

''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Container(
        color: kMainPrimaryColor,
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'USER PRIVACY',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: privacyPolicy,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: '\n\nOTHERS\n\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildTableOfContentsLink(
                      'LOG DATA\n',
                      'LOG DATA',
                      'We want to inform users that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.'     ),
                    _buildTableOfContentsLink('SERVICE PROVIDER\n',
                      'SERVICE PROVIDER', '''We may employ third-party companies and individuals due to the following reasons:
*   To facilitate our Service;
*   To provide the Service on our behalf;
*   To perform Service-related services; or
*   To assist us in analyzing how our Service is used.

We want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.'''
                    ),
                    _buildTableOfContentsLink('SECURITY\n',
                      'SECURITY',
                      'We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.',
                    ),
                    _buildTableOfContentsLink('CHANGES TO PRIVACY POLICY\n',
                      'CHANGES TO THIS PRIVACY POLICY',
                      '''W'e may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.

This policy is effective as of 2023-07-10'''
                    ),
                    _buildTableOfContentsLink('CONTACT US\n',
                      'CONTACT US',
                      'If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at OurTeamsG2@gmail.com.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan _buildTableOfContentsLink(
      String title,
      String sectionTitle,
      String sectionText,
      ) {
    return TextSpan(
      text: title,
      style: TextStyle(
        color: Colors.blue,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          _navigateToSection(sectionTitle, sectionText);
        },
    );
  }

  void _navigateToSection(String sectionTitle, String sectionText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(sectionTitle),
          content: SingleChildScrollView(
            child: Text(sectionText),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
