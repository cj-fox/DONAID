import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.6/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.6.6/firebase-analytics.js";

(function(){

  const firebaseConfig = {
    apiKey: "AIzaSyAZIToR8oHIIgWmayz0PncWAaiwmJ5n_64",
    authDomain: "donaid-d3244.firebaseapp.com",
    projectId: "donaid-d3244",
    storageBucket: "donaid-d3244.appspot.com",
    messagingSenderId: "240146097284",
    appId: "1:240146097284:web:0e78cae430d624551cced1",
    measurementId: "G-33T6FD2DK6"
  };


  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
  const db = getFirestore(app);
})