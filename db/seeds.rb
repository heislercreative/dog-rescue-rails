# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#


admin_user = User.create(name: 'Admin', email: 'admin@railsdogrescue.com', password: 'testpw', admin: true)
Breed.create([{name: 'Golden Retriever'}, {name: 'West Highland Terrier'}, {name: 'Yorkshire Terrier'}])

admin_user.dogs.create([
  {name: 'Ranger', age: 10.5, gender: 'Male', trained: false, fee: 200, description: 'Still a puppy at heart, despite his size.', breed_id: 1},

  {name: 'Humphrey', age: 5, gender: 'Male', trained: true, fee: 250, description: 'Civilized, but beware of squirrels.', breed_id: 2},

  {name: 'Skye', age: 8, gender: 'Female', trained: false, fee: 175, description: 'Quiet, gentle, and loving.', breed_id: 2}
])

Event.create(title: 'Cleanup Day', description: "Bring your least favorite clothes. We can promise it's going to be messy. Trust us.", date: "2018-05-04 00:0
0:00", start_time: "2018-05-04 13:0
0:00", end_time: "2018-05-04 15:3
0:00", organizer_id: 1)
