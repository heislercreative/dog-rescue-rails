function Event(attr) {
  const dateFormat = { year: 'numeric', month: 'long', day: 'numeric' }
  const timeFormat = { hour: '2-digit', minute:'2-digit', hour12: true}

  this.id = attr.id
  this.title = attr.title
  this.date = new Date(attr.date).toLocaleDateString("en-US", dateFormat)
  this.startTime = new Date(attr.start_time).toLocaleTimeString(navigator.language, timeFormat)
  this.endTime = new Date(attr.end_time).toLocaleTimeString(navigator.language, timeFormat)
  this.description = attr.description
  this.users = attr.users
}

Event.prototype.renderNew = function() {
  $(".hidden").removeClass("hidden")
  $("#eventTitle").text(this.title)
  $("#eventDate").text(this.date)
  $("#eventStart").text(this.startTime)
  $("#eventEnd").text(this.endTime)
  $("#eventDescription").text(this.description)
}

Event.prototype.renderMore = function() {
  $(`.event-description-${this.id}`).text(this.description)
  if (this.users.length !== 0) {
    $(`.attending-div-${this.id}`).removeClass("hidden")
    this.users.forEach(user =>
      $(`.attending-list-${this.id}`).append(`<li>${user.name}</li>`)
    )
  }
  $(`button[data-id="${this.id}"]`).addClass("hidden")
}

$(function() {

  const postEvent = function(e, data) {
    e.preventDefault()
    const values = $(data).serialize()
    const action = $(data).attr("action")
    const posting = $.post(action, values)
    posting.done(function(resp) {
      const event = new Event(resp)
      event.renderNew()
    })
  }

  $('.new_event').submit(function(e) {
    postEvent(e, this)
  })

  $('.edit_event').submit(function(e) {
    postEvent(e, this)
  })

  $(".event-more").on("click", function() {
    const eventId = $(this).data("id")
    const organizerId = $(this).data("organizer")
    $.getJSON(`/users/${organizerId}/events/${eventId}`, function(resp) {
      const event = new Event(resp)
      event.renderMore()
    })
  })
})
