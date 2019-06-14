var firebaseConfig = {
    apiKey: "AIzaSyADB7FqX6lBeCHNLPqqmNbG8z_oDIEw0uw",
    authDomain: "wallpaper-app-adbc8.firebaseapp.com",
    databaseURL: "https://wallpaper-app-adbc8.firebaseio.com",
    projectId: "wallpaper-app-adbc8",
    storageBucket: "wallpaper-app-adbc8.appspot.com",
    messagingSenderId: "680703404288",
    appId: "1:680703404288:web:58d44f6aae404386"
  };
  firebase.initializeApp(firebaseConfig);
  firebase.auth.Auth.Persistence.LOCAL; 
$(document).ready(function(){
$("#btn-login").click( function(){
    alert("You Clicked");
    var  email = $("#email").val();
    var password = $("#password").val();
    var result = firebase.auth().signInWithEmailAndPassword(email,password);
    result.catch(function(error){
        var errorCode =  error.code;
        var errorMessage =  error.message;
        console.log(errorCode);
        console.log(errorMessage);
    });
  });
});
