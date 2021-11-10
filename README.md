# Rnters - Backend Code Challenge

If you are reading this, you probably have interviewed or chatted with someone on the team at Rnters. This is our standard "toy" project we normally like to work on together to see how you think about problems, model them, and make decisions. If you stumbled upon this project randomly and want to give it a shot, please feel free to fork the project and hack away. We would love to see what you come up with.

An initial version of this project should be doable in well under 2 hours, but has many facets that could be improved beyond that inital cut. And although we are providing you with most of the boilerplate so you can focus on the requested functionalities, it has many facets that could be improved beyond that initial cut.

## Challenge
We are looking for an API-based application that exposes an API entry to create users with a first and last name. The twist - after 30seconds that user will grow a mustache, and the 🥸 emoji will be added to his last name. E.g. if I create the user "Quim Barreiros", after 30 seconds I will see that his name is "Quim Barreiros 🥸". Thats it!

#### Users
User table should have the following attributes:
- `first_name`
- `last_name`
- `admin`

#### API
Should have the following endpoint:
- `POST /api/v1/users` with the params `first_name` and `last_name`
- Should return `202 (Created)` if successful and the appropriate error otherwise


## How to run
You'll need to have [Docker installed](https://docs.docker.com/get-docker/). Fork and clone this repo into your computer.

After that you can simply run the web version so you can use curl: `docker-compose up`

Or you can run the console version: `docker-compose run --rm console`


## How to test
We provide you with a simple test by running:
```
$ docker-compose run --rm console
> rspec spec/request/user_spec.rb
```

You can also run the environment and curl against it
```
$ docker-compose up web
# in another terminal
$ curl -v -X POST 'http://127.0.0.1:8000/api/v1/users' -d '{"first_name": "Quim", "last_name": "Barreiros" }' -H "Content-Type: application/json"
```

You can also check sidekiq admin through:
`http://127.0.0.1:8000/sidekiq`