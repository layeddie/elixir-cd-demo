WIP demo of using docker containers (since at the time of writing semaphoreci uses elixir v1.8 adn erlang 21) to run tests and build releases with elixir v1.9 and erlang 22. 

To keep the tests fast (the whole [default pipeline](https://github.com/syfgkjasdkn/elixir-cd-demo/blob/master/.semaphore/semaphore.yml) finishes in ~40 seconds), I'm using a custom [alpine elixir image](https://github.com/syfgkjasdkn/dockerfiles/blob/master/elixir-ci/alpine/1.9/Dockerfile) which weighs little and is downloaded in five seconds. It's based on `elixir:1.9-alpine` but with some dependencies that semaphoreci's utilities like `cache` use (`lftp`, for example).

The release is then built using a [debian-based elixir image](https://github.com/syfgkjasdkn/dockerfiles/blob/master/elixir-ci/node/1.9/Dockerfile) with node and yarn installed. The release is then pushed to a VM running ubuntu 18.04, so far it's been working fine. This takes about a minute.
