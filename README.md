# Priority Queue with Twilio TaskRouter

This is an example application that creates a priority based call centre using [Twilio TaskRouter](https://www.twilio.com/taskrouter).

You can read a full introduction to this app on the [Twilio blog](https://www.twilio.com/blog).

## In brief

This application sets up a priority call queue based on TaskRouter. Calls from one phone number go into the queue with a priority of 1, calls from a priority phone number go into the queue with a priority of 2. TaskRouter will then assign those calls to available agents in priority order.

The `/call` endpoint is the webhook for the Twilio phone numbers. It adds calls to the queue.

The `/assignment` endpoint is the webhook for the TaskRouter. It receives assignment instructions from TaskRouter for the available Workers. The `dequeue` instruction connects the queued call to the available Worker.

## Running the app

Clone the application and install the dependencies with

```shell
$ bundle install
```

Copy `config/env.yml.example` to `config/env.yml`

```shell
$ cp config/env.yml.example config/env.yml
```

Fill in your credentials the config file. Then run the application with:

```shell
$ bundle exec rackup
```
