import 'package:flutter/material.dart';
import 'package:nexever_flutter_task/data/model/task_model.dart';
import 'package:nexever_flutter_task/provider/task_provider.dart';
import 'package:nexever_flutter_task/utils/provider_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ProviderState<TaskProvider, HomeScreen> {
  @override
  Widget withProvider(TaskProvider provider) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Nexever Task")),
        ),
        body: body());
  }

  @override
  void initState() {
    super.initState();
    provider.getData();
  }

  Widget body() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: provider.apiData!.length,
        itemBuilder: (context, index) {
          var model = provider.apiData?.elementAt(index);
          return createList(model);
        });
  }

  Widget createList(Data? model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(model!.title.toString(),
              style: Theme.of(context).textTheme.headline5),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: model.category!.length,
            itemBuilder: (context, index) {
              var item = model.category?.elementAt(index);
              var image =
                  item?.image == null ? "Error" : item?.image.toString();
              var name = item?.name == null ? "Error" : item?.name.toString();
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.network(
                        image!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Column(
                            children: [
                              Image.asset(
                                "assets/images/noimg.png",
                                scale: 2,
                              ),
                            ],
                          );
                        },
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        name!,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
