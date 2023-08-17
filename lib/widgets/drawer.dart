import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  static const imageUrl =
      "https://static1.cbrimages.com/wordpress/wp-content/uploads/2023/08/luffy-is-using-gear-5-in-one-piece.jpg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: const [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color:Colors.deepPurple,
                  ),
                  accountName: Text("Dipesh"),
                  accountEmail: Text("dipeshchavan8101@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                )
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.home,color: Colors.white,),
                  
                  title: Text("Home",
                  textScaleFactor:1.2,
                  style:TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),
                  
                  title: Text("Profile",
                  textScaleFactor:1.2,
                  style:TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(CupertinoIcons.mail,color: Colors.white,),
                  
                  title: Text("Contact Us",
                  textScaleFactor:1.2,
                  style:TextStyle(
                    color: Colors.white
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
