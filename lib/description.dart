import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/apiservices/apiservice.dart';
class Description extends StatefulWidget {
  const Description({super.key, this.img, this.title, this.des,this.content});
 final String? img ;
 final String? title ;
 final String? des ;
 final String? content;

  @override
  State<Description> createState() => _DescriptionState();
}
class _DescriptionState extends State<Description> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService.api();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: const Color(0xffd07085),
        title: Text("@Dayster",style: GoogleFonts.merriweather(fontSize: 35)),),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey.shade200,
          child: Stack(
            children: [
              SizedBox(
                 width: MediaQuery.of(context).size.width,height: 280,
                 child:widget.img!=null?
                 Image.network(widget.img!,fit: BoxFit.cover,): Image.asset("assets/images/newslogo.jpg",width:MediaQuery.of(context).size.width ,) ,
                               ),
             Positioned(
               top: 240.0,left: 17,right: 17,
                 child: Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                               border: Border.all(width: 2.0,color: Colors.black),
                               color: Colors.white,
                             ),
                             height: 200,width: 200,
                             child: Center(child: Text(widget.title.toString(),style: const TextStyle(fontSize: 20,letterSpacing: 1,color: Colors.grey),textAlign: TextAlign.center,)),
                       ),
             ),
              Positioned(
                top: 440.0,left: 15,right: 15,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 15),
                      child: widget.des!=null?
                      Text(widget.des!,style: GoogleFonts.openSans(fontSize: 20,letterSpacing: 1,)):const SizedBox.shrink(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 15),
                      child: widget.content!=null?
                      Text(widget.content!,style: GoogleFonts.openSans(fontSize: 20,letterSpacing: 1)):const SizedBox.shrink(),
                    ),
                  ],
                ),
              )
            ]
        ),
      ),
      ),
    );
  }
}

