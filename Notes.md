Dog Rescue

Models
  User
    - shelter (admin)
    - volunteers/adopters
    [x] has_many Dogs
    [x] has_many Events
    [x] has_many Events through User_Events
  Dog
    - name
    - age (in years)
    - gender (M or F - will need custom validator)
    - potty/crate trained
    - adoption fee
    [x] belongs_to user (shelter or adopter)
    [x] belongs_to Breed
  Breed
    [x] has_many Dogs
  Event
    [x] has_many Users through User_Events


  ToDo (once User model & login set up)
    [] 'Adopt' button (form)
    [] 'Attend' button (form)
