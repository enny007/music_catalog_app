import 'package:flutter/material.dart';

import '../model/catalogmodel.dart';

class CatalogShopRow extends StatelessWidget {
  final CatalogModel? catalog;
  final Function onDelete;
  const CatalogShopRow({Key? key, this.catalog, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        catalog!.image!,
        width: 70,
        height: 70,
      ),
      title: Text(
        catalog!.name!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        catalog!.price!.toStringAsFixed(2),
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
          onPressed: () {
            onDelete();
          },
          icon: const Icon(
            Icons.delete_forever,
            color: Colors.black,
          )),
    );
  }
}