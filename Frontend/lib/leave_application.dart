import 'package:flutter/material.dart';

void main() {
  runApp(const LeaveApp());
}

class LeaveApp extends StatelessWidget {
  const LeaveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Leave Application',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _startDate;
  int? start_date;
  int? start_month;
  int? start_year;

  DateTime? _lastDate;
  int? last_date;
  int? last_month;
  int? last_year;

  void _startDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2025))
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _startDate = pickedDate;
        start_date = _startDate!.day;
        start_month = _startDate!.month;
        start_year = _startDate!.year;
      });
    });
  }

  String selectedValue = "Others";
  String currentText = "";
  void _lastDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2025))
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _lastDate = pickedDate;
        last_date = _lastDate!.day;
        last_month = _lastDate!.month;
        last_year = _lastDate!.year;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 46, 106, 238),
              elevation: 0.0,
              title: const Text(
                "Leave Application",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Employee ID: ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("4",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ]),
                    SizedBox(
                      child: Divider(thickness: 1),
                    ),
                    // Show the Date Picker when this button clicked
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Select the start date of Leave",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ElevatedButton(
                    //   onPressed: _presentDatePicker,
                    //   child: const Text('Select Date'),
                    // ),
                    Row(
                      children: [
                        Text(
                          "Selected Date: ${start_date != null ? start_date : "00"}/${start_month != null ? start_month : "00"}/${start_year != null ? start_year : "0000"}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          //button///////////////
                          height: 40,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: _startDatePicker,
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  const Color.fromARGB(255, 46, 106, 238),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Start Date",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                      child: Divider(thickness: 1),
                    ),

                    //////////////////////////////////////////////////////////////////
                    ////////////////////2nd date choose/////////////////////////////
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Select the last date of Leave",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ElevatedButton(
                    //   onPressed: _presentDatePicker,
                    //   child: const Text('Select Date'),
                    // ),
                    Row(
                      children: [
                        Text(
                          "Selected Date: ${last_date != null ? last_date : "00"}/${last_month != null ? last_month : "00"}/${last_year != null ? last_year : "0000"}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          //button///////////////
                          height: 40,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: _lastDatePicker,
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  const Color.fromARGB(255, 46, 106, 238),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Last Date",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                      child: Divider(thickness: 1),
                    ),
                    /////////////////////////2nd date choose over///////////////
                    /////////////////////////
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Leave Type: ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          DropdownButton(
                              // 'Medical', 'WFH', 'Parental', 'Others'
                              value: selectedValue,
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    "Medical",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  value: "Medical",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "WFH",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  value: "WFH",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "Parental",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  value: "Parental",
                                ),
                                DropdownMenuItem(
                                    child: Text(
                                      "Others",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: "Others"),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value!;
                                });
                              }),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    //   child: Divider(thickness: 1),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    /////////////////////////////dropdown over/////////////
                    /////////////////////////////////////////////
                    // Container(
                    //     child: Row(
                    //   children: [
                    //     Text(
                    //       "Remarks: ",
                    //       style: TextStyle(
                    //           fontSize: 20, fontWeight: FontWeight.bold),
                    //     ),
                    //     TextFormField(
                    //       decoration: InputDecoration(
                    //           border: OutlineInputBorder(),
                    //           labelText: "Write Details"),
                    //       onChanged: (text) => setState(() {
                    //         currentText = text;
                    //       }),
                    //     )
                    //   ],
                    // )),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      //button///////////////
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              const Color.fromARGB(255, 46, 106, 238),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Submit",
                          textScaleFactor: 1.3,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ]),
            )));
  }
}

// ///////////////////////////////////////
// class DropDownExample extends StatefulWidget {
//   DropDownExample({Key key}) : super(key: key);

//   @override
//   _DropDownExampleState createState() => _DropDownExampleState();
// }

// class _DropDownExampleState extends State<DropDownExample> {
//   int selectedValue = 1;
// }
