import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth/Presentation/Logic/authlogic.dart';
import 'package:flutter_application_2/auth/Presentation/Widgets/Auth/login/login.dart';
import 'package:get/get.dart';

import '../../../../../Core/ReuseableComponent/text_form_field_widget.dart';

class Signup_Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LoginForm(),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text_Feild(
            prefixicon: Icons.mail,
            controller: _emailController,
            labelText: 'Email',
            multiLines: false,
          ),
          SizedBox(height: 16),
          Text_Feild(
            prefixicon: Icons.phone,
            controller: _phoneController,
            labelText: 'Phone',
            multiLines: false,
          ),
          SizedBox(height: 16),
          Text_Feild(
            prefixicon: Icons.person,
            controller: _usernameController,
            labelText: 'User name',
            multiLines: false,
          ),
          SizedBox(height: 16),
          Text_Feild(
            suffixicon: Icons.remove_red_eye_outlined,
            prefixicon: Icons.key,
            controller: _passwordController,
            labelText: 'password',
            multiLines: false,
          ),
          SizedBox(height: 7),
          GetBuilder<AuthController>(
              builder: (controller) => Row(
                    children: [
                      Checkbox(
                        value: controller.checkdriver,
                        onChanged: (value) => controller.change_checkbox(value),
                      ),
                      Text('Are you Driver ?')
                    ],
                  )),
          GetBuilder<AuthController>(
            builder: (controller) => ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  controller.register(
                      driver: controller.checkdriver,
                      phone: _phoneController.text,
                      username: _usernameController.text,
                      email: _emailController.text,
                      password: _passwordController.text);
                }
              },
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 400,
                  height: 50.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: !controller.loading
                            ? [Colors.blue, Colors.blue.shade100]
                            : [Colors.blueGrey.shade100, Colors.blueGrey]),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: !controller.loading
                        ? const Text(
                            'Login',
                            style: TextStyle(),
                          )
                        : const Text('Please Wait...'),
                  )),
            ),
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have account '),
              TextButton(
                  onPressed: () {
                    Get.off(LoginPage());
                  },
                  child: Text('Login Now'))
            ],
          )
        ],
      ),
    );
  }
}
