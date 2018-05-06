# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Breed has_many Dogs, User has_many Dogs)
- [x] Include at least one belongs_to relationship (Dog belongs_to User and Breed)
- [x] Include at least one has_many through relationship (Event has_many Users through UsersEvents & vice-versa)
- [ ] The "through" part of the has_many through includes at least one user submittable attribute (User, as organizer, submits all Event attributes, i.e. title, date, time, description)
- [x] Include reasonable validations for simple model objects (validations for all models except UserEvent)
- [x] Include a class level ActiveRecord scope method (Event 'past' class method - /event/past)
- [x] Include signup (through users#create)
- [x] Include login (through sessions#create)
- [x] Include logout (through sessions#destroy)
- [x] Include third party signup/login (OmniAuth-Facebook)
- [x] Include nested resource show or index (/users/1/events/1)
- [x] Include nested resource "new" form (/users/1/events/new)
- [x] Include form display of validation errors (signup, login, & new: Users, Dogs, Events)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
