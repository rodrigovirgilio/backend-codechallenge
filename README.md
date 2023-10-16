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


# Validate the challenge

## Rake to generate token for API authentication:
```ruby
  $ bundle exec rails generate_token:authenticate
```
## Steps to perform the tasks

## Generate token for API authentication in terminal:

### 1) By rake task
```ruby
  $ bundle exec rake generate_token:authenticate
  Authentication successfully created
  fd4bb99af1988ba52deb7ff2d7517ac6
```

![Screenshot 2023-10-14 at 17 20 19](https://github.com/rodrigovirgilio/backend-codechallenge/assets/392677/d016febe-6bf1-43bf-a8f9-17fc190aaf05)


### 2) Or by terminal
```ruby
  $ bundle exec rails c
  $ auth = Authentication.create(name: "Authentication", token: SecureRandom.hex)
  auth.token
  "fd4bb99af1988ba52deb7ff2d7517ac6"
```

## User management by API:

### API Create User
### POST /api/v1/users

```bash
curl --request POST \
  --url 'http://localhost:8000/api/v1/users?first_name=First%20Name&last_name=Last%20Name' \
  --header 'Authorization: fd4bb99af1988ba52deb7ff2d7517ac6' \
  --header 'Content-Type: application/json'
```

#### 201 - Created

![Screenshot 2023-10-14 at 17 23 15](https://github.com/rodrigovirgilio/backend-codechallenge/assets/392677/04a89bd6-e453-460a-a55e-05eb14bb1862)


#### 401 - Unauthorized

![Screenshot 2023-10-14 at 17 23 31](https://github.com/rodrigovirgilio/backend-codechallenge/assets/392677/1251a0cc-049b-4a26-81e3-1dc95d64abae)


#### 422 - Unprocessable Entity

![Screenshot 2023-10-14 at 17 23 42](https://github.com/rodrigovirgilio/backend-codechallenge/assets/392677/093a5874-1a57-45bb-965a-0ac4bd726a7c)


### API List users
### GET /api/v1/users

```bash
curl --request GET \
  --url http://localhost:8000/api/v1/users \
  --header 'Authorization: afefb430a52f4de50350e57068e25837' \
  --header 'Content-Type: application/json'
```

#### 200 - OK

![Screenshot 2023-10-16 at 13 41 38](https://github.com/rodrigovirgilio/backend-codechallenge/assets/392677/679996e5-46ca-4a23-b95c-013a14cc5d4a)


#### 401 - Unauthorized

![Screenshot 2023-10-16 at 13 41 53](https://github.com/rodrigovirgilio/backend-codechallenge/assets/392677/127a17f3-c84f-48e2-9616-eb7a21d70227)


## Documentation API - http://localhost:8000/api-doc

![Screenshot 2023-10-16 at 13 55 27](https://github.com/rodrigovirgilio/backend-codechallenge/assets/392677/7c923a63-79f7-489e-9368-250fd3e95ac7)
![Screenshot 2023-10-16 at 13 52 31](https://github.com/rodrigovirgilio/backend-codechallenge/assets/392677/1c84cc4a-2a99-4da8-81f5-0d350fc5a552)
![Screenshot 2023-10-16 at 13 52 16](https://github.com/rodrigovirgilio/backend-codechallenge/assets/392677/9eca491a-8f4d-4fb6-9364-d83d692f72b1)

