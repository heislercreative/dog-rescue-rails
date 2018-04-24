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
    belongs_to user (shelter or adopter)
  Event
    belongs_to User
    has_many Tasks
  Task
    belongs_to Dog
