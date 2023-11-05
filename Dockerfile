FROM elixir:1.15-slim

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
RUN mix setup

EXPOSE 4000
CMD [ "mix phx.server"]
