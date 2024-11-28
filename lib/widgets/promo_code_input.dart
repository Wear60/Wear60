import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class PromoCodeInput extends StatefulWidget {
  const PromoCodeInput({Key? key}) : super(key: key);

  @override
  _PromoCodeInputState createState() => _PromoCodeInputState();
}

class _PromoCodeInputState extends State<PromoCodeInput> {
  // Remove lateinit and provide a default initialization
  ConfettiController _confettiController = ConfettiController(
    duration: const Duration(seconds: 2)
  );
  
  TextEditingController _controller = TextEditingController();
  String _errorMessage = '';

  @override
  void dispose() {
    // Dispose of the controllers
    _confettiController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter Promo Code:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Promo Code',
                  border: const OutlineInputBorder(),
                  errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate and handle promo code
                  String promoCode = _controller.text;
                  if (promoCode.isEmpty) {
                    setState(() {
                      _errorMessage = 'Promo code cannot be empty!';
                    });
                  } else {
                    setState(() {
                      _errorMessage = '';  // Clear error if valid
                    });
                    // Trigger confetti animation
                    _confettiController.play();
                    
                    // Handle promo code logic here (e.g., submit the code)
                    print('Promo Code: $promoCode');
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
        
        // Confetti Animation
        ConfettiWidget(
          confettiController: _confettiController,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.pink,
            Colors.orange,
            Colors.purple
          ],
        ),
      ],
    );
  }
}