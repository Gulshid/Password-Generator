import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_generator/View_model/Pass_viewModel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final VProvider = Provider.of<PassViewmodel>(context);
    return Scaffold(body:
      Column(
        children:[
          Text('Length: ${VProvider.length.toInt()}'),
          Slider(
            value: VProvider.length,
            onChanged: VProvider.SetLength,
            min: 4,
            max: 32,
            divisions:28 ,
            label: VProvider.length.toInt().toString(),
            ),


            SwitchListTile(
              title: Text('Include Lower Case'),
              value: VProvider.IncludeLowerCase,
              onChanged: VProvider.SetLowerCase,
              ),


              SwitchListTile(
              title: Text('Include Upper Case'),
              value: VProvider.IncludeUpperCase,
              onChanged: VProvider.SetUpperCase,
              ),


              SwitchListTile(
              title: Text('Include Number Case'),
              value: VProvider.IncludeNumber,
              onChanged: VProvider.SetNumber,
              ),


              SwitchListTile(
              title: Text('Include Symbol '),
              value: VProvider.Includesymbols,
              onChanged: VProvider.SetSymbol,
              ),

              SizedBox(height: 20.h,),

              ElevatedButton(
              onPressed: VProvider.genrate_password,
              child: Text('Generate Password')),

              SizedBox(height: 20.h,),

              SelectableText(
                VProvider.password?.value??'',
                style: TextStyle(fontSize: 20.sp, color: Colors.black, ),
                textAlign: TextAlign.center,
              )

          
        ]
      ));
  }
}
