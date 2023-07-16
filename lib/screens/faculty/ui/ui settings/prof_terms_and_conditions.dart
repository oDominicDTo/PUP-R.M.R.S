import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:appdevelopment/constants.dart';

class TermsandConditions extends StatefulWidget {
  @override
  _TermsandConditionsState createState() => _TermsandConditionsState();
}

class _TermsandConditionsState extends State<TermsandConditions> {
  final String termsAndConditionsText = '''
We are students of Polytechnic University of the Philippines Binan Campus.

We operate the mobile application PUP Room Monitoring , as well as any other related products and services that refer or link to these legal terms.

You can contact us by email at __________ or by mail to __________, __________, Philippines.

These Legal Terms constitute a legally binding agreement made between you, whether personally or on behalf of an entity, and __________, concerning your access to and use of the Services. You agree that by accessing the Services, you have read, understood, and agreed to be bound by all of these Legal Terms. IF YOU DO NOT AGREE WITH ALL OF THESE LEGAL TERMS, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE SERVICES AND YOU MUST DISCONTINUE USE IMMEDIATELY.

Supplemental terms and conditions or documents that may be posted on the Services from time to time are hereby expressly incorporated herein by reference. We reserve the right, in our sole discretion, to make changes or modifications to these Legal Terms at any time and for any reason. We will alert you about any changes by updating the "Last updated" date of these Legal Terms, and you waive any right to receive specific notice of each such change. It is your responsibility to periodically review these Legal Terms to stay informed of updates. You will be subject to, and will be deemed to have been made aware of and to have accepted, the changes in any revised Legal Terms by your continued use of the Services after the date such revised Legal Terms are posted.

The Services are intended for users who are at least 18 years old. Persons under the age of 18 are not permitted to use or register for the Services.

''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Term\'s and Conditions'),
      ),
      body: Container(
        color: kMainPrimaryColor,
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AGREEMENT TO OUR LEGAL TERMS',
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
                  text: termsAndConditionsText,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: '\n\nTABLE OF CONTENTS\n\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildTableOfContentsLink(
                      '1. OUR SERVICES\n',
                      'OUR SERVICES',
                      'The information provided when using the Services is not intended for distribution to or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation or which would subject us to any registration requirement within such jurisdiction or country. Accordingly, those persons who choose to access the Services from other locations do so on their own initiative and are solely responsible for compliance with local laws, if and to the extent local laws are applicable.',
                    ),
                    _buildTableOfContentsLink('2. INTELLECTUAL PROPERTY RIGHTS\n',
                      'INTELLECTUAL PROPERTY RIGHTS',
                      'Our intellectual property'
                          'We are the owner or the licensee of all intellectual property rights in our Services, including all source code, databases, functionality, software, website designs, audio, video, text, photographs, and graphics in the Services (collectively, the "Content"), as well as the trademarks, service marks, and logos contained therein ',
                    ),
                    _buildTableOfContentsLink('3. USER REPRESENTATIONS\n',
                      'USER REPRESENTATIONS',
                      'By using the Services, you represent and warrant that: (1) you have the legal capacity and you agree to comply with these Legal Terms; (2) you are not a minor in the jurisdiction in which you reside; (3) you will not access the Services through automated or non-human means, whether through a bot, script or otherwise; (4) you will not use the Services for any illegal or unauthorized purpose; and (5) your use of the Services will not violate any applicable law or regulation.'
                          'If you provide any information that is untrue, inaccurate, not current, or incomplete, we have the right to suspend or terminate your account and refuse any and all current or future use of the Services (or any portion thereof).',
                    ),
                    _buildTableOfContentsLink('4. PROHIBITED ACTIVITIES\n',
                      'PROHIBITED ACTIVITIES',
                      '''- Systematically retrieve data or other content from the Services to create or compile, directly or indirectly, a collection, compilation, database, or directory without written permission from us.
- Trick, defraud, or mislead us and other users, especially in any attempt to learn sensitive account information such as user passwords.
- Circumvent, disable, or otherwise interfere with security-related features of the Services, including features that prevent or restrict the use or copying of any Content or enforce limitations on the use of the Services and/or the Content contained therein.
- Disparage, tarnish, or otherwise harm, in our opinion, us and/or the Services.
- Use any information obtained from the Services in order to harass, abuse, or harm another person.
- Make improper use of our support services or submit false reports of abuse or misconduct.
- Use the Services in a manner inconsistent with any applicable laws or regulations.
- Engage in unauthorized framing of or linking to the Services.
- Upload or transmit (or attempt to upload or to transmit) viruses, Trojan horses, or other material, including excessive use of capital letters and spamming (continuous posting of repetitive text), that interferes with any party’s uninterrupted use and enjoyment of the Services or modifies, impairs, disrupts, alters, or interferes with the use, features, functions, operation, or maintenance of the Services.
- Engage in any automated use of the system, such as using scripts to send comments or messages, or using any data mining, robots, or similar data gathering and extraction tools.
- Delete the copyright or other proprietary rights notice from any Content.
- Attempt to impersonate another user or person or use the username of another user.
- Upload or transmit (or attempt to upload or to transmit) any material that acts as a passive or active information collection or transmission mechanism, including without limitation, clear graphics interchange formats ("gifs"), 1×1 pixels, web bugs, cookies, or other similar devices (sometimes referred to as "spyware" or "passive collection mechanisms" or "pcms").
- Interfere with, disrupt, or create an undue burden on the Services or the networks or services connected to the Services.
- Harass, annoy, intimidate, or threaten any of our employees or agents engaged in providing any portion of the Services to you.
- Attempt to bypass any measures of the Services designed to prevent or restrict access to the Services, or any portion of the Services.
- Copy or adapt the Services' software, including but not limited to Flash, PHP, HTML, JavaScript, or other code.
- Except as permitted by applicable law, decipher, decompile, disassemble, or reverse engineer any of the software comprising or in any way making up a part of the Services.
- Except as may be the result of standard search engine or Internet browser usage, use, launch, develop, or distribute any automated system, including without limitation, any spider, robot, cheat utility, scraper, or offline reader that accesses the Services, or use or launch any unauthorized script or other software.
- Use a buying agent or purchasing agent to make purchases on the Services.
- Make any unauthorized use of the Services, including collecting usernames and/or email addresses of users by electronic or other means for the purpose of sending unsolicited email, or creating user accounts by automated means or under false pretenses.
- Use the Services as part of any effort to compete with us or otherwise use the Services and/or the Content for any revenue-generating endeavor or commercial enterprise.
  ''',
                    ),
                    _buildTableOfContentsLink('5. USER GENERATED CONTRIBUTIONS\n',
                      'USER GENERATED CONTRIBUTIONS',
                      'Section 5 content goes here.',
                    ),
                    _buildTableOfContentsLink('6. CONTRIBUTION LICENSE\n',
                      'CONTRIBUTION LICENSE',
                      'Section 6 content goes here.',
                    ),
                    _buildTableOfContentsLink('7. MOBILE APPLICATION LICENSE\n',
                      'MOBILE APPLICATION LICENSE',
                      'Section 7 content goes here.',
                    ),
                    _buildTableOfContentsLink('8. SERVICES MANAGEMENT\n',
                      'SERVICES MANAGEMENT',
                      'Section 8 content goes here.',
                    ),
                    _buildTableOfContentsLink('9. PRIVACY POLICY\n',
                      'PRIVACY POLICY',
                      'Section 9 content goes here.',
                    ),
                    _buildTableOfContentsLink('10. TERM AND TERMINATION\n',
                      'TERM AND TERMINATION',
                      'Section 10 content goes here.',
                    ),
                    _buildTableOfContentsLink('11. MODIFICATIONS AND INTERRUPTIONS\n',
                      'MODIFICATIONS AND INTERRUPTIONS',
                      'Section 11 content goes here.',
                    ),
                    _buildTableOfContentsLink('12. GOVERNING LAW\n',
                      'GOVERNING LAW',
                      'Section 12 content goes here.',
                    ),
                    _buildTableOfContentsLink('13. DISPUTE RESOLUTION\n',
                      'DISPUTE RESOLUTION',
                      'Section 13 content goes here.',
                    ),
                    _buildTableOfContentsLink('14. CORRECTIONS\n',
                      'CORRECTIONS',
                      'Section 14 content goes here.',
                    ),
                    _buildTableOfContentsLink('15. DISCLAIMER\n',
                      'DISCLAIMER',
                      'Section 15 content goes here.',
                    ),
                    _buildTableOfContentsLink('16. LIMITATIONS OF LIABILITY\n',
                      'LIMITATIONS OF LIABILITY',
                      'Section 16 content goes here.',
                    ),
                    _buildTableOfContentsLink('17. INDEMNIFICATION\n',
                      'INDEMNIFICATION',
                      'Section 17 content goes here.',
                    ),
                    _buildTableOfContentsLink('18. USER DATA\n',
                      'USER DATA',
                      'Section 18 content goes here.',
                    ),
                    _buildTableOfContentsLink('19.ELECTRONICCOMMUNICATIONS, TRANSACTIONS, AND SIGNATURES',
                      'ELECTRONIC COMMUNICATIONS, TRANSACTIONS, AND SIGNATURES',
                      'Section 19 content goes here.',
                    ),
                    _buildTableOfContentsLink('\n20. MISCELLANEOUS\n',
                      'MISCELLANEOUS',
                      'Section 20 content goes here.',
                    ),
                    _buildTableOfContentsLink('21. CONTACT US\n',
                      'CONTACT US',
                      'Section 21 content goes here.',
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
