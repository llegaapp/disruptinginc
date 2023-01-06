import 'package:cached_network_image/cached_network_image.dart';

import 'package:alubian/config/constant.dart';
import 'package:alubian/config/extension.dart';
import 'package:alubian/pages/products/products_detail.dart';
import 'package:alubian/pages/products/product_rating_bar.dart';
import 'package:alubian/models/product.dart';
import 'package:flutter/material.dart';

import '../add_cart_button.dart';

class ShopProductGridCard extends StatelessWidget {
  const ShopProductGridCard({Key? key, required this.product})
      : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailView(
                    product: product,
                  ))),
      child: Container(
        color: context.colors.primary,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120,
                    width: 100,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: CachedNetworkImage(
                        imageUrl:
                            product.image ?? Constant.dummyImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ProductRatingBar(product: product),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Text('${product.title}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Text(
                      '${product.category}'.toTitleCase(),
                      style: context.textTheme.caption!.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Text(
                      '\$${product.price}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Align(
                alignment: const Alignment(0.8, 0.83),
                child: SizedBox(
                  height: 35,
                  child:AddCartButton(
                    iconColor: context.colors.secondary,
                    productModel: product,
                  )
                ))
          ],
        ),
      ),
    );
  }
}
