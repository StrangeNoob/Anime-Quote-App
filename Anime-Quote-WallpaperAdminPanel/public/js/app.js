// Web app's Firebase configuration
var firebaseConfig = {
  apiKey: "AIzaSyADB7FqX6lBeCHNLPqqmNbG8z_oDIEw0uw",
  authDomain: "wallpaper-app-adbc8.firebaseapp.com",
  databaseURL: "https://wallpaper-app-adbc8.firebaseio.com",
  projectId: "wallpaper-app-adbc8",
  storageBucket: "wallpaper-app-adbc8.appspot.com",
  messagingSenderId: "680703404288",
  appId: "1:680703404288:web:58d44f6aae404386"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
//firebase.auth.Auth.Persistence.LOCAL; 
$(document).ready(function(){
$("#btn-login").click( function(){

    alert("Hi User !!!");
    var  email = $("#email").val();
    var password = $("#password").val();
    console.log(password);
    console.log(email);

    firebase.auth().signInWithEmailAndPassword(email, password).then(user => {
      console.log(user);
    }).catch(function(error) {
      // Handle Errors here.
      var errorCode = error.code;
      var errorMessage = error.message;
      // To Print Error in Console
      console.log(errorCode);
      console.log(errorMessage);
    });
  });
});


