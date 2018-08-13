# Dog Rescue Shelter

This Rails app serves as an interface between shelter staff, volunteer workers, and prospective adopters. It allows admin staff to add adoptable dogs, users to adopt, and all users to create and attend shelter events.

## Installation & Usage

To start using the app, clone the repository, run `bundle` to install all necessary gems, `rake db:migrate` to create the database tables, and `thin start --ssl` to launch the web server. Navigate to https://localhost:3000 to view the app.

To load demo content, run `rake db:seed` before viewing in the browser.

### Signup/Login
- Visit the Sign Up page to create a new account or sign up with Facebook Omniauth.
- The first user signed up will become the shelter admin (able to edit/delete other user accounts).
- If account already exists, visit the Log In page.

### Shelter Admin
- The shelter admin user (account 1) can edit users' admin statuses and delete users on the Users page.
- All new dogs added to the system "belong to" the shelter admin account.

### Other Admin
- Once made an admin account by the shelter admin, these users can edit/delete adoptable dogs and breed information.

### General Users
- Registered users may view adoptable dogs and choose to adopt, transferring "ownership" from shelter admin.
- All users can create/edit/delete events, as well as choose to attend or unattend them.
- All users are presented with a home view to view their dogs and upcoming events.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/heislercreative/dog-rescue-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Dermatology Treatment App project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/heislercreative/dog-rescue-rails/blob/master/CODE_OF_CONDUCT.md).
