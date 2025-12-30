import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tech_app/core/constants/app_colors.dart';
import 'package:tech_app/routes/route_name.dart';
import 'package:tech_app/widgets/inputs/app_dropdown.dart';
import 'package:tech_app/widgets/inputs/app_text_field.dart';
import 'package:tech_app/widgets/inputs/primary_button.dart';
class MyRequestView extends StatefulWidget {
  const MyRequestView({super.key});

  @override
  State<MyRequestView> createState() => _MyRequestViewState();
}

class _MyRequestViewState extends State<MyRequestView> {
   String? selectedGender;
   final _quantity = TextEditingController();
   final _optionalissuse = TextEditingController();
   final _fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _fromkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Material Name",style: TextStyle(fontSize: 15),),
                const SizedBox(height: 15),
                AppDropdown(
            label: "Select Gender",
            items: ["Male", "Female", "Other"],
            value: selectedGender,
            validator: (value) =>
                value == null ? "Please select gender" : null,
            onChanged: (value) {
              setState(() {
                selectedGender = value;
              });
            },
                ),
                  const SizedBox(height: 25),
            
                Text("Quantity Needed"),
                  const SizedBox(height: 15),
                AppTextField(
                  label: "# e.g 25",
                  controller: _quantity,
                  keyboardType:TextInputType.number,
                   validator: (value){
                    if(value == null || value.isEmpty){
                      return "Enter the quantity";
                    }
                    return null;
                   }
                  
                   ),
              const SizedBox(height: 25),
          
                   Text("Optional Notes"),
                         const SizedBox(height: 15),
                   AppTextField(
                    label: "if other issuse please mention here", 
                   controller: _optionalissuse,
                   maxLines: 4,
                    ),
                          const SizedBox(height: 35),

                                 PrimaryButton(
                    radius: 12, 
                    color: AppColors.scoundry_clr,
                    Width: double.infinity,
                    height: 50,
                     onPressed: (){
                   context.push(RouteName.bulk_request);
                     },
                      text: "Add Bulk Request"),
                      const SizedBox(height: 20,),
                  PrimaryButton(
                    radius: 12, 
                    color: AppColors.scoundry_clr,
                    Width: double.infinity,
                    height: 50,
                     onPressed: (){
                  if(_fromkey.currentState!.validate()){
        
                  }
                     },
                      text: "Submit Request")
              
              ],
            ),
          ),
        ),
      ),

    );
  }
}