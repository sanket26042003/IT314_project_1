import 'package:flutter/material.dart';

class EmployeeLogin extends StatelessWidget {
  const EmployeeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: size.width,
        color: const Color.fromARGB(255, 46, 106, 238),
        child: Column(
          children: const [
            UserButton(),
            SizedBox(
              height: 25,
            ),
            WelcomeText(),
            SizedBox(
              height: 25,
            ),
            EmployeeLoginForm()
          ],
        ),
      ),
    );
  }
}

class EmployeeLoginForm extends StatefulWidget {
  const EmployeeLoginForm({
    super.key,
  });

  @override
  State<EmployeeLoginForm> createState() => _EmployeeLoginFormState();
}

class _EmployeeLoginFormState extends State<EmployeeLoginForm> {
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(children: [
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
              hintText: "Username",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              fillColor: Colors.white,
              filled: true),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          obscureText: passwordVisible,
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock_outlined,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(
                    () {
                      passwordVisible = !passwordVisible;
                    },
                  );
                },
              ),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              fillColor: Colors.white,
              filled: true),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 400,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 3,color: Colors.white)
            ),
            child: const Center(
              child: Text(
                "login",
                textScaleFactor: 1.1,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Welcome backe to nicher",
      textScaleFactor: 1.2,
      style: TextStyle(
          color: Color.fromARGB(255, 221, 221, 221),
          fontWeight: FontWeight.bold),
    );
  }
}

class UserButton extends StatelessWidget {
  const UserButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 50),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Center(
        child: SizedBox(
          width: 0.8 * size.width,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/welcome_page");
                },
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 46, 106, 238),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  width: 0.4 * size.width,
                  child: const Center(
                    child: Text(
                      "Employee",
                      textScaleFactor: 1.3,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 27, bottom: 27, right: 15, left: 15),
                  width: 0.4 * size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: const Color.fromARGB(255, 46, 106, 238),
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Manager",
                      textScaleFactor: 1.3,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
