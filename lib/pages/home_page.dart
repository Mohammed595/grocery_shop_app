import 'package:flutter/material.dart';
import 'package:grocery_shop_app/componats/card_compnats.dart';
import 'package:grocery_shop_app/pages/Buy_card_page.dart';
import 'package:grocery_shop_app/providerServ.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BuyCardPage()),
          );
        },
        child: Icon(Icons.shopping_bag),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Good Morning,',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Let\'s order fresh items for you',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),

            // here items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Fresh item',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1 / 1.3),
                itemCount: context.read<ProviderServ>().shopItem.length,
                itemBuilder: (context, index) {
                  final prov = context.watch<ProviderServ>().shopItem[index];
                  return CardCompnats(
                    cardModel: prov,
                    onPressed: () {
                      Provider.of<ProviderServ>(context, listen: false)
                          .addItemToCart(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
