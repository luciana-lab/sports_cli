# Sports CLI

In this application, the user can interact by choosing the location to see the sports list available in the city selected. The user can also choose
a sport in the list to see more information.

**About The User**\

*Who is the User?*\
Anyone who is looking for a physical activity available in a certain area.

*What is their pain point?*\
The user wants to practice an activity but doesn’t know all options available in the area.

*How do they use our solution to overcome this problem?*\
This CLI app shows all the options available and its description in just one tool. Making it easier for the user to choose which one better fits what he/she is looking for.

**About The APP**\

*What this app do? What is the user experience?*\
Based on the location that the user chooses, it shows the sports available in this city selected. The user can select an activity to see more information about it.

*Where is the data from?*\
This app used two APIs.
* [OpenCage](https://opencagedata.com)* transforms the city name input by the user into a longitude and latitude (required by Decathlon Developers API) and passes the coordinates to the Decathlon Developers.
* [DecathlonDevelopers](https://developers.decathlon.com/products/sports/docs) shows the sports activities available
in the coordinate selected. In this app, the API Reference used was 'Location based reccommendations'.

\* This API requires a key.

*What to do with the data?*\
The user needs to choose the location that will display the sports list. Once it shows up, the user can choose to see more information about a specific sport.
The user can also choose to exit, go back to the list to select another sport or change the location.

*How many classes exist?*\
3 Classes:
1. API.rb is responsible for getting all the data necessary, for making a call to the APIs, and for creating a new Object with that data.
2. CLI.rb is responsible for communicating between the user and the data.
3. Sports.rb is responsible for the Objects that will show to the user.

**Flow Diagram**\
For a better understanding, click [here](https://drive.google.com/file/d/1ANF-wdZSBUzcaaAP-_1v8IyzyyTTS5WU/view?usp=sharing) to view the diagram flow of this app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sports_cli'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sports_cli

Please, get an API Key from [OpenCage](https://opencagedata.com/) to transform the user's 'city' into a 'longitude' and 'latitude'.

Create a .env file with the following key:
```
GEO_KEY=[YOUR KEY HERE]
```

Make sure your Gemfile includes:
```
$ gem 'opencage-geocoder'
```
## Usage

To run the application use `ruby bin/run`

## Contributing

This project is intended to be a safe and welcoming space for collaboration.
Bug reports and pull requests are welcome on GitHub at https://github.com/luciana-lab/sports_cli.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sports CLI project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/sports_cli/blob/master/CODE_OF_CONDUCT.md).

## Videos
30 minutes video coding [here](https://youtu.be/-cDJmhXAYJw)