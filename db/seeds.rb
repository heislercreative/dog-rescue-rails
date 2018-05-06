# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#


admin_user = User.create(name: 'Admin', email: 'admin@railsdogrescue.com', password: 'testpw', admin: true)

Breed.create([{name: 'Golden Retriever'}, {name: 'Labrador Retriever'}, {name: 'Poodle'}, {name: 'Pit Bull'}, {name: 'Dachschund'}, {name: 'Maltese'}, {name: 'West Highland Terrier'}, {name: 'Yorkshire Terrier'}])

admin_user.dogs.create([
  {name: 'Ranger', age: 10.5, gender: 'Male', trained: false, fee: 200, description: 'Still a puppy at heart, despite his size.', breed_id: 1},

  {name: 'Humphrey', age: 5, gender: 'Male', trained: true, fee: 250, description: 'Civilized, but beware of squirrels.', breed_id: 2},

  {name: 'Slinky', age: 2, gender: 'Male', trained: true, fee: 150, description: 'A kind puppy with plenty of energy and room for fun.', breed_id: 2},

  {name: 'Skye', age: 8, gender: 'Female', trained: false, fee: 175, description: 'Quiet, gentle, and loving.', breed_id: 2}
])

User.create([
  {name: 'John Testerson', email: 'jt@test.com', password: 'testpw1', admin: false},

  {name: 'Cesar Milan', email: 'cesar@test.com', password: 'testpw2', admin: false}
  ])

Event.create(
  title: 'Cleanup Day', description: "Bring your least favorite clothes. We can promise it's going to be messy. Trust us.", date: "2018-05-04 00:00:00", start_time: "2018-05-04 13:00:00", end_time: "2018-05-04 15:30:00", organizer_id: 1
)
Event.create(
  title: 'Preparing for Y2K', description: "Help us stock up on canned goods and apocalypse food buckets. One can never be too prepared.", date: "1999-12-30 00:00:00", start_time: "1999-12-30 12:00:00", end_time: "1999-12-30 16:00:00", organizer_id: 1
)
