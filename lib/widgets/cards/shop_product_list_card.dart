import 'package:alubian/widgets/cards/tile_image_card.dart';
import 'package:alubian/config/extension.dart';

import 'package:alubian/pages/products/products_detail.dart';
import 'package:alubian/widgets/add_cart_button.dart';
import 'package:alubian/pages/products/product_rating_bar.dart';
import 'package:alubian/models/product.dart';
import 'package:flutter/material.dart';

class ShopProductListCard extends StatelessWidget {
  const ShopProductListCard({Key? key, required this.product})
      : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailView(
                          product: product,
                        ))),
            child: SizedBox(
              height: 160,
              child: Stack(
                children: [
                  Card(
                    color: context.colors.primary,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(child: _buildImage()),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Text('${product.title}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Text(
                                        '${product.category}'.toTitleCase(),
                                        style: context.textTheme.caption!
                                            .copyWith(),
                                      ),
                                    ),
                                    Padding(
                                      padding: context.paddingLowVertical,
                                      child: ProductRatingBar(product: product),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Text(
                                        '\$${product.price}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                  Align(
                      alignment: const Alignment(1, 1.25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AddCartButton(
                            iconColor: context.colors.secondary,
                            productModel: product,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  TileImageCard _buildImage() => TileImageCard(image: product.image);
}
