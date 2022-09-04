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
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      trailing: IconButton(
        onPressed: () {
          onDelete();
        },
        icon: Icon(
          Icons.delete_forever,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
