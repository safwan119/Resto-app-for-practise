import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart'as http;
import 'package:http_parser/http_parser.dart';
class Cloudinary{
  String CloudName="dtabrc5i6";
  String presetName="food_image";
  Future<String?> uploadImage(XFile file)async{
    final mimeTypeData=lookupMimeType(file.path)?.split("/");
    final uploadUrl="https://api.cloudinary.com/v1_1/$CloudName/auto/upload";
    final request=http.MultipartRequest("POST",Uri.parse(uploadUrl))
    ..fields["upload_preset"]=presetName
    ..files.add(
      await http.MultipartFile.fromPath("file", file.path,
          contentType: mimeTypeData!=null?MediaType(mimeTypeData[0], mimeTypeData[1]):null)
    );
    final response=await request.send();
    final result=await http.Response.fromStream(response);
    if(response.statusCode==200){
      final data=jsonDecode(result.body);
      final Cloudinaryurl=data["secure_url"];
      print("The URL of Cloudinary is :$Cloudinaryurl");
      return Cloudinaryurl;
    }
    else{
      print("Failed to display or upload image");
      return null;
    }
  }
}