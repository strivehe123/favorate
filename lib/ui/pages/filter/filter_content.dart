import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildChoiceTile(context),
        buildChoiceSelect(),
      ],
    );
  }

  Widget buildChoiceTile(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40.rpx),
      alignment: Alignment.center,
      child: Text('展示您的选择',style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
    );
  }
  Widget buildChoiceSelect(){
    return Expanded(child: Consumer<HYFilterViewModel>(
      builder: (ctx,filterVM,child){
        return ListView(
          children: [
            buildListTitle('无谷物蛋白', '展示无谷物蛋白质的选择', filterVM.isGreateFree, (value){
              filterVM.isGreateFree = value;
            }),
            buildListTitle('不含乳糖', '展示不含乳糖的选择', filterVM.isLactoseFree, (value){
              filterVM.isLactoseFree = value;
            }),
            buildListTitle('素食', '展示素食的选择', filterVM.isVegetarian, (value){
              filterVM.isVegetarian = value;
            }),
            buildListTitle('严格素食', '展示严格素食的选择', filterVM.isVegan, (value){

              filterVM.isVegan = value;
            }),

          ],
        );
      },
    ));
  }
  // Widget buildListTitle(String title ,String subTitle,bool value ,void Function(bool) onChange){
  //   return ListTile(
  //     title: Text(title),
  //     subtitle: Text(subTitle),
  //     trailing: Switch( value: false,   onChanged: onChange),
  //   );
  // }
  Widget buildListTitle(String title, String subTitle, bool value, void Function(bool) onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Switch(
        value: value, // 绑定到模型的相应属性
        onChanged: (bool newValue) { // 使用 newValue 并调用 onChange
          onChange(newValue);
        },
      ),
    );
  }
}