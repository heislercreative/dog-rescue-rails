$(function() {
  $(".event-more").on("click", function() {
    let eventId = $(this).data("id")
    let organizerId = $(this).data("organizer")
    $.getJSON(`/users/${organizerId}/events/${eventId}`, function(event) {
      $(`.event-description-${eventId}`).text(event.description)
      if (event.users.length !== 0) {
        $(`.attending-div-${eventId}`).removeClass("hidden")
        event.users.forEach(user =>
          $(`.attending-list-${eventId}`).append(`<li>${user.name}</li>`)
        )
      }
      $(`button[data-id="${eventId}"]`).addClass("hidden")
    })
  })
})
