$(document).ready(function() {
  $('.btn').click(function() {
    var postId = $(this).data("post-id");
    var selector = ".post[data-id = '" + postId + "'] .inreads";
    $(this).hide();
    $(selector).show();
  });
});