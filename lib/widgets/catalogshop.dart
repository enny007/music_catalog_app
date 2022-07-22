import 'package:flutter/material.dart';

import '../model/catalogmodel.dart';
import '../provider/catalog_provider.dart';
import 'catalogshoprow.dart';

class CatalogShop extends StatelessWidget {
  final List<CatalogModel>? catalogItems;
  final CatalogProv? catalogService;

  const CatalogShop({Key? key, this.catalogItems, this.catalogService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(catalogItems!.length, (index) {
        CatalogModel currentItem = catalogItems![index];
        return CatalogShopRow(
            catalog: currentItem,
            onDelete: () {
              catalogService!.removeFromCart(currentItem);
            });
      }),
    );
  }
}
