import 'package:app_settings/app_settings.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationControl{
 void chekNotificationPermission()async{
    final status=await Permission.notification.request();
    if(status.isDenied){
      AppSettings.openAppSettings(type: AppSettingsType.notification);
    }
  }
}