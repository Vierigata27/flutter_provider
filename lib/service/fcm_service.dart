import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:latihan_provider/service/notification_service.dart';

class FcmService {
  final FirebaseMessaging fcm = FirebaseMessaging.instance;

  Future<void> initialize () async{
    //request permision
    NotificationSettings nsetting = await fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );

    print('Izin Notifikasi FCM ${nsetting.authorizationStatus}');

    //get token perangkat
    String? token = await fcm.getToken();
    print('token use : $token');

    //foreground state
    FirebaseMessaging.onMessage.listen((RemoteMessage rm){
      print('Pesan diterima : ${rm.notification?.title} ${rm.notification?.body}');
      showFCMNotif(rm);
    });

    //terminated state
    fcm.getInitialMessage().then((RemoteMessage? rm){
      if(rm != null ){
        print('Pesan diterima : ${rm.notification?.title} ${rm.notification?.body}');
      }
    });

    //setup backgroud
    FirebaseMessaging.onBackgroundMessage(fcmHandlerBGMessage);

  }
  //show notifikasi
    void showFCMNotif (RemoteMessage rm) async{
      RemoteNotification? rn = rm.notification;
      NotificationService ns = NotificationService();

      if(rn !=null){
        ns.showNotifivation(id: rm.hashCode, title: rn.title ?? 'tidak tersedia', desc: rn.body ?? 'tidak tersedia',);
      }
    }
}


@pragma('vm:entry-point')
Future<void> fcmHandlerBGMessage(RemoteMessage rm)async{
  print('Pesan diterima : ${rm.notification?.title} ${rm.notification?.body}');
}