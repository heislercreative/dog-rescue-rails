function Breed(attr) {
  this.id = attr.id
  this.name = attr.name
  this.dogs = attr.dogs
}

Breed.prototype.renderLi = function() {
  $("#breedList").append(
    `<li><a href="/breeds/${this.id}">${this.name} (${this.dogs.length})</a></li>`
  )
}

$("#breedList").html("")

fetch('/breeds.json', { credentials: "same-origin"})
  .then(resp => resp.json())
  .then(json => json.forEach(function(b) {
    const breed = new Breed(b)
    breed.renderLi()
  }))
