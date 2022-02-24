import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project_practice/Models/model.dart';
import 'package:getx_project_practice/Controllers/homepage_controller.dart';
import 'cartpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  homeController controller = Get.put(homeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
          () {
            return controller.loading.isTrue ? Container(child: Center(child: CircularProgressIndicator()),) :
             ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (BuildContext context, index) {

                  return Container(
                    height: 100,
                    margin: EdgeInsets.all(10),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(controller.items[index].description),
                                SizedBox(height: 10,),
                                Text(controller.items[index].category),
                                SizedBox(height: 10,),
                              ],
                            ),
                          ),
                          SizedBox(width: 5,),
                          // SizedBox(width: 10,),
                          ElevatedButton(onPressed: () {
                            controller.AddToCartItem();
                          },
                              child: Text("Add to cart")
                          ),
                          SizedBox(width: 20,)
                        ],
                      ),
                    ),
                  );
                }
            );

          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        elevation: 10,
        onPressed: (){
          Get.to(CartScreen());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_shopping_cart),
            Obx(() => Text(controller.itemCount.toString())),
          ],
        ),
      ),
    );
  }
}


// class HomePage extends StatelessWidget {
//
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     homeController controller = Get.put(homeController());
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: controller.ListCount,
//           itemBuilder:(BuildContext context, index){
//               return Container(
//                 height: 100,
//                 margin: EdgeInsets.all(10),
//                 child: Card(
//                   elevation: 5,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       SizedBox(width: 10,),
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(controller.items[index].description),
//                             SizedBox(height: 10,),
//                             Text(controller.items[index].category),
//                             SizedBox(height: 10,),
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: 5,),
//                       // SizedBox(width: 10,),
//                       ElevatedButton(onPressed: (){
//                         controller.AddToCartItem();
//                       },
//                           child: Text("Add to cart")
//                       ),
//                       SizedBox(width: 20,)
//                     ],
//                   ),
//                 ),
//               );
//           }
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.red,
//         elevation: 10,
//         onPressed: (){
//             Get.to(CartScreen());
//           },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.add_shopping_cart),
//             Obx(() => Text(controller.itemCount.toString())),
//           ],
//         ),
//       ),
//     );
//   }
// }
