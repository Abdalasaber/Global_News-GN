import 'package:flutter/material.dart';
import '../../../model/country_model/country_model.dart';

class CountryBuilder extends StatelessWidget {
  final CountryModel countryModel;
  const CountryBuilder({super.key,required this.countryModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => countryModel.screen));
        },
      child: Column(
        children: [
          SizedBox(
              height: 100,
              child: Image(image: NetworkImage(countryModel.image),fit: BoxFit.cover,)),
          const SizedBox(height: 15,),
          Text(countryModel.text),
        ],
      ),
    );
  }
}
