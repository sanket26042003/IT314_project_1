import 'package:flutter/material.dart';

class SalaryStatus extends StatelessWidget {
  const SalaryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 106, 238),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 106, 238),
        elevation: 0.0,
        title: const Text(
          "Salary Status",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        color: const Color.fromARGB(255, 46, 106, 238),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                width: double.infinity,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 46, 106, 238),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(100))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Sanket Doshi",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 7,
                        width: 7,
                      ),
                      Text(
                        "202001008",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1000,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200),
                      //topRight: Radius.circular(200)
                    )),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 30,
                      width: 30,
                    ),
                    SalaryDetailColumn(
                        title: 'Post', value: 'Group Representative'),
                    SalaryDetailColumn(
                        title: 'Monthly Salary', value: '1,25,000 INR'),
                    SalaryDetailColumn(
                        title: 'Number of work days (in a month)', value: '27'),
                    SalaryDetailColumn(title: 'Amount due', value: '1,700 INR'),
                    SalaryDetailColumn(
                        title: 'Net amount for this month',
                        value: '1,23,300 INR')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SalaryDetailColumn extends StatelessWidget {
  const SalaryDetailColumn(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 138, 137, 137)),
              ),
              const SizedBox(
                height: 7,
                width: 7,
              ),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 7,
                width: 7,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: const Divider(
                  thickness: 1.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
