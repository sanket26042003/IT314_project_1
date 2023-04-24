import 'package:flutter/material.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 46, 106, 238),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 46, 106, 238),
          elevation: 0.0,
          title: Center(
            child: const Text(
              "nicher SaaS",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
          )),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            Container(
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.all(Radius ),
                          ),
                      width: 500,
                      //                   ClipRRect(
                      // borderRadius: BorderRadius.circular(8.0),
                      // child: Image.network(
                      //     subject['images']['large'],
                      //     height: 150.0,
                      //     width: 100.0,
                      // ),
// ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(75)),
                        child: Image.network(
                          // "assets/nicherSaaS_1.jpg",
                          "https://picsum.photos/200",
                          height: 400,
                          width: 400,
                          scale: 0.5,
                          fit: BoxFit.fill,
                        ),
                      ),
                      // Image.network(
                      //   // "assets/nicherSaaS_1.jpg",
                      //   "https://picsum.photos/200",
                      //   height: 400,
                      //   width: 400,
                      //   scale: 0.5,
                      //   // fit: BoxFit.fill,
                      // ),
                    ),
                    Container(
                        width: 500,
                        padding: EdgeInsets.only(left: 80),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About Us',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 46, 106, 238),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),

                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "\t\t\t\t\t\t Welcome to nicher Saas, the ultimate solution for managing employee information and payroll needs.\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                                "\t\t\t\t\t\t At nicher Saas, we are committed to providing our clients with top-of-the-line software that streamlines the HR processes and simplifies the management of employee information. Our state-of-the-art Saas platform offers a range of features that enable businesses to manage employee information, track their leave and attendance status, and manage their payroll with ease.\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                            // Text(
                            //     "\t\t\t\t\t\t At nicher Saas, we believe that technology can transform the way businesses operate. We are proud to be at the forefront of this transformation, providing our clients with the tools they need to thrive in an ever-changing business environment. We are committed to excellence and look forward to partnering with you to help your business succeed.\n",
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold, fontSize: 14)),
                            // Container(
                            //   padding: EdgeInsets.only(left: 50),
                            //   child:
                            // ),
                            // const SizedBox(
                            // height: 30,
                            // ),
                            // Container(
                            //   padding: EdgeInsets.only(left: 50, top: 30),
                            //   width: 600,
                            // child: Text(
                            //     "Welcome to Nicher Saas, the ultimate solution for managing employee information and payroll needs."),
                            // Text(
                            //     "At Nicher Saas, we are committed to providing our clients with top-of-the-line software that streamlines the HR processes and simplifies the management of employee information. Our state-of-the-art Saas platform offers a range of features that enable businesses to manage employee information, track their leave and attendance status, and manage their payroll with ease."),
                            // Text(
                            //     "Our team of experts comprises experienced software developers, HR professionals, and payroll experts, who work tirelessly to deliver an unparalleled experience to our clients. We understand the complexities of managing employee information and payroll, and our platform is designed to simplify these processes, saving businesses valuable time and resources."),
                            // Text(
                            //     "Our commitment to our clients is what sets us apart. We understand that every business has unique needs, and our platform is designed to be customizable to meet those needs. Our customer support team is available 24/7 to provide our clients with the assistance they need, whether it's troubleshooting an issue or providing guidance on how to use our platform."),
                            // Text(
                            //     "At Nicher Saas, we believe that technology can transform the way businesses operate. We are proud to be at the forefront of this transformation, providing our clients with the tools they need to thrive in an ever-changing business environment. We are committed to excellence and look forward to partnering with you to help your business succeed."),
                            // )
                          ],
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
