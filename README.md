# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

### Feature 1: Most Dangerous Day

```
Background:
* This story should use the Asteroids Neo - Feed: https://api.nasa.gov/api.html#neows-feed

Feature: A guest user visits the root page and enters a start date and end date. The resulting page will display the most dangerous day in that range based on which day has the most `is_potentially_dangerous_asteroid` set to `true`. Given the scenario below, it should be January 1, 2018 with 3 potentially dangerous asteroids.

As a guest user
When I visit "/"
And I enter "2018-01-01" into the start date
And I enter "2018-01-07" into the end date
And I click "Determine Most Dangerous Day"

Then I should be on "/most_dangerous_day"
And I should see a heading for "Most Dangerous Day"
And I should see "January 1, 2018 - January 7, 2018"
And I should see a heading for the most dangerous day in that range "January 1, 2018"
And I should see 3 asteroids in that list

And I should see "Name: (2014 KT76)"
And I should see "NEO Reference ID: 3672906"

And I should see "Name: (2001 LD)"
And I should see "NEO Reference ID: 3078262"

And I should see "Name: (2017 YR1)"
And I should see "NEO Reference ID: 3794979"
```

Page should look something like this:

![feature mockup](https://raw.githubusercontent.com/turingschool/assessment_challenges/master/_backend/3module_challenges/images/asteroids_mockup.png?token=AAEgYD-_-Wu_WFSB8w02D7FqLTOU2QtEks5bW33UwA%3D%3D)

### Feature 2: API - Retrieving a user's favorites

Background: This story assumes the base data from running `rake db:seed`. Registered user has an `api_key` of `abc123`.

```
As a registered user
When I send a 'GET' request to '/api/v1/user/favorites?api_key=abc123'
Then I should receive a JSON response as follows:
```

```
[
  {
    "id":1,
    "neo_reference_id": "2153306",
    "user_id": 1,
    "asteroid": {
      "name": "153306 (2001 JL1)",
      "is_potentially_hazardous_asteroid": false,
    }
  }
]
```

### Feature 3: API - Favoriting an Asteroid

Background: This story assumes the base data from running `rake db:seed`
This SHOULD NOT save the asteroid data into the database. Asteroid data should be returned from the NASA API. You should save the `neo_reference_id` in the favorites table.

```
When I send a POST request to "/api/v1/user/favorites" with an 'api_key' of 'abc123' and a 'neo_reference_id' of '2021277'
Then I should receive a response with a status code of 200
And the body should be JSON as follows:
```

```
{
  "id":2,
  "neo_reference_id": "2021277",
  "user_id": 1,
  "asteroid": {
    "name": "21277 (1996 TO5)",
    "is_potentially_hazardous_asteroid": false,
  }
}
```
