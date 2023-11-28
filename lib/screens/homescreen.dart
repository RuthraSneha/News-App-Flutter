import 'package:flutter/material.dart';
import 'package:news_app/controllers/controller.dart';
import 'package:news_app/screens/tab/bussiness.dart';
import 'package:news_app/screens/tab/cricket.dart';
import 'package:news_app/screens/tab/entertainment.dart';
import 'package:news_app/screens/tab/general.dart';
import 'package:news_app/screens/tab/health.dart';
import 'package:news_app/screens/tab/science.dart';
import 'package:news_app/screens/tab/technology.dart';
import 'package:google_fonts/google_fonts.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>with SingleTickerProviderStateMixin {
  // ignore: prefer_typing_uninitialized_variables
  var dropdownValue;
  late TabController tabController;
  @override
  void initState() {
    /// TODO: implement initState
    super.initState();
    dropdownValue=null;
    tabController=TabController(length: 7, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd07085),
        title: Text("@Dayster",style: GoogleFonts.merriweather(fontSize: 35)),
        actions: [
          SizedBox(
            width: 160,
            child: DropdownButton(
              dropdownColor: const Color(0xffd07085),
              value:dropdownValue,
            icon: const Icon(Icons.arrow_drop_down,color: Colors.white,size: 40,),
            style: const TextStyle(color: Colors.white),
            items: controller.country.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item["name"]),
              );
            }).toList(),
            onChanged: (value){
              setState(() {
                dropdownValue = value;
                controller.countryCode.value=dropdownValue["code"];
              });
            },
            ),
          )],
        bottom: TabBar(
          onTap: (index){
            index= tabController.index;
            controller.elements.clear();
            controller.index.value=index;
            switch (controller.index.value){
              case 0:{
                controller.category.value="general";
              }
                break;
              case 1:{
                controller.category.value="business";
              }
                break;
              case 2:{
                controller.category.value="sports";
              }
                break;
              case 3:{
                controller.category.value="entertainment";
              }
                break;
              case 4:{
                controller.category.value="health";
              }
                break;
              case 5:{
                controller.category.value="science";
              }
                break;
              case 6:{
                controller.category.value="technology";
              }
              break;
            }
          },
          isScrollable: true,
            controller: tabController,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 5.0,color: Colors.grey.shade200),
            ),
            tabs: const [
              Tab(child: Text("General",style: TextStyle(color: Colors.white),),),
              Tab(child: Text("Bussiness",style: TextStyle(color: Colors.white),),),
              Tab(child: Text("Sports",style: TextStyle(color: Colors.white),),),
              Tab(child: Text("Entertainment",style: TextStyle(color: Colors.white),),),
              Tab(child: Text("Health",style: TextStyle(color: Colors.white),),),
              Tab(child: Text("Science",style: TextStyle(color: Colors.white),),),
              Tab(child: Text("Technology",style: TextStyle(color: Colors.white),),),
            ]
        ),
      ),
      body: Container(
        height: 800,width: 400,
        color: Colors.white,
        child: TabBarView(
            controller: tabController,
            children: const [
                  General(),Business(),Cricket(),Entertainment(),Health(),Science(),Technology()
            ]),
      ),
    );
  }
}

