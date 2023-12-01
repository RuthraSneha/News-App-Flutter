import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/apiservices/apiservice.dart';
import 'package:news_app/controllers/controller.dart';

import '../../description.dart';
class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService.api();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 15),
        child: Obx((){ if(controller.elements.isEmpty){
          return const Center(child: CircularProgressIndicator());
        }else{
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.elements.length,
            itemBuilder: (BuildContext context, int index){
              return  Column(
                children: [
                  GestureDetector(onTap: (){
                    Get.to(Description(img:controller.elements[index]["urlToImage"],
                      title:controller.elements[index]["title"],
                      des:controller.elements[index]["description"],
                      content:controller.elements[index]["content"],));
                  },
                    child: SizedBox(
                      height: 390,width: 360,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 360,height: 260,
                            child:controller.elements[index]["urlToImage"]!=null?
                            Image.network(controller.elements[index]["urlToImage"],fit: BoxFit.cover,): Image.asset("assets/images/newslogo.jpg") ,
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(height: 40,width: 340,
                              child: Text(controller.elements[index]["title"],style: const TextStyle(fontSize: 16,letterSpacing: 1),)),
                          const SizedBox(height: 15,),
                          Text(controller.elements[index]["publishedAt"]),
                          const SizedBox(height: 10,),
                          const Divider(color: Colors.black,)

                        ],),
                    ),
                  ),
                  const SizedBox(height: 5,)
                ],
              );
            },
          );
        }

        }
        ),
      ),
    );
  }
}

