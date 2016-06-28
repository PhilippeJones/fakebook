# FAKEBOOK

A tiny social network for LAN, built in Rails.




## Setup

### Requirements

- Ruby, Rails
- Postgres
- Image Magick

### Database

Assuming you have Postgres up and running, from the project directory run:

```
$ rake db:create
$ rake db:schema:load
```

If the latter causes issues, run:

```
$ rake db:migrate
```

### Faye Server

To support the real-time posting and syncing there's a worker running on a separate Faye server. Configure development and production environments to use the local IP of the server machine instead of 'localhost'.

To start the From the project directory run:
```
$ rackup sync.ru -E production -o 0.0.0.0
```

## Known Issues

- No error messages, or any flash messages besides welcome messages
- Paging doesn't work on comments
- No admin