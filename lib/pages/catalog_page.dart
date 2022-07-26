import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_provider_1/pages/cart_page.dart';
import 'package:simple_provider_1/provider/catalog_provider.dart';
import 'package:simple_provider_1/provider/theme_settings.dart';

// ignore: must_be_immutable
class CatalogPage extends StatelessWidget {
  const CatalogPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CatalogProv catalogProv = context.read<CatalogProv>();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Catalog',
            style: GoogleFonts.rubikMoonrocks(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Consumer<ThemeSettings>(
                    builder: (context, value, child) {
                      return Switch.adaptive(
                        value: value.darkTheme,
                        onChanged: (newValue) {
                          value.toggleTheme();
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
        body: ListView.separated(
            shrinkWrap: true,
            primary: true,
            itemBuilder: (
              context,
              index,
            ) {
              return ListTile(
                leading:
                    Image.asset(catalogProv.categories.items[index].image!),
                title: Text(catalogProv.categories.items[index].name!),
                subtitle: Text(
                  '\$${catalogProv.categories.items[index].price!.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                trailing: Consumer<CatalogProv>(
                  builder: (context, value, child) {
                    if (!value
                        .isItemInCart(catalogProv.categories.items[index])) {
                      return TextButton(
                        onPressed: () {
                          value.addToCart(catalogProv.categories.items[index]);
                        },
                        child: Text(
                          'ADD',
                          style: GoogleFonts.rubikMoonrocks(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    return Icon(
                      Icons.check_rounded,
                      color: Theme.of(context).primaryColor,
                    );
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
            itemCount: catalogProv.categories.items.length));
  }
}
