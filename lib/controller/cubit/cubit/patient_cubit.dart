import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/asset_path.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());
  static PatientCubit get(context) => BlocProvider.of(context);
  List notification = [];
  List cancelList = [];
  List upcomingList = [];

  Future addCancel(
      {required AssetImage image,
      required String name,
      required String designation}) async {
    cancelList.addAll([
      {
        'image': image,
        'name': name,
        'designation': designation,
        'date': '20 Sep 2023',
        'time': '12pm-5pm'
      }
    ]);
    print(cancelList);
  }

/////////////////////////////////

  Future addupcoming(
      {required AssetImage image,
      required String name,
      required String designation}) async {
    upcomingList.addAll([
      {
        'image': image,
        'name': name,
        'designation': designation,
        'date': '20 Sep 2023',
        'time': '12pm-5pm'
      }
    ]);
    print(upcomingList);
  }

  /////////////////////////////////////

  Future addNotification({required String heading}) async {
    notification.addAll([
      {
        'image': const AssetImage(AssetPath.appointmentReminder),
        'heading': 'Appointment set with $heading',
        'details': 'You set a appointment for 30 June 2023'
      }
    ]);
    print(notification);
  }

  Future deleteAllNotification() async {
    notification.removeRange(0, notification.length);
  }





List chatList = [
      {
        "message": "Hi Eslam!",
        "type": "sender",
      },
      {
        "message": "Hello Doctor!",
        "type": "recieve",
      },
      {
        "message": "How are you? Good?",
        "type": "recieve",
      },
      {
        "message": "I’m fantastic!",
        "type": "sender",
      },
      {
        "message": "I still suffering from beckpain",
        "type": "recieve",
      },
      {
        "message": "Sorry to hear that, don’t be sad",
        "type": "sender",
      },
    ];
    





  
}
