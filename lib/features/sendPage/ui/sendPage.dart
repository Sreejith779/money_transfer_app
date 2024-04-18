import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_transfer_app/features/paymentPage/ui/paymentPage.dart';

import '../bloc/send_bloc.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  var _searchQuery = '';

  @override
  void initState() {
    sendBloc.add(SendInitialEvent());
    super.initState();
  }

  SendBloc sendBloc = SendBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendBloc, SendState>(
      bloc: sendBloc,
      listenWhen: (previous, current) => current is SendActionState,
      buildWhen: (previous, current) => current is! SendActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case SendLoadedState:
            final loadedState = state as SendLoadedState;
            final filteredList = _searchQuery.isEmpty
                ? loadedState.contactSort()
                : loadedState
                    .contactSort()
                    .where((element) => element.name
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase()))
                    .toList();
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text(
                    "Send Money",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                body: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all()),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value;
                            });
                          },
                          decoration: const InputDecoration(
                              hintText: "Search",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1, childAspectRatio: 4.5),
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {

                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PaymentPage(
                                              currentPerson:
                                                  filteredList[index])));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    children: [
                                        CircleAvatar(
                                        radius: 25,
                                        backgroundImage: NetworkImage(filteredList[index].images),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              filteredList[index].name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(filteredList[index]
                                                .number
                                                .toString()),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                      // ListView(
                      //   children: List.generate(10, (index) => Card()),
                      // )
                    ],
                  ),
                ));

          default:
            return const Text("Error");
        }
      },
    );
  }
}
