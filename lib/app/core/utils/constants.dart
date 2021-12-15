import 'package:flutter_dotenv/flutter_dotenv.dart';

String? BASE_URL = dotenv.env['CUSTOMER_DOMAIN_URL'];


//**********CLASSES**********//
String CLASSES_ENDPOINT = BASE_URL! + "/api/classes/";
