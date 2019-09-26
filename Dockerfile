FROM ruby:2.5

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && apt-get install -y

# Update and install deps
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Require Awesome Print on irb
RUN echo "require 'awesome_print' \nAwesomePrint.irb!" >> ~/.irbrc

WORKDIR /goals
COPY Gemfile /goals/Gemfile
COPY Gemfile.lock /goals/Gemfile.lock
RUN bundle install
COPY . /goals

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" ]