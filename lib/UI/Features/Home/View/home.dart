import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scubetask/App/AppColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Controller/Controller.dart';
class scube_home extends StatelessWidget {
  scube_home({super.key});
  final controller = Get.find<home_controller>();

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
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          spacing: 15,
          children: [
            const SizedBox(height: 10,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: const [
                          Tab(text: 'Summary'),
                          Tab(text: 'SLD'),
                          Tab(text: 'Data'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children:  [
                            Column(
                              children: [
                                Text('Electricity', style: TextStyle(color: Colors.grey, fontSize: 16.sp),),
                                Divider(thickness: 1, color: Colors.grey,),
                                const SizedBox(height: 10,),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: CircularProgressIndicator(
                                        value: 1,
                                        color: AppColors.primary25,
                                        strokeWidth: 20,
                                      ),
                                    ),
                                    Center(child: Column(
                                      children: [
                                        Text("Total Power"),
                                        Text("5.53 kw", style: TextStyle(fontWeight: FontWeight.bold),),
                                      ],
                                    ),)
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: DefaultTabController(
                                      length: 2,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.primary25.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: TabBar(
                                              indicatorSize: TabBarIndicatorSize.tab,
                                              indicator: BoxDecoration(
                                                color: AppColors.primary,
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              dividerColor: Colors.transparent,
                                              labelColor: Colors.white,
                                              unselectedLabelColor: Colors.black,
                                              tabs: const [
                                                Tab(text: 'Source'),
                                                Tab(text: 'Local'),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children:  [
                                                Column(
                                                  children: [
                                                    Divider(thickness: 1, color: Colors.grey,),
                                                    Expanded(
                                                      child: ListView.builder(
                                                          itemCount: controller.chart_list.length,
                                                          itemBuilder: (context, index){
                                                            final data = controller.chart_list[index];
                                                            return GestureDetector(
                                                              onTap: () => controller.route_data_preview(),
                                                              child: Container(
                                                                  padding: EdgeInsets.all(10),
                                                                  margin: EdgeInsets.all(10),
                                                                  decoration: BoxDecoration(
                                                                      color: Color(0xFFE5F4FE),
                                                                      borderRadius: BorderRadius.circular(10),
                                                                      border: Border.all(
                                                                          color: Color(0xFFA5A7B9)
                                                                      )
                                                                  ),
                                                                  child: ListTile(
                                                                    leading: Image.asset("${data["icon"]}", height: 25,),
                                                                    title: Row(
                                                                      children: [
                                                                        Container(
                                                                          height: 15,
                                                                          width: 15,
                                                                          color: Color(int.parse(data["color_code"] as String)),
                                                                        ),
                                                                        const SizedBox(width: 10,),
                                                                        Text("${data["title"]}", style: TextStyle(fontWeight: FontWeight.bold),),
                                                                        SizedBox(width: 10,),
                                                                        Text("(${data["status"]})", style: TextStyle(fontSize: 10.sp, color: data["status"] == "Active" ? Colors.green : Colors.red),)
                                                                      ],
                                                                    ),
                                                                    subtitle: ListView.builder(
                                                                        itemCount: (data["data"] as List<dynamic>).length,
                                                                        shrinkWrap: true,
                                                                        itemBuilder: (context, data_index){
                                                                          return Row(
                                                                            children: [
                                                                              Text("Data ${index + 1} : "),
                                                                              SizedBox(width: 10,),
                                                                              Text("58805.63"),
                                                                            ],
                                                                          );
                                                                        }),
                                                                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                                                                  )
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Divider(thickness: 1.5, color: Colors.grey,),
                                                    Center(child: Text('Local Section is Under Progress')),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Center(child: Text('SLD Section is Under Progress')),
                            Center(child: Text('Data Section is Under Progress')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 160,
              child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
                mainAxisExtent: 42,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15
              ),
              itemCount: 6,
              itemBuilder: (context, index){
                final option = controller.option_list[index];
                return GestureDetector(
                  onTap: () => controller.route_options("${option["title"]}"),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        spacing: 10,
                        children: [
                          Image.asset("${option["icon"]}"),
                          Text("${option["title"]}", style: TextStyle(fontSize: 14.sp),),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      )),

    );
  }
}
