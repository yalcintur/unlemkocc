class User{
  var email,password;

  User(this.email,this.password);

  String getEmail(){
    return this.email.toString();
  }
  String getPassword(){
    return this.password.toString();
  }
  void setEmail(var Email){
    email = Email;
  }
  void setPassword(var PassWord){
    password = PassWord;
  }
}

class UserStatus{
 static var currentUser = new User(null,null);

 static User getUser(){
    return currentUser;
  }

  static void setUser(var email,var password){
    currentUser.setEmail(email);
    currentUser.setPassword(password);
  }
}
