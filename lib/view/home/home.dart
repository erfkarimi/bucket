import 'package:bucket/model/ip_model/ip_model.dart';
import 'package:bucket/view/news/news.dart';
import 'package:bucket/view_model/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/services/ip_api/ip_api.dart';
import '../settings/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override 
  HomeState createState() => HomeState();
}
class HomeState extends State<Home> {

  final apiService = ApiServiceForIP();
  late Future<IpApiModel> _ipApiModel;

    @override 
    Widget build(context) {
    final appTheme = Provider.of<AppTheme>(context);
    setState(() {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: appTheme.backgroundtheme(),
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark
        ));
    });
    return Scaffold(
        backgroundColor: appTheme.backgroundtheme(),
        appBar: appBar(),
        body: body()
    );
  }

// -------------------- Functions -------------------- //

  // AppBar
  AppBar appBar(){
    final appTheme = Provider.of<AppTheme>(context);
    return AppBar(
          toolbarHeight: 200,
        elevation: 0.0,
        backgroundColor: appTheme.appBarTheme(),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white
        ),
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text("Bucket",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Kalam",
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                )
                ),
          ),
        );
  }
  // Scaffold body
  Widget body(){
    return ListView(
          children: [
            Column(
              children: [
                 const SizedBox(height: 12),
                 appleNewsButton(),
                 const SizedBox(height: 12),
                 ipAddressButton(),
                 const SizedBox(height: 12),
                 settingsButton(),
                 const SizedBox(height: 12),
                 aboutButton(),
                 const SizedBox(height: 12),
                 helpAndFeedbackButton(),
              ],
            ),
          ],
        );
  }

// Buttons
Widget appleNewsButton(){
  return Consumer(
    builder: (context, AppTheme value, child){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: MaterialButton(
                minWidth: double.infinity,
                height: 65,
                elevation: .0,
                color:  value.buttonTheme(),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                       ),
                   child: Column(
                   children: [
                    Row(
                      children: [
                        Text("News",
                        style: TextStyle(
                        color: value.buttonTitleTheme(),
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                          ),
                          ),
                                ],
                              ),
                        const SizedBox(height: 5),
                          Row(
                          children: [
                          Text("Read tech news",
                          style: TextStyle(
                          fontSize: 12,
                          color: value.buttonTitleTheme()
                                ),),
                              ],
                            ),
                            ],
                          ),
                          onPressed: (){
                            Navigator.push(context,
                              PageTransition( 
                                type: PageTransitionType.rightToLeft,
                                child: const News()
                                )
                              );
                          },
                        ),
      );
    },
  );
}

//Buttons
Widget ipAddressButton(){
  return Consumer(
    builder: (context, AppTheme value, child){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: MaterialButton(
                minWidth: double.infinity,
                height: 65,
                elevation: .0,
                color:  value.buttonTheme(),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                       ),
                   child: Column(
                   children: [
                    Row(
                      children: [
                        Text("IP address",
                        style: TextStyle(
                        color: value.buttonTitleTheme(),
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                          ),
                          ),
                                ],
                              ),
                        const SizedBox(height: 5),
                          Row(
                          children: [
                          Text("Get your IP address",
                          style: TextStyle(
                          fontSize: 12,
                          color: value.buttonTitleTheme()
                                ),),
                              ],
                            ),
                            ],
                          ),
                          onPressed: (){
                           ipAddress();
                          },
                        ),
      );
    },
  );
}

Widget settingsButton(){
  return Consumer(
    builder: (context, AppTheme appTheme, _){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: MaterialButton(
                  minWidth: double.infinity,
                  height: 65,
                  elevation: .0,
                  color: appTheme.buttonTheme(),
                  shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20),
                         ),
                         child: Column(
                          children: [
                            Row(
                              children :[
                                Text("Settings",
                          style: TextStyle(
                            color: appTheme.buttonTitleTheme(),
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                          ),
                          ),
                              ]
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text("Customize bucket",
                          style: TextStyle(
                            fontSize: 12,
                            color: appTheme.buttonTitleTheme()
                          ),),
                              ],
                            )
                          ],
                        ),
                        onPressed: (){
                          Navigator.push(context,
                            PageTransition( 
                                type: PageTransitionType.rightToLeft,
                                child: const Settings()
                                )
                           );
                        },
                    ),
      );
    }
  );
}

Widget aboutButton(){
  return Consumer(
    builder: (context, AppTheme appTheme, _){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: MaterialButton(
                      minWidth: double.infinity,
                      height: 65,
                      elevation: .0,
                      color: appTheme.buttonTheme(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                               Text("About",
                        style: TextStyle(
                          color: appTheme.buttonTitleTheme(),
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                        ),
                        ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text("Who made bucket",
                        style: TextStyle(
                          fontSize: 12,
                          color: appTheme.buttonTitleTheme()
                        ),),
                            ],
                          )
                        ],
                      ),
                      onPressed: (){
                        showAboutDialog(context);
                      },
                  )
      );
    }
  );
}

