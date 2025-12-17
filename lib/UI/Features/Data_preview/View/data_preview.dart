import 'package:flutter/material.dart';
import 'package:scubetask/App/AppColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scubetask/App/assets_path.dart';

import '../Controller/Controller.dart';
class data_preview extends StatelessWidget {
  data_preview({super.key});
  final controller = Get.find<data_preview_controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SCM"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined, size: 30,))
        ],
      ),
      body: DefaultTabController(length: 2, child: Stack(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      color: Colors.grey
                  )
              ),
              child: TabBarView(
                children: [
                  Center(child: Column(
                    children: [
                      const SizedBox(height: 25,),
                      SizedBox(
                        height: 170,
                        width: 170,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: CircularProgressIndicator(
                                value: 0.65,
                                color: AppColors.primary,
                                strokeWidth: 20,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("87455", style: TextStyle(fontSize: 20.sp),),
                                Text("tk", style: TextStyle(fontSize: 14.sp),),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: DefaultTabController(length: 2, child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TabBar(
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicator: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                labelColor: AppColors.primary,
                                unselectedLabelColor: Colors.grey,
                                dividerColor: Colors.transparent,

                                tabs: const [
                              Tab(child: Row(
                                children: [
                                  Icon(Icons.circle, size: 18,),
                                  SizedBox(width: 6,),
                                  Text('Today Data')
                                ],
                              ),),
                              Tab(child: Row(
                                children: [
                                  Icon(Icons.circle, size: 18,),
                                  SizedBox(width: 6,),
                                  Text('Custom Date Data')
                                ],
                              ),),
                            ]),
                            Expanded(
                              child: TabBarView(children: [
                                Container(
                                  margin: EdgeInsets.all(15),
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.grey
                                      )
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("Energy Chart", style: TextStyle(fontSize: 14.sp, color: Color(0xFF04063E)),),
                                          Text("5.53 kw", style: TextStyle(fontSize: 32.sp, color: Color(0xFF04063E), fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                      Expanded(child: ListView.builder(
                                          itemCount: controller.dataview_todaydata.length,
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index){
                                            final newdata = controller.dataview_todaydata[index];
                                            return Container(
                                              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: Colors.grey
                                                  )
                                              ),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Icon(Icons.circle, color: Color(int.parse(newdata["color"] as String)), size: 10),
                                                      Text("${newdata["SL"]}", style: TextStyle(fontWeight: FontWeight.bold),)
                                                    ],
                                                  ),
                                                  VerticalDivider(),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Data: ${newdata["Data"]}", style: TextStyle(fontWeight: FontWeight.bold),),
                                                      Text("Cost: ${newdata["Cost"]}", style: TextStyle(fontWeight: FontWeight.bold),)
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          }))
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.grey
                                              )
                                            ),
                                            child: Row(
                                              spacing: 10,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("From Data"),
                                                Icon(Icons.calendar_today_outlined)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.grey
                                                )
                                            ),
                                            child: Row(
                                              spacing: 10,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("To Data"),
                                                Icon(Icons.calendar_today_outlined)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.grey
                                              )
                                          ),
                                          child: Row(
                                            spacing: 10,
                                            children: [
                                              Icon(Icons.search)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Expanded(child: Container(
                                      margin: EdgeInsets.all(15),
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.grey
                                          )
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Energy Chart", style: TextStyle(fontSize: 14.sp, color: Color(0xFF04063E)),),
                                              Text("20.05 kw", style: TextStyle(fontSize: 32.sp, color: Color(0xFF04063E), fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                          Expanded(child: ListView.builder(
                                              itemCount: controller.dataview_todaydata.length,
                                              itemBuilder: (context, index){
                                                final newdata = controller.dataview_todaydata[index];
                                                return Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(
                                                          color: Colors.grey
                                                      )
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Icon(Icons.circle, color: Color(int.parse(newdata["color"] as String)), size: 10),
                                                          Text("${newdata["SL"]}", style: TextStyle(fontWeight: FontWeight.bold),)
                                                        ],
                                                      ),
                                                      VerticalDivider(),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Data: ${newdata["Data"]}", style: TextStyle(fontWeight: FontWeight.bold),),
                                                          Text("Cost: ${newdata["Cost"]}", style: TextStyle(fontWeight: FontWeight.bold),)
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }))
                                        ],
                                      ),
                                    ),),
                                    Expanded(child: Container(
                                      margin: EdgeInsets.all(15),
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.grey
                                          )
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Energy Chart", style: TextStyle(fontSize: 14.sp, color: Color(0xFF04063E)),),
                                              Text("5.53 kw", style: TextStyle(fontSize: 32.sp, color: Color(0xFF04063E), fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                          Expanded(child: ListView.builder(
                                              itemCount: controller.dataview_todaydata.length,
                                              itemBuilder: (context, index){
                                                final newdata = controller.dataview_todaydata[index];
                                                return Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(
                                                          color: Colors.grey
                                                      )
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Icon(Icons.circle, color: Color(int.parse(newdata["color"] as String)), size: 10),
                                                          Text("${newdata["SL"]}", style: TextStyle(fontWeight: FontWeight.bold),)
                                                        ],
                                                      ),
                                                      VerticalDivider(),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Data: ${newdata["Data"]}", style: TextStyle(fontWeight: FontWeight.bold),),
                                                          Text("Cost: ${newdata["Cost"]}", style: TextStyle(fontWeight: FontWeight.bold),)
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }))
                                        ],
                                      ),
                                    ),)

                                  ],
                                )
                              ]),
                            )
                          ],
                        )),
                      ),
                    ],
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 170,
                                width: 170,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: CircularProgressIndicator(
                                        value: 0.9,
                                        color: AppColors.primary,
                                        strokeWidth: 20,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("8897455", style: TextStyle(fontSize: 20.sp),),
                                        Text("tk", style: TextStyle(fontSize: 14.sp),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.grey
                                        )
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(assets_path.progress),
                                          Text("Data & Cost Info", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),),
                                          Spacer(),
                                          Image.asset(assets_path.arrow_up)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.grey
                                          )
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 50,),
                                          Expanded(
                                            child: ListView.builder(
                                                itemCount: controller.dataview_todaydata.length,
                                                itemBuilder: (context, index){
                                              return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Data ${index+1} : ${controller.dataview_todaydata[index]['Data']}"),
                                                  Text("Cost ${index+1} : ${controller.dataview_todaydata[index]['Cost']}"),
                                                  SizedBox(height: 10,)
                                                ],
                                              );
                                            }),
                                          ),
                                        ],
                                      )
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Colors.grey
                )
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              labelColor: AppColors.primary,
              unselectedLabelColor: Colors.grey,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.radio_button_checked, size: 18),
                      SizedBox(width: 6),
                      Text('Data View'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.radio_button_checked, size: 18),
                      SizedBox(width: 6),
                      Text('Revenue View'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
