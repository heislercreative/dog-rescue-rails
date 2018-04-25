Dog Rescue

Models
  User
    - shelter (admin)
    - volunteers/adopters
    [x] has_many Dogs
    [x] has_many Events
    [x] has_many Tasks through Events
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
    [x] belongs_to User
    [x] has_many Tasks
  Task
    [x] belongs_to Event
