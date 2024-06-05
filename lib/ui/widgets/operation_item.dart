import 'package:favorcate/core/extension/int_extension.dart';
import 'package:flutter/material.dart';
class HYOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  const HYOperationItem(this._icon, this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        _icon,
        SizedBox(width: 10.rpx,),
        Text(_title,style: Theme.of(context).textTheme.bodySmall,)
      ],
    );
  }
}