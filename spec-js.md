# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
  - Installed jquery-rails gem
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  - Dog show resource "Next Dog" button renders other dogs on same view.
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  - Event index resource uses jQuery to load additional information.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  - Event JSON has many Users.
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
  - Newly created event renders on the form page.
- [x] Translate JSON responses into js model objects.
  - Dog & Event objects are defined in dogs.js & events.js.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
  - Dog & Event objects both have two prototype methods ('isTrained', 'renderNext', 'renderNew', & 'renderMore')

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
