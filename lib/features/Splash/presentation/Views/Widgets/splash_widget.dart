import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Start the opacity animation after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0;
      });

      // Start a Timer to navigate to the next screen after a duration
      Timer(const Duration(seconds: 4), () {
        context.go('/onboarding'); // Use GoRouter to navigate to the onboarding screen
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                "assets/5902071679830575034.jpg",
                fit: BoxFit.cover,
              ),
            ),
            // The image in the center
            Center(
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 5), // Duration of the animation
                child: Image.asset(
                  "assets/LOGO FINAL 1.png",
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
