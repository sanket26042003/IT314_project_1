import 'package:flutter/material.dart';

class ManagerSalaryStatus extends StatelessWidget {
    final Map<String,dynamic>data;

  const ManagerSalaryStatus({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 106, 238),
        elevation: 0.0,
        title: const Text(
          "Salary Status",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return  MobileBody(data: data,);
          } else {
            print(data);
            return  DesktopBody(data: data,);
          }
        },
      ),
    );
  }
}

class DesktopBody extends StatelessWidget {
  final Map<String,dynamic>data;
  const DesktopBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      color: Colors.white,
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
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(75),
                        bottomLeft: Radius.circular(75))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      data['ManagerName'],
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
                      "${data['ManagerID']}",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    height: 550,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(75),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 174, 172, 172),
                            blurRadius: 50,
                            offset: Offset(0, 10),
                          )
                        ]),
                    child: Column(
                      children:  [
                        SizedBox(
                          height: 30,
                          width: 30,
                        ),
                        SalaryDetailColumnD(
                            title: 'Department', value: "${data['Department']}"),
                        SalaryDetailColumnD(title: 'Project', value: "Project"),
                        SalaryDetailColumnD(
                            title: 'Monthly Salary', value: "${data['Salary']}"),
                        SalaryDetailColumnD(
                            title: 'Number of absent days (in a month)',
                            value: "${data['AbsentDates'].length}"),
                        SalaryDetailColumnD(
                            title: 'Amount to be credited',
                            value: "${data['Salary']}")
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MobileBody extends StatelessWidget {
  final Map<String,dynamic>data;
  const MobileBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(75),
                        bottomLeft: Radius.circular(75))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                       data['ManagerName'],
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
                   "${data['ManagerID']}",
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
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children:  [
                  SizedBox(
                    height: 30,
                    width: 30,
                  ),
                  SalaryDetailColumn(title: 'Department', value: "${data['Department']}"),
                  SalaryDetailColumn(title: 'Project', value:"project"),
                  SalaryDetailColumn(
                      title: 'Monthly Salary', value: "${data['Salary']}"),
                  SalaryDetailColumn(
                      title: 'Number of absent days (in a month)', value: "${data['AbsentDates'].length}"),
                  SalaryDetailColumn(
                      title: 'Amount to be credited', value:"${data['Salary']}")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SalaryDetailColumnD extends StatelessWidget {
  const SalaryDetailColumnD(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 138, 137, 137),
                ),
                textAlign: TextAlign.center,
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
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 7,
                width: 7,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
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
