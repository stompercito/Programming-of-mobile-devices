import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:practica_tres/bloc/application_bloc.dart';

import '../details.dart';

class ImagesLabeling extends StatefulWidget {
  ImagesLabeling({Key key}) : super(key: key);

  @override
  _ImagesLabelingState createState() => _ImagesLabelingState();
}

class _ImagesLabelingState extends State<ImagesLabeling>
    with AutomaticKeepAliveClientMixin<ImagesLabeling> {
  ApplicationBloc _appBloc2;
  bool _showShimmer2 = false;

  @override
  bool get wantKeepAlive => true;

    @override
  void initState() {
    _appBloc2 = BlocProvider.of<ApplicationBloc>(context);
    super.initState();
  }


  @override
  void dispose() {
    _appBloc2.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApplicationBloc, ApplicationState>(
          listener: (context, state) {
        if (state is LoadingState) {
          // shimmer
          _showShimmer2 = true;
        } else if (state is FakeDataFetchedState) {
          // shimmer
          _showShimmer2 = false;
        } else if (state is ErrorState) {
          // snackbar
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text("${state.message}"),
                duration: Duration(seconds: 3),
              ),
            );
        }
      },
      child: BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) {
          int _listSize = _appBloc2.getLabeledItemsList.length;
          if(_listSize > 0) _showShimmer2 = false;
          return _listSize > 0 || _showShimmer2
              ? ListView.builder(
                  itemCount: _showShimmer2 ? 10 : _listSize,
                  itemBuilder: (BuildContext context, int index) {
                    return _showShimmer2
                        ? ListTileShimmer()
                        : ListTile(
                            leading: CircleAvatar(
                              child: Icon(Icons.image_aspect_ratio),
                              backgroundColor: Colors.amber[50],
                            ),
                            title: Text(
                              "$index - Codigo ${_appBloc2.getLabeledItemsList[index].identificador}",
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return Details(
                                      imageLabeled:
                                          _appBloc2.getLabeledItemsList[index],
                                    );
                                  },
                                ),
                              );
                            },
                          );
                  },
                )
              : Center(child: Text("Todavia no hay objetos escaneados"));
        },
      ),
    );
  }
}
