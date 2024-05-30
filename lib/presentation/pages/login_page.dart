// login_page.dart
import 'package:fffff/presentation/widgets/textfiels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fffff/presentation/providers/login_provider.dart';


class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginNotifierProvider);
    final loginNotifier = ref.read(loginNotifierProvider.notifier);

    // Determine screen size
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 241, 230),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: screenSize.width,
              height: screenSize.height * 0.45,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/bgc_hotel.jpeg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(300),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Log in',
              style: TextStyle(
                color: Color.fromARGB(255, 95, 65, 65),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            TextFieldWidget(
              hintText: "Email",
              obscure: false,
              onChanged: (value) {
                loginNotifier.setEmail(value);
              },
            ),
            const SizedBox(height: 30),
            TextFieldWidget(
              hintText: 'Password',
              obscure: true,
              onChanged: (value) {
                loginNotifier.setPassword(value);
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 95, 65, 65),
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.go('/signup_page');
                  },
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Color.fromARGB(255, 95, 65, 65),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                try {
                  await loginNotifier.login();
                  // Check the role and navigate accordingly
                  final role = loginState.user?.role ?? 'unknown';
                  print('Navigating based on role: $role');
                  
                  if (role == 'admin') {
                    context.go('/admin_page');
                  } else if (role == 'customer') {
                    context.go('/home_page');
                  } else {
                    throw Exception('Unknown role');
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login failed: ${e.toString()}')),
                  );
                }
              },
              child: const Text(
                'L O G I N',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 93, 64, 50)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
