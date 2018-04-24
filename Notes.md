Dog Rescue

Models
  User
    - shelter
    - volunteers
    - adopters
    has_many Dogs
    has_many Events
    has_many Tasks through Events
  Dog
    - name
    - age
    - potty/crate trained
    - adoption fee
    belongs_to user (shelter or adopter)
    belongs_to Breed
  Breed
    has_many Dogs
  Event
    belongs_to User
    has_many Tasks
  Task
    belongs_to Dog
