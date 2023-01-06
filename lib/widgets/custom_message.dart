import 'package:easy_localization/easy_localization.dart';
import 'package:alubian/config/extension.dart';
import 'package:flutter/material.dart';

class CustomMessage extends StatelessWidget {
  const CustomMessage({
    Key? key,
    required this.translationKey,
    this.icon,
  }) : super(key: key);
  final String translationKey;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: Row(
          children: [
            icon ?? const SizedBox(),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(translationKey.tr(),
                    style: context.textTheme.caption!.copyWith(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3)),
          ],
        ));
  }
}
