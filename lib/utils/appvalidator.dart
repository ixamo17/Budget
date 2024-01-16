class AppValidator {
  
String? ValidateEmail(value){
  if(value!.isEmpty){
    return 'Please entre an email';
  }
  RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegExp.hasMatch(value)){
    return 'Please entre a valid email';
  }
  return null;
}

String? validatePhoneNumber(value){
  if(value!.isEmpty){
    return 'Please entre a Nº tel';
  }
  if(value.length != 10){
    return 'Please entre a 10 digit tel number';
  }
  return null;
}

String? validateUsername(value){
  if(value!.isEmpty){
    return 'Please enter a username';
  }
  return null;
}

String? validatePassword(value){
  if(value!.isEmpty){
    return 'Please entre a password';
  }
  return null;
}


}