$(document).ready(function() {
  function getToD() {
    var currentTime = new Date().getHours();

    if (0 <= currentTime&&currentTime < 13) {
      $(".standup_message").show();
      $(".barts").hide();
    }

    if (13 <= currentTime&&currentTime < 24) {
      $(".standup_message").hide();
      $(".barts").show();
    }
  }
  getToD();

  function getDateHeader() {
    var now = new Date();
    var days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
    var months = ['January','February','March','April','May','June','July','August','September','October','November','December'];

    var day = days[ now.getDay() ];
    var month = months[ now.getMonth() ];
    var date = now.getDate();

    $(".current_date").text(day + " | " + month + " " + date);
  }
  getDateHeader();
});
