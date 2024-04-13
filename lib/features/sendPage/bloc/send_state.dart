part of 'send_bloc.dart';

@immutable
 abstract class SendState {}
 abstract class SendActionState extends SendState {}

final class SendInitial extends SendState {}

class SendLoadedState extends SendState{

 final List<ContactModel>contact = contacts.map((e) =>
     ContactModel(name: e['name'], number: e['number'])).toList();

List<ContactModel>contactSort(){
 contact.sort((a,b)=>a.name.compareTo(b.name));
 return contact;
}
}

class SendNavigateActionState extends SendActionState{
 final ContactModel clickedPerson;

  SendNavigateActionState({required this.clickedPerson});
}
