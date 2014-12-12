$(document).ready(function() {
  function getStylesheet() {
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
  getStylesheet();
});
