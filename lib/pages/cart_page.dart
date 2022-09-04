import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider_1/provider/catalog_provider.dart';

import '../widgets/catalogshop.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: GoogleFonts.rubikMoonrocks(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Consumer<CatalogProv>(
                builder: (context, value, child) {
                  if (value.cartItems.isEmpty) {
                    return SizedBox(
                      height: 600,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 50,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'You don\'t have any items in\nyour cart yet!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return CatalogShop(
                    catalogItems: value.cartItems,
                    catalogService: value,
                  );
                },
              ),
            ),
            Consumer<CatalogProv>(builder: ((context, value, child) {
              return Column(
                children: [
                  value.cartItems.isEmpty
                      ? const SizedBox()
                      : Column(
                          children: [
                            const Divider(
                              thickness: 3,
                              color: Colors.black,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      'Total:',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '\$${value.getTotal().toStringAsFixed(2)}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Checkout',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                ],
              );
            }))
          ],
        ),
      ),
    );
  }
}
