import 'package:demo/bloc/dress_bloc/dress_bloc.dart';
import 'package:demo/bloc/dress_bloc/dress_event.dart';
import 'package:demo/bloc/dress_bloc/dress_state.dart';
import 'package:demo/enums/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dress extends StatefulWidget {
  const Dress({super.key});

  @override
  State<Dress> createState() => _DressState();
}

class _DressState extends State<Dress> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DressBloc>().add(FetchDress());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<DressBloc>().add(FetchDress());
      },

      child: Scaffold(
        body: BlocBuilder<DressBloc, DressState>(
          builder: (context, state) {
            switch (state.postStatus) {
              case PostStatus.loading:
                return Center(child: CircularProgressIndicator());
              case PostStatus.failed:
                return Center(
                  child: SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(state.message),
                  ),
                );
              case PostStatus.success:
                return SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: state.dress.length,
                    itemBuilder: (context, index) {
                      final item = state.dress[index];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(item.name.toString()),
                              ),
                              InkWell(
                                onTap: () {
                                  context.read<DressBloc>().add(
                                    DeleteDress(id: item.sId.toString()),
                                  );
                                },
                                child: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
