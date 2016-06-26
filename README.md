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

To support the real-time posting and syncing there's a worker running on a separate Faye server. From the project directory simply run:
```
$ rackup sync.ru -E production
```

## Known Issues

- AJAX doesn't seem to work on remote devices