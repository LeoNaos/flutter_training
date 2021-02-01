import 'package:flutter/material.dart';
import 'package:flutter_app_ex3/widget/add_task_dialog.dart';
import 'package:flutter_app_ex3/widget/animated_fab.dart';
import 'package:flutter_app_ex3/common/app_style.dart';
import 'package:flutter_app_ex3/common/size_config.dart';
import 'package:flutter_app_ex3/model/task.dart';

import 'widget/card_painter.dart';
import 'model/list_model.dart';
import 'model/list_task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final heightTopHeader = SizeConfig.screenHeight * 15 / 100;
    var key = GlobalKey<_TodoListViewState>();

    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 400,
            height: 600,
            child: Image.asset(
              'assets/todo_events.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            child: Text(
              "Todos",
              style: AppConstant.largeLargeTextWhite,
            ),
            top: 60,
            left: 20,
          ),
          DraggableScrollableSheet(
            maxChildSize: 1,
            minChildSize: 0.45,
            builder: (BuildContext context, ScrollController scrollController) {
              return Stack(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        height: heightTopHeader,
                        color: Colors.transparent,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40)),
                          ),
                          child: TodoListView(
                            scrollController: scrollController,
                            key: key,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    child: AnimatedFab(
                      onClick: (mode) {
                        print('AnimatedFab click');

                        switch (mode) {
                          case ClickMode.FilterAll:
                            key.currentState.doFilterAll();
                            break;
                          case ClickMode.FilterComplete:
                            key.currentState.doFilterComplete();
                            break;
                          case ClickMode.FilterInProgress:
                            key.currentState.doFilterInProgress();
                            break;
                          case ClickMode.Add:
                            key.currentState.doAdd();
                            break;
                        }
                      },
                    ),
                    top: heightTopHeader - 90,
                    right: -30,
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

class TodoListView extends StatefulWidget {
  // Properties
  final ScrollController scrollController;

  // Constructor
  TodoListView({this.scrollController, Key key}) : super(key: key);

  // State
  @override
  _TodoListViewState createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  // Properties
  ListModel listModel;

  // Life cycle
  @override
  void initState() {
    super.initState();
    listModel = ListModel(tasks);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildRowWidget(index);
      },
      controller: widget.scrollController,
      itemCount: listModel.length,
    );
  }

  // Widgets
  Widget _buildRowWidget(int index) {
    final task = listModel[index];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () {
            print('tap Row');
            setState(() {
              task.completed = !task.completed;
            });
          },
          child: Stack(
            children: <Widget>[
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstant.borderRadius),
                  gradient: LinearGradient(
                      colors: [task.startColor, task.endColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  boxShadow: [
                    BoxShadow(
                      color: task.endColor,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                child: CustomPaint(
                  size: Size(100, 150),
                  painter: CustomCardShapePainter(
                      AppConstant.borderRadius, task.startColor, task.endColor),
                ),
              ),
              Positioned.fill(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // child: Image.asset(
                      //   'assets/icon.png',
                      //   height: 64,
                      //   width: 64,
                      // ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/ic_task.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            task.title,
                            style: AppConstant.smallTitleTextWhite,
                          ),
                          Text(
                            task.subTitle,
                            style: AppConstant.smallSubTextWhite,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.access_time_outlined,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Flexible(
                                child: Text(
                                  task.time,
                                  style: AppConstant.smallSubTextWhite,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Checkbox(
                        activeColor: task.endColor,
                        checkColor: Colors.white,
                        value: task.completed,
                        onChanged: (bool) {
                          print('onChange checkbox: $bool');
                          setState(() {
                            task.completed = bool;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Methods
  void doFilterAll() {
    setState(() {
      listModel = ListModel(tasks);
    });
  }

  void doFilterInProgress() {
    setState(() {
      var newTask = tasks.where((element) => !element.completed).toList();
      listModel = ListModel(newTask);
    });
  }

  void doFilterComplete() {
    setState(() {
      var newTask = tasks.where((element) => element.completed).toList();
      listModel = ListModel(newTask);
    });
  }

  void addNewTask(Task task) {
    setState(() {
      if (task.title.isNotEmpty && task.subTitle.isNotEmpty) {
        listModel.insert(0, task);
      }
    });
  }

  void doAdd() {
    print('Add new Task');
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: AddTaskDialog(
              saveClick: (task) {
                addNewTask(task);
              },
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          );
        });
  }
}
