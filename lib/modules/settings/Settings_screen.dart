import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/components.dart';

class SettingsScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          defaultFormField(
              controller: nameController,
              type: TextInputType.name,
              validate:(value)
              {
                if(value!.isEmpty){
                  return 'name must not be empty';
                }
                return null;

              },
              label: 'Name',
              prefix: Icons.person,
          )
        ],
      ),
    );
  }
}
