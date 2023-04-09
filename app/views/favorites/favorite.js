// app/assets/javascripts/favorites.js

$(document).on('turbolinks:load', function () {
  $('.favorite-link').on('ajax:success', function(event) {
    var post_id = $(this).data('post-id');
    var favorite_count = $(this).siblings('.favorite-count');

    $(this).toggleClass('favorited');

    if ($(this).hasClass('favorited')) {
      favorite_count.text(parseInt(favorite_count.text()) + 1);
    } else {
      favorite_count.text(parseInt(favorite_count.text()) - 1);
    }
  });
});
