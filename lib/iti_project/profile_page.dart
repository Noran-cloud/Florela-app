import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iti2/iti_project/About_page.dart';
import 'package:iti2/iti_project/developers.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.arrow_back_ios),
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                  ),
              ],
            ),
            Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 100,
                          child: Image.asset('assets/images/profile.jpg',fit: BoxFit.fill,),
                        ),
                        Text(
                          'Luna',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 27
                          ),
                          ),
                          Text('luna@gmail.com',style: TextStyle(fontSize: 16),),
                          SizedBox(height: 5,),
                          Icon(Icons.edit_note,size: 25,)
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView( 
                      physics: BouncingScrollPhysics(),
                      children: [
                        Info(Icons.edit_location_alt, 'Address book',subtitle: 'Manage your save addressed'),
                        Info(Icons.credit_card, 'Order History',subtitle: 'View your past orders'),
                        Info(Icons.language, 'Language',subtitle: 'English'),
                        Info(Icons.notifications, 'Notification'),
                        Info(EvaIcons.phoneCall, 'Contact Us'),
                        Info(Icons.help_outline, 'Get Help'),
                        
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

Widget Info(IconData icon, String title, {String? subtitle}){
  return ListTile(
    leading: Icon(icon,size: 35,),
    title: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
    subtitle: Text(subtitle??'',style: TextStyle(color: const Color.fromARGB(255, 92, 88, 88))),
    trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,),
  );
}