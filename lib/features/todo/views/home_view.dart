import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mytodo_mobx_app/core/style/style_color.dart';
import 'package:mytodo_mobx_app/core/style/style_text.dart';
import 'package:mytodo_mobx_app/features/todo/stores/todo_store.dart';
import 'package:mytodo_mobx_app/features/todo/views/widget/todo_item.dart';
import 'package:mytodo_mobx_app/injection.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final store = sl<TodoStore>();

  @override
  void initState() {
    super.initState();
    store.fetchPosts();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          "My Todo",
          style: h4Bold(),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.line_horizontal_3),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell_fill,
            ),
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          if (store.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (store.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(store.errorMessage),
                  TextButton(
                      onPressed: () {
                        store.fetchPosts();
                      },
                      child: Text(
                        "try again",
                        style: b2Medium(colorText: CustomColor.primary800),
                      ))
                ],
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RichText(
                    text: TextSpan(
                        text: "Remaining task ",
                        style: b1Medium(),
                        children: [
                          TextSpan(
                            text: '(${store.todos.length})',
                            style: b1Bold(),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: store.todos.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () async {
                        // final result = await context.push('/detail_todo',
                        //     extra: state.todos[index]);
                        // if (result == true) {
                        //   // ignore: use_build_context_synchronously
                        //   context.read<TodoBloc>().add(OnGetTodoList());
                        // }
                      },
                      child: TodoItem(todo: store.todos[index]),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade600,
        onPressed: () async {
          final result = await context.push("/add_todo");
          if (result == true) {
            // // ignore: use_build_context_synchronously
            // context.read<TodoBloc>().add(OnGetTodoList());
          }
        },
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
