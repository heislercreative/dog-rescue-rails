# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#


admin_user = User.create(name: 'Admin', email: 'admin@railsdogrescue.com', password: 'testpw', admin: true)

Breed.create([{name: 'Golden Retriever'}, {name: 'Labrador Retriever'}, {name: 'Poodle'}, {name: 'Pit Bull'}, {name: 'Dachschund'}, {name: 'Maltese'}, {name: 'West Highland Terrier'}, {name: 'Yorkshire Terrier'}])

admin_user.dogs.create([
  {name: 'Humphrey', age: 5, gender: 'Male', trained: true, fee: 250, description: 'Civilized, but beware of squirrels.', breed_id: 7},

  {name: 'Ranger', age: 10.5, gender: 'Male', trained: false, fee: 200, description: 'Still a puppy at heart, despite his size.', breed_id: 1},

  {name: 'Skye', age: 8, gender: 'Female', trained: false, fee: 175, description: 'Quiet, gentle, and loving.', breed_id: 7},

  {name: 'Slinky', age: 2, gender: 'Male', trained: true, fee: 150, description: 'A kind puppy with plenty of energy and room for fun.', breed_id: 5},

  {name: 'Fluffy', age: 4.5, gender: 'Female', trained: true, fee: 275, description: 'Fancy and well-groomed.', breed_id: 3},

  {name: 'Spark', age: 7, gender: 'Male', trained: false, fee: 200, description: 'Rambunctious but well-behaved.', breed_id: 8},

  {name: 'Bella', age: 3, gender: 'Female', trained: true, fee: 225, description: 'Loves naps and evening walks.', breed_id: 6},

  {name: 'Buddy', age: 6.5, gender: 'Male', trained: true, fee: 225, description: 'Loves to play; great at fetch.', breed_id: 1},

])

User.create([
  {name: 'John Testerson', email: 'jt@test.com', password: 'testpw1', admin: false},

  {name: 'Cesar Milan', email: 'cesar@test.com', password: 'testpw2', admin: false}
  ])

Event.create([

  {title: 'Obedience Training 101', description: "Bring your adopted dog to this free 3-hour seminar on the basics of obedience training and positive reinforcment. Only for dogs adopted from our shelter.", date: "2018-07-21 00:00:00", start_time: "2018-07-21 9:00:00", end_time: "2018-07-21 12:00:00", organizer_id: 1},

  {title: 'Adoption Fair', description: "Come get to meet our dogs in person, learn about our shelter, and enjoy summer refreshments. Same-day adoption available!", date: "2018-08-10 00:00:00", start_time: "2018-08-10 10:00:00", end_time: "2018-08-10 16:00:00", organizer_id: 1},

  {title: 'Cleanup Day', description: "Bring your least favorite clothes. We can promise it's going to be messy. Trust us.", date: "2018-08-27 00:00:00", start_time: "2018-08-27 13:00:00", end_time: "2018-08-27 15:30:00", organizer_id: 1},

  {title: 'Preparing for Y2K', description: "Help us stock up on canned goods and apocalypse food buckets. One can never be too prepared.", date: "1999-12-30 00:00:00", start_time: "1999-12-30 12:00:00", end_time: "1999-12-30 16:00:00", organizer_id: 1}
])
