import 'package:flutter/material.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({Key? key}) : super(key: key);

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Speed of scrolling
    )..repeat(); // Repeat animation endlessly
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logos = [
      'assets/max1.png',
      'assets/bewakoof1.png',
      'assets/nike1.png',
      'assets/thesouledstore1.png',
      'assets/puma1.png',
      'assets/allensolley1.png',
      'assets/levis1.png',
      'assets/zara1.png', 
    ];

    return Stack(
      children: [
        // Background image
        Image.asset(
          'assets/realbanner.png',
          width: MediaQuery.of(context).size.width,
          height: 250,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Shop your favorite Brands and Get Your Orders Delivered in 60mins!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 70, // Height of the logo row
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                        -(_controller.value *
                            MediaQuery.of(context).size.width),
                        0,
                      ),
                      child: Row(
                        children: List.generate(
                          logos.length * 2, // Repeat logos for smooth scrolling
                          (index) {
                            final logo = logos[index % logos.length];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(
                                logo,
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