Widget helpAndFeedbackButton(){
  return Consumer(
    builder: (context, AppTheme appTheme, _){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: MaterialButton(
                      minWidth: double.infinity,
                      height: 65,
                      elevation: .0,
                      color: appTheme.buttonTheme(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                               Text("Help & Feedback",
                        style: TextStyle(
                          color: appTheme.buttonTitleTheme(),
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                        ),
                        ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text("Report an issue or need help",
                        style: TextStyle(
                          fontSize: 12,
                          color: appTheme.buttonTitleTheme()
                        ),),
                            ],
                          )
                        ],
                      ),
                      onPressed: (){
                        _sendMail();
                      },
                  )
      );
    }
  );
}


//Functions
void ipAddress(){
  _ipApiModel = ApiServiceForIP().getIp();
  showDialog(context: context,
  builder: (context){
    return FutureBuilder<IpApiModel>(
      future: _ipApiModel,
      builder: (context, snapshot){
        if(snapshot.hasData){

          String ipAddress = "${snapshot.data!.ipAddress}";
          String countryCode = "${snapshot.data!.countryCode}";
          String countryName = "${snapshot.data!.countryName}";
          String timeZone = "${snapshot.data!.timeZone}";
          String cityName = "${snapshot.data!.cityName}";
          String regionName = "${snapshot.data!.regionName}";
          String zipCode = "${snapshot.data!.zipCode}";
          
          return Consumer<AppTheme>(
            builder: (context, appTheme, _) {
              return AlertDialog(
                backgroundColor: appTheme.backgroundtheme(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                title: Text("IP address",
                style: TextStyle(
                  color: appTheme.buttonTitleTheme()
                ),),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "ip address: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: appTheme.buttonTitleTheme()
                        ),
                        children: [
                          TextSpan(
                            text: ipAddress,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: appTheme.buttonTitleTheme()
                            )
                          )
                        ]
                      )
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: "country code: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: appTheme.buttonTitleTheme()
                        ),
                        children: [
                          TextSpan(
                            text: countryCode,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: appTheme.buttonTitleTheme()
                            )
                          )
                        ]
                      )
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: "country name: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: appTheme.buttonTitleTheme()
                        ),
                        children: [
                          TextSpan(
                            text: countryName,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: appTheme.buttonTitleTheme()
                            )
                          )
                        ]
                      )
                    ),
                     const SizedBox(height: 10),
                     RichText(
                      text: TextSpan(
                        text: "time zone: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: appTheme.buttonTitleTheme()
                        ),
                        children: [
                          TextSpan(
                            text: timeZone,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: appTheme.buttonTitleTheme()
                            )
                          )
                        ]
                      )
                    ),
                     const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: "city name: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: appTheme.buttonTitleTheme()
                        ),
                        children: [
                          TextSpan(
                            text: cityName,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: appTheme.buttonTitleTheme()
                            )
                          )
                        ]
                      )
                    ),
                     const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: "region name: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: appTheme.buttonTitleTheme()
                        ),
                        children: [
                          TextSpan(
                            text: regionName,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: appTheme.buttonTitleTheme()
                            )
                          )
                        ]
                      )
                    ),
                     const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: "zip code: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: appTheme.buttonTitleTheme()
                        ),
                        children: [
                          TextSpan(
                            text: zipCode,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: appTheme.buttonTitleTheme()
                            )
                          )
                        ]
                      )
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text("OK"),
                    onPressed: (){
                      Navigator.pop(context);
                    }
                    )
                ],
              );
            }
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
    );
  }
}

Future<void> _sendMail() async{
  const uri = 'mailto:kberfan99@gmail.com?subject=Need help';
    await launch(uri);
  
}

void showAboutDialog(context){
        final appTheme = Provider.of<AppTheme>(context, listen: false);
        showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              backgroundColor: appTheme.backgroundtheme(),
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          title: Text("About",
          style: TextStyle(
            fontSize: 18,
            color: appTheme.buttonTitleTheme(),
            fontWeight: FontWeight.bold
          )),
            content: Text("""
Thanks for choosing Bucket
this app created by
Erfan Karimi.""",
            style: TextStyle(
              color: appTheme.buttonTitleTheme()
            ),),
            actions: [
              TextButton(
                child: const Text("OK",
                style: TextStyle(
                  fontSize: 14
                ),),
                onPressed: (){
                  Navigator.pop(context);
                }, 
                )
            ],
            );
          }
        );
}