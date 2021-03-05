import 'package:api_rest_app/presentation/home/componets/recomended_card.dart';
import 'package:flutter/material.dart';

class RecomendedItems extends StatelessWidget {
  RecomendedItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: RecomendedItemCard(),
    );
  }
}
// RecomendedItemCard(),
