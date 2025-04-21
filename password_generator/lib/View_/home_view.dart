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
      body: Column(
        children: [
          Text('Length: ${VProvider.length.toInt()}', style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.bold),),
          Slider(
            value: VProvider.length,
            onChanged: VProvider.SetLength,
            max: 20,
            min: 3,
            divisions: 10,
            label: VProvider.length.toInt().toString(),
            ),
          
          
          ]));
  }
}
