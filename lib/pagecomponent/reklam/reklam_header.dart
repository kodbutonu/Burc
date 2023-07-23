import 'package:burc/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ReklamHeader extends StatefulWidget {
  const ReklamHeader({Key? key}) : super(key: key);

  @override
  State<ReklamHeader> createState() => _ReklamHeaderState();
}

class _ReklamHeaderState extends State<ReklamHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Burç Yorumu",
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: context.mediumValue,),
        Row(
          children: [
           SizedBox(width: context.high2Value,),
            Image.asset("assets/images/coin.png",height: 30,),
            SizedBox(width: context.lowValue,),
            Text("Bir yorum hakkı kazan", style: Theme.of(context).textTheme.headline5,)
          ],
        )
      ],
    );
  }
}
