import 'package:alubian/widgets/custom_message.dart';
import 'package:alubian/widgets/primary_snackbar.dart';
import 'package:alubian/config/extension.dart';
import 'package:alubian/config/lang/generated/locale_keys.g.dart';
import 'package:alubian/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../config/constant.dart';
import '../pages/cart/bloc/bag_bloc.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({
    Key? key,
    required this.iconColor,
    required this.productModel,
  }) : super(key: key);
  final Color iconColor;
  final Product productModel;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<BagBloc>().add(BagProductAdded(productModel));
        PrimarySnackbar.show(
            context,
            CustomMessage(
                translationKey: LocaleKeys.common_messages_bag_add,
                icon: Lottie.asset(Constant.animDone, repeat: false)));
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        minimumSize: Size.zero,
        onPrimary: context.colors.secondary,
      ),
      child: Icon(
        productModel.isAdded
            ? Icons.shopping_cart_rounded
            : Icons.shopping_cart_outlined,
        size: 20,
        color: context.colors.onPrimary,
      ),
    );
  }

}
