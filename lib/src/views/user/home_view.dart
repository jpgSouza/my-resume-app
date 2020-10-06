import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:my_resume_app/constants.dart';
import 'package:my_resume_app/src/blocs/resume_bloc.dart';
import 'package:my_resume_app/src/views/widgets/custom_notifier.dart';
import 'package:my_resume_app/src/views/widgets/form/custom_input_fields.dart';
import 'package:my_resume_app/src/views/widgets/tiles/custom_resume_list.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final _resumeBloc = BlocProvider.of<ResumeBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 15.0, right: 5.0),
                height: 36.0,
                margin: EdgeInsets.only(left: 36.0, right: 36.0, top: 45.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6.0,
                          offset: Offset(4, 4))
                    ]),
                child: InputFields(
                    null,
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      color: primaryColor,
                      padding: EdgeInsets.zero,
                    ),
                    "Pesquisar...",
                    TextInputType.text,
                    false,
                    Colors.grey[400],
                    null,
                    null,
                    null)),
            SizedBox(
              height: 30.0,
            ),
            StreamBuilder<List>(
                stream: _resumeBloc.outResumes,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else if (snapshot.data.length == 0) {
                    return CustomNotifier();
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ResumeTile(snapshot.data[index]);
                      });
                })
          ],
        ),
      ),
    );
  }
}
