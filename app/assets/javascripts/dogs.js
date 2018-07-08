function Dog(attr) {
  this.id = attr.id
  this.name = attr.name
  this.gender = attr.gender
  this.age = attr.age
  this.trained = attr.trained
  this.fee = attr.fee
  this.description = attr.description
  this.breedId = attr.breed.id
  this.breedName = attr.breed.name
}

Dog.prototype.isTrained = function () {
  return this.trained ? "Yes" : "No"
}

Dog.prototype.renderNext = function() {
  console.log(this)
  let nextId = this.id + 1

  $(".dog-name").text(this.name)
  $(".breed-name").html(`<a href="/breeds/${this.breedId}">${this.breedName}</a>`)
  $(".gender-age").text(`${this.gender} - ${this.age}`)
  $(".trained-yn").text(this.isTrained())
  $(".fee").text(this.fee)
  $(".dog-description").text(this.description)

  $(".edit-btn").attr("href", `/dogs/${this.id}/edit`)
  $(`#edit_dog_${this.id}`).attr("action", `/dogs/${nextId}`)
  $(`#edit_dog_${this.id}`).attr("id", `#edit_dog_${nextId}`)

  $(".next-dog").attr("data-id", this.id)
}

$(function() {
  $(".next-dog").on("click", function(e) {
    e.preventDefault()
    let currentId = parseInt($(".next-dog").attr("data-id"))
    let nextId = currentId + 1
    $.getJSON(`/dogs/${nextId}`, function(resp) {
      let dog = new Dog(resp)
      dog.renderNext()
    })
  })
})
