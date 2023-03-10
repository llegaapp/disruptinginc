import 'package:alubian/widgets/cards/primary_list_tile.dart';
import 'package:alubian/widgets/cards/tile_image_card.dart';
import 'package:alubian/widgets/custom_message.dart';
import 'package:alubian/widgets/primary_snackbar.dart';
import 'package:alubian/config/constant.dart';
import 'package:alubian/config/extension.dart';
import 'package:alubian/config/lang/generated/locale_keys.g.dart';
import 'package:alubian/pages/cart/bloc/bag_bloc.dart';
import 'package:alubian/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class BagProductCard extends StatelessWidget {
  const BagProductCard({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return PrimaryListTile(
        childWidget: Row(
          children: [
            _buildProductImage(),
            _buildProductDetails(context),
          ],
        ),
        onLongPress: () {
          context.read<BagBloc>().add(BagProductRemoved(product));
          PrimarySnackbar.show(
              context,
              CustomMessage(
                translationKey: LocaleKeys.common_messages_bag_remove,
                icon: Lottie.asset(Constant.animRemoved),
              ));
        });
  }

  TileImageCard _buildProductImage() {
    return TileImageCard(image: product.image);
  }

  Expanded _buildProductDetails(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            _buildTitle(context),
            const SizedBox(
              height: 20,
            ),
            _buildQuantity(context)
          ],
        ),
      ),
    );
  }

  Row _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            product.title!,
            style: context.textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove_circle,
                color: context.colors.errorContainer,
              )),
        )
      ],
    );
  }

  Row _buildSize(BuildContext context) {
    return Row(
      children: [
        Text(
          'Size: ',
          style: context.textTheme.caption!.copyWith(),
        ),
        Text(
          'M',
          style:
              context.textTheme.caption!.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Padding _buildQuantity(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 30,
                child: _buildIconButton(
                  context,
                  icon: Icons.remove,
                  voidCallback: () => context
                      .read<BagBloc>()
                      .add(BagProductDecremented(product)),
                ),
              ),
              Text(
                '${product.count}',
                style: context.textTheme.subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
                child: _buildIconButton(context,
                    icon: Icons.add,
                    voidCallback: () => context
                        .read<BagBloc>()
                        .add(BagProductIncremented(product))),
              )
            ],
          ),
          Text(
            '\$${product.price}',
            style: context.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.onBackground,
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildIconButton(BuildContext context,
      {required VoidCallback voidCallback, required IconData icon}) {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: context.colors.secondary,
      onPressed: voidCallback,
      child: Icon(icon),
    );
  }
}
