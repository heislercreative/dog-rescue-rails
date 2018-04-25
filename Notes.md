Dog Rescue

Models
  User
    - shelter (admin)
    - volunteers/adopters
    [x] has_many Dogs
    has_many Events
    has_many Tasks through Events
  Dog
    - name
    - age (in years)
    - gender (T: male, F: female)
    - potty/crate trained
    - adoption fee
    [x] belongs_to user (shelter or adopter)
    [x] belongs_to Breed
  Breed
    [x] has_many Dogs
  Event
    belongs_to User
    has_many Tasks
  Task
    belongs_to Dog
