import 'package:flutter/material.dart';

class ManualAdd extends StatefulWidget {
  const ManualAdd({Key? key}) : super(key: key);

  @override
  State<ManualAdd> createState() => _ManualAddState();
}

class _ManualAddState extends State<ManualAdd> {
  // TextEditingController to manage the input text in the TextFields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedStartTime) {
      setState(() {
        selectedStartTime = pickedTime;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedEndTime) {
      setState(() {
        selectedEndTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Schedule'),
      ),
      body: Container(
        color: Colors.white, // Background color set to white
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLabeledTextFormField(
              label: 'Name',
              controller: nameController,
              hintText: 'Enter name',
              boxWidth: 120, // Set the width of the TextFormField box
              spaceBetween:
                  4, // Reduce the space between the label and the TextFormField
            ),
            SizedBox(height: 16),
            buildLabeledTextFormField(
              label: 'Course',
              controller: courseController,
              hintText: 'Enter course',
              boxWidth: 120, // Set the width of the TextFormField box
              spaceBetween:
                  4, // Reduce the space between the label and the TextFormField
            ),
            SizedBox(height: 16),
            buildLabeledTextFormField(
              label: 'Subject',
              controller: subjectController,
              hintText: 'Enter subject',
              boxWidth: 120, // Set the width of the TextFormField box
              spaceBetween:
                  4, // Reduce the space between the label and the TextFormField
            ),
            SizedBox(height: 16),
            buildLabeledDate(
              label: 'Date',
              selectedDate: selectedDate,
              onTap: () => _selectDate(context),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                buildLabeledSmallBox(
                  label: 'Start',
                  selectedTime: selectedStartTime,
                  onTap: () => _selectStartTime(context),
                ),
                SizedBox(width: 8),
                buildLabeledSmallBox(
                  label: 'End',
                  selectedTime: selectedEndTime,
                  onTap: () => _selectEndTime(context),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle "reserve" button tap
                    // Here you can use the values from the text fields
                    // to perform the reservation logic
                  },
                  child: Text('Reserve'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle "cancel" button tap
                    Navigator.pop(context); // Close the ManualAdd screen
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabeledTextFormField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required double boxWidth, // Pass the desired width of the TextFormField box
    required double
        spaceBetween, // Pass the desired space between the label and the TextFormField
  }) {
    return Row(
      children: [
        SizedBox(
          width: boxWidth,
          child: Text(
            label + ':',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: spaceBetween),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLabeledDate({
    required String label,
    required DateTime? selectedDate,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label + ':',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedDate != null
                        ? "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"
                        : 'Select date',
                  ),
                  Icon(Icons.calendar_today),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLabeledSmallBox({
    required String label,
    required TimeOfDay? selectedTime,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 35), // Adjust the value as needed
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label + ':',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: onTap,
              child: Container(
                width: 140,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedTime != null
                          ? selectedTime.format(context)
                          : 'Select time',
                    ),
                    Icon(Icons.access_time),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//addmanual
