import 'package:flutter/material.dart';
import 'package:assign/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: turjo(),
    debugShowCheckedModeBanner: false,
  ));
}


class turjo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Productdetails(),
      debugShowCheckedModeBanner: false,
    );
  }

}


class Productdetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ProductCard(
              name: 'iPhone 11 128GB (Singapore Unofficial)',
              image: 'https://www.startech.com.bd/image/cache/catalog/mobile/apple/iphone-11/iphone-11-black-500x500.webp',
              price: '৳68,500',
              features: [
                'Model: iPhone 11',
                'Display: 6.1" Liquid Retina HD display',
                'Processor: A13 Bionic Chip, Storage: 128GB',
                'Camera: 12MP + 12MP Rear, 12MP Front'
              ],
            ),
            SizedBox(height: 14),
            ProductCard(
              name: 'Vivo Y27e Smartphone (8/256GB)',
              image: 'https://www.startech.com.bd/image/cache/catalog/mobile/vivo/y27e/y27e-02-500x500.webp',
              price: '৳34,000',
              features: [
                'Model: Y27e',
                'Display: 6.62" FHD+120Hz Colour-Rich Display',
                'Processor: MediaTek Helio G99 (6 nm)',
              ],
            ),

            // Other widgets can be added here
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final List<String> features;

  ProductCard({
    required this.name,
    required this.image,
    required this.price,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Image.network(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 8),
            Text(
              'Price: $price',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Key Features:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: features.map((feature) => Text('- $feature')).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));
                // Implement your Buy Now action
              },
              child: Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BuyNowPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BuyNowPage extends StatefulWidget {
  @override
  _BuyNowPageState createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  String selectedPaymentMethod = 'BKash'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose Payment Method',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BkashPaymentMethodButton(
                  method: 'BKash',
                  onPressed: () => selectPaymentMethod('BKash'),
                ),
                rocketPaymentMethodButton(
                  method: 'Rocket',
                  onPressed: () => selectPaymentMethod('Rocket'),
                ),
                visaPaymentMethodButton(
                  method: 'Visa',
                  onPressed: () => selectPaymentMethod('Visa'),
                ),
                mcPaymentMethodButton(
                  method: 'Mastercard',
                  onPressed: () => selectPaymentMethod('Mastercard'),
                ),
                amexPaymentMethodButton(
                  method: 'AmEx',
                  onPressed: () => selectPaymentMethod('AmEx'),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


              ],
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedPaymentMethod,
              items: ['BKash', 'Rocket', 'Visa', 'Mastercard', 'AmEx']
                  .map((method) => DropdownMenuItem<String>(
                value: method,
                child: Text(method),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(top: 310.0),
              child: ElevatedButton(
                onPressed: () {
                  // Implement your logic for the "Go Back" button
                  Navigator.push(context,MaterialPageRoute(builder: (context) => turjo()));
                },
                child: Text('Go Back'),
              ),
            ),
            // Other widgets can be added here
          ],
        ),
      ),
    );
  }

  void selectPaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }
}

class BkashPaymentMethodButton extends StatelessWidget {
  final String method;
  final VoidCallback onPressed;

  BkashPaymentMethodButton({required this.method, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Image.asset(
        'lib/assets/Bkash.png',
       // Assuming you have images named 'BKash.png', 'Rocket.png', etc.
        height: 50,
        width: 50,
      ),
    );
  }
}

class rocketPaymentMethodButton extends StatelessWidget {
  final String method;
  final VoidCallback onPressed;

  rocketPaymentMethodButton({required this.method, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Image.asset(
        'lib/assets/rocket.png',
        // Assuming you have images named 'BKash.png', 'Rocket.png', etc.
        height: 50,
        width: 50,
      ),
    );
  }
}
class visaPaymentMethodButton extends StatelessWidget {
  final String method;
  final VoidCallback onPressed;

  visaPaymentMethodButton({required this.method, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Image.asset(
        'lib/assets/visa.png',
        // Assuming you have images named 'BKash.png', 'Rocket.png', etc.
        height: 50,
        width: 50,
      ),
    );
  }
}


class mcPaymentMethodButton extends StatelessWidget {
  final String method;
  final VoidCallback onPressed;

  mcPaymentMethodButton({required this.method, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Image.asset(
        'lib/assets/mastercard.png',
        // Assuming you have images named 'BKash.png', 'Rocket.png', etc.
        height: 50,
        width: 50,
      ),
    );
  }
}



class amexPaymentMethodButton extends StatelessWidget {
  final String method;
  final VoidCallback onPressed;

  amexPaymentMethodButton({required this.method, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Image.asset(
        'lib/assets/amex.png',
        // Assuming you have images named 'BKash.png', 'Rocket.png', etc.
        height: 50,
        width: 50,
      ),
    );
  }
}