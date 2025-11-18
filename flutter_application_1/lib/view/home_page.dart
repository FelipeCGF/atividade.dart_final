import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 300,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "FinPlan",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Financeiro",
                style: TextStyle(
                  color: Color(0xFFFFF79A),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              Container(
                width: double.infinity,
                height: 380,
                decoration: BoxDecoration(
                  color: const Color(0xFF3D3DA6),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 20,
                      child: SizedBox(
                        width: 220,
                        child: Image.asset(
                          "assets/statue.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const Positioned(
                      left: 20,
                      top: 110,
                      child: Icon(Icons.star, color: Colors.white, size: 16),
                    ),
                    const Positioned(
                      right: 20,
                      bottom: 120,
                      child: Icon(Icons.star, color: Colors.white, size: 16),
                    ),

                    const Positioned(
                      right: 30,
                      top: 200,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFFBA1), Color(0xFFFFEA55)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
