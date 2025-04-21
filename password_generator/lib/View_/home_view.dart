import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Length :', style: GoogleFonts.aBeeZee(color: Colors.orange, fontSize: 25.sp, fontWeight: FontWeight.bold)),
                TextSpan(text: ' ${VProvider.length.toInt()}',  style: GoogleFonts.aBeeZee(color: Colors.yellow, fontSize: 25.sp, fontWeight: FontWeight.bold),),

              ])
            
          ),
          Slider(
            activeColor: Colors.teal,
            inactiveColor: Colors.deepOrangeAccent,
            value: VProvider.length,
            onChanged: VProvider.SetLength,
            max: 20,
            min: 3,
            divisions: 10,
            label: VProvider.length.toInt().toString(),
            ),

            SwitchListTile(
              activeColor: Colors.green,
              value: VProvider.IncludeUpperCase,
              onChanged: VProvider.SetUpperCase,
              title: Text('Upper Case Switch', style: GoogleFonts.agbalumo(color: Colors.white, fontSize: 20.sp, )),),

              SwitchListTile(
              activeColor: Colors.blue,
              value: VProvider.IncludeLowerCase,
              onChanged: VProvider.SetLowerCase,
              title: Text('Lower Case Switch',  style: GoogleFonts.agbalumo(color: Colors.white, fontSize: 20.sp, )),),

              SwitchListTile(
              activeColor: Colors.deepPurple,
              value: VProvider.IncludeNumber,
              onChanged: VProvider.SetNumber,
              title: Text('Numbers Switch',  style: GoogleFonts.agbalumo(color: Colors.white, fontSize: 20.sp,)),),

              SwitchListTile(
              activeColor: Colors.deepOrange,
              value: VProvider.IncludeSymbols,
              onChanged: VProvider.SetSymbols,
              title: Text('Symbols Switch',  style: GoogleFonts.agbalumo(color: Colors.white, fontSize: 20.sp,)),),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                ),
              onPressed: VProvider.generate_password,
              child: Text('Generate Password',  style: GoogleFonts.agbalumo(color: Colors.white, fontSize: 20.sp, ),)),


              Text(VProvider.password?.value??'',style: GoogleFonts.poppins(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),),
              


          
          
          ]));
  }
}
